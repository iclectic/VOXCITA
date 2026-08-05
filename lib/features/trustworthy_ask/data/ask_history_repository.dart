import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import 'package:voxcita/core/database/voxcita_database.dart';
import 'package:voxcita/features/trustworthy_ask/domain/ask_history_entity.dart';
import 'package:voxcita/features/trustworthy_ask/domain/ask_result_type.dart';

class AskHistoryRepository {
  AskHistoryRepository(this._db, this._uuid);

  final VoxCitaDatabase _db;
  final Uuid _uuid;

  Future<AskHistoryEntity> create({
    required String query,
    required AskResultType resultType,
    required String answerText,
    required double confidence,
    required List<String> sourceNoteIds,
    String? abstentionReason,
  }) async {
    final id = _uuid.v4();
    final now = DateTime.now().toUtc();

    await _db
        .into(_db.askHistory)
        .insert(
          AskHistoryCompanion.insert(
            id: id,
            query: query,
            resultType: resultType.name,
            answerText: answerText,
            confidence: Value(confidence),
            abstentionReason: Value(abstentionReason),
            sourceNoteIds: sourceNoteIds.join(','),
            createdAt: now,
          ),
        );

    return AskHistoryEntity(
      id: id,
      query: query,
      resultType: resultType,
      answerText: answerText,
      confidence: confidence,
      sourceNoteIds: sourceNoteIds,
      createdAt: now,
      abstentionReason: abstentionReason,
    );
  }

  Future<List<AskHistoryEntity>> getAll() async {
    final rows = await (_db.select(
      _db.askHistory,
    )..orderBy([(t) => OrderingTerm.desc(t.createdAt)])).get();
    return rows.map(_mapToEntity).toList();
  }

  Future<void> delete(String id) async {
    await (_db.delete(_db.askHistory)..where((t) => t.id.equals(id))).go();
  }

  Future<void> clearAll() async {
    await _db.delete(_db.askHistory).go();
  }

  AskHistoryEntity _mapToEntity(AskHistoryData row) {
    return AskHistoryEntity(
      id: row.id,
      query: row.query,
      resultType: AskResultType.values.firstWhere(
        (t) => t.name == row.resultType,
        orElse: () => AskResultType.noSources,
      ),
      answerText: row.answerText,
      confidence: row.confidence,
      sourceNoteIds: row.sourceNoteIds
          .split(',')
          .where((s) => s.isNotEmpty)
          .toList(),
      createdAt: row.createdAt,
      abstentionReason: row.abstentionReason,
    );
  }
}
