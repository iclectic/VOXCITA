import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import 'package:voxcita/core/database/voxcita_database.dart';
import 'package:voxcita/features/feedback/domain/feedback_entity.dart';

class FeedbackRepository {
  FeedbackRepository(this._db, this._uuid);

  final VoxCitaDatabase _db;
  final Uuid _uuid;

  Future<FeedbackEntity> create({
    required FeedbackType feedbackType,
    String? claimId,
    String? feedbackDetail,
  }) async {
    final id = _uuid.v4();
    final now = DateTime.now().toUtc();

    await _db
        .into(_db.userFeedback)
        .insert(
          UserFeedbackCompanion.insert(
            id: id,
            claimId: Value(claimId),
            feedbackType: feedbackType.name,
            feedbackDetail: Value(feedbackDetail),
            createdAt: now,
          ),
        );

    return FeedbackEntity(
      id: id,
      claimId: claimId,
      feedbackType: feedbackType,
      feedbackDetail: feedbackDetail,
      createdAt: now,
    );
  }

  Future<List<FeedbackEntity>> getAll() async {
    final rows = await (_db.select(
      _db.userFeedback,
    )..orderBy([(t) => OrderingTerm.desc(t.createdAt)])).get();
    return rows.map(_mapToEntity).toList();
  }

  Future<FeedbackEntity?> getFeedbackForClaim(String claimId) async {
    final rows =
        await (_db.select(_db.userFeedback)
              ..where((t) => t.claimId.equals(claimId))
              ..limit(1))
            .get();
    if (rows.isEmpty) return null;
    return _mapToEntity(rows.first);
  }

  Future<List<FeedbackEntity>> getFeedbackForClaimList(String claimId) async {
    final rows =
        await (_db.select(_db.userFeedback)
              ..where((t) => t.claimId.equals(claimId))
              ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
            .get();
    return rows.map(_mapToEntity).toList();
  }

  Future<void> delete(String id) async {
    await (_db.delete(_db.userFeedback)..where((t) => t.id.equals(id))).go();
  }

  Future<void> clearAll() async {
    await _db.delete(_db.userFeedback).go();
  }

  FeedbackEntity _mapToEntity(UserFeedbackData row) {
    return FeedbackEntity(
      id: row.id,
      claimId: row.claimId,
      feedbackType: FeedbackType.values.firstWhere(
        (t) => t.name == row.feedbackType,
        orElse: () => FeedbackType.suggestion,
      ),
      feedbackDetail: row.feedbackDetail,
      createdAt: row.createdAt,
    );
  }
}
