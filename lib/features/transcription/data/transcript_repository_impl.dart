import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import 'package:voxcita/core/database/voxcita_database.dart';
import 'package:voxcita/features/transcription/domain/transcript_repository.dart';
import 'package:voxcita/features/transcription/domain/transcript_segment_entity.dart';

class TranscriptRepositoryImpl implements TranscriptRepository {
  TranscriptRepositoryImpl(this._db, this._uuid);

  final VoxCitaDatabase _db;
  final Uuid _uuid;

  @override
  Future<TranscriptSegmentEntity> createSegment({
    required String noteId,
    required String audioAssetId,
    required int startMs,
    required int endMs,
    required String originalText,
    required String engineName,
    required String modelVersion,
    double? confidence,
    String? detectedLanguage,
    String? speakerLabel,
    String? processingSettings,
  }) async {
    final id = _uuid.v4();
    final now = DateTime.now().toUtc();

    await _db
        .into(_db.transcriptSegments)
        .insert(
          TranscriptSegmentsCompanion.insert(
            id: id,
            noteId: noteId,
            audioAssetId: audioAssetId,
            startMs: startMs,
            endMs: endMs,
            originalText: originalText,
            currentText: originalText,
            engineName: engineName,
            modelVersion: modelVersion,
            confidence: Value(confidence),
            detectedLanguage: Value(detectedLanguage),
            speakerLabel: Value(speakerLabel),
            processingSettings: Value(processingSettings),
            createdAt: now,
          ),
        );

    return TranscriptSegmentEntity(
      id: id,
      noteId: noteId,
      audioAssetId: audioAssetId,
      startMs: startMs,
      endMs: endMs,
      originalText: originalText,
      currentText: originalText,
      engineName: engineName,
      modelVersion: modelVersion,
      confidence: confidence,
      detectedLanguage: detectedLanguage,
      speakerLabel: speakerLabel,
      processingSettings: processingSettings,
      createdAt: now,
    );
  }

  @override
  Future<List<TranscriptSegmentEntity>> getSegmentsForNote(
    String noteId,
  ) async {
    final rows =
        await (_db.select(_db.transcriptSegments)
              ..where((s) => s.noteId.equals(noteId))
              ..orderBy([(s) => OrderingTerm.asc(s.startMs)]))
            .get();
    return rows.map(_mapToEntity).toList();
  }

  @override
  Future<void> correctSegment({
    required String segmentId,
    required String correctedText,
  }) async {
    final segment = await (_db.select(
      _db.transcriptSegments,
    )..where((s) => s.id.equals(segmentId))).getSingle();

    await _db.transaction(() async {
      await _db
          .into(_db.transcriptRevisions)
          .insert(
            TranscriptRevisionsCompanion.insert(
              id: _uuid.v4(),
              segmentId: segmentId,
              previousText: segment.currentText,
              correctedText: correctedText,
              revisedAt: DateTime.now().toUtc(),
            ),
          );

      await (_db.update(
        _db.transcriptSegments,
      )..where((s) => s.id.equals(segmentId))).write(
        TranscriptSegmentsCompanion(currentText: Value(correctedText)),
      );
    });
  }

  @override
  Future<void> deleteSegmentsForNote(String noteId) async {
    await (_db.delete(
      _db.transcriptSegments,
    )..where((s) => s.noteId.equals(noteId))).go();
  }

  TranscriptSegmentEntity _mapToEntity(TranscriptSegment row) {
    return TranscriptSegmentEntity(
      id: row.id,
      noteId: row.noteId,
      audioAssetId: row.audioAssetId,
      startMs: row.startMs,
      endMs: row.endMs,
      originalText: row.originalText,
      currentText: row.currentText,
      confidence: row.confidence,
      detectedLanguage: row.detectedLanguage,
      speakerLabel: row.speakerLabel,
      engineName: row.engineName,
      modelVersion: row.modelVersion,
      processingSettings: row.processingSettings,
      createdAt: row.createdAt,
    );
  }
}
