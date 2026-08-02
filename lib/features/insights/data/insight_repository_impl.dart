import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import 'package:voxcita/core/database/voxcita_database.dart';
import 'package:voxcita/features/insights/domain/insight_claim_entity.dart';
import 'package:voxcita/features/insights/domain/insight_repository.dart';
import 'package:voxcita/features/insights/domain/insight_type.dart';
import 'package:voxcita/features/insights/domain/verification_state.dart';

class InsightRepositoryImpl implements InsightRepository {
  InsightRepositoryImpl(this._db, this._uuid);

  final VoxCitaDatabase _db;
  final Uuid _uuid;

  @override
  Future<InsightClaimEntity> createClaim({
    required String noteId,
    required String claimText,
    required String claimType,
    required String modelUsed,
    required String modelVersion,
    required String promptVersion,
    required String inputTranscriptHash,
    required List<ClaimSourceInput> sources,
    double? supportScore,
    int? processingDurationMs,
  }) async {
    final claimId = _uuid.v4();
    final now = DateTime.now().toUtc();

    await _db.transaction(() async {
      await _db
          .into(_db.insightClaims)
          .insert(
            InsightClaimsCompanion.insert(
              id: claimId,
              noteId: noteId,
              claimText: claimText,
              claimType: claimType,
              modelUsed: modelUsed,
              modelVersion: modelVersion,
              promptVersion: promptVersion,
              inputTranscriptHash: inputTranscriptHash,
              supportScore: Value(supportScore),
              processingDurationMs: Value(processingDurationMs),
              createdAt: now,
              updatedAt: now,
            ),
          );

      for (final source in sources) {
        await _db
            .into(_db.claimSources)
            .insert(
              ClaimSourcesCompanion.insert(
                id: _uuid.v4(),
                claimId: claimId,
                transcriptSegmentId: source.transcriptSegmentId,
                audioStartMs: source.audioStartMs,
                audioEndMs: source.audioEndMs,
              ),
            );
      }
    });

    return InsightClaimEntity(
      id: claimId,
      noteId: noteId,
      claimText: claimText,
      claimType: InsightType.fromString(claimType),
      modelUsed: modelUsed,
      modelVersion: modelVersion,
      promptVersion: promptVersion,
      supportScore: supportScore,
      verificationState: VerificationState.needsReview,
      inputTranscriptHash: inputTranscriptHash,
      processingDurationMs: processingDurationMs,
      createdAt: now,
      updatedAt: now,
      sources: sources
          .map(
            (s) => ClaimSourceEntity(
              id: _uuid.v4(),
              claimId: claimId,
              transcriptSegmentId: s.transcriptSegmentId,
              audioStartMs: s.audioStartMs,
              audioEndMs: s.audioEndMs,
            ),
          )
          .toList(),
    );
  }

  @override
  Future<InsightClaimEntity?> getClaimById(String id) async {
    final claimRow = await (_db.select(
      _db.insightClaims,
    )..where((c) => c.id.equals(id))).getSingleOrNull();
    if (claimRow == null) return null;

    final sourceRows = await (_db.select(
      _db.claimSources,
    )..where((s) => s.claimId.equals(id))).get();

    return _mapToEntity(claimRow, sourceRows);
  }

  @override
  Future<List<InsightClaimEntity>> getClaimsForNote(String noteId) async {
    final claimRows =
        await (_db.select(_db.insightClaims)
              ..where((c) => c.noteId.equals(noteId))
              ..orderBy([(c) => OrderingTerm.desc(c.createdAt)]))
            .get();

    final result = <InsightClaimEntity>[];
    for (final claimRow in claimRows) {
      final sourceRows = await (_db.select(
        _db.claimSources,
      )..where((s) => s.claimId.equals(claimRow.id))).get();
      result.add(_mapToEntity(claimRow, sourceRows));
    }
    return result;
  }

  @override
  Future<void> updateVerificationState(
    String id,
    String verificationState,
  ) async {
    await (_db.update(_db.insightClaims)..where((c) => c.id.equals(id))).write(
      InsightClaimsCompanion(
        verificationState: Value(verificationState),
        updatedAt: Value(DateTime.now().toUtc()),
      ),
    );
  }

  @override
  Future<void> deleteClaim(String id) async {
    await _db.transaction(() async {
      await (_db.delete(
        _db.claimSources,
      )..where((s) => s.claimId.equals(id))).go();
      await (_db.delete(_db.insightClaims)..where((c) => c.id.equals(id))).go();
    });
  }

  InsightClaimEntity _mapToEntity(
    InsightClaim claimRow,
    List<ClaimSource> sourceRows,
  ) {
    return InsightClaimEntity(
      id: claimRow.id,
      noteId: claimRow.noteId,
      claimText: claimRow.claimText,
      claimType: InsightType.fromString(claimRow.claimType),
      modelUsed: claimRow.modelUsed,
      modelVersion: claimRow.modelVersion,
      promptVersion: claimRow.promptVersion,
      supportScore: claimRow.supportScore,
      verificationState: VerificationState.fromString(
        claimRow.verificationState,
      ),
      inputTranscriptHash: claimRow.inputTranscriptHash,
      processingDurationMs: claimRow.processingDurationMs,
      createdAt: claimRow.createdAt,
      updatedAt: claimRow.updatedAt,
      sources: sourceRows
          .map(
            (s) => ClaimSourceEntity(
              id: s.id,
              claimId: s.claimId,
              transcriptSegmentId: s.transcriptSegmentId,
              audioStartMs: s.audioStartMs,
              audioEndMs: s.audioEndMs,
            ),
          )
          .toList(),
    );
  }
}
