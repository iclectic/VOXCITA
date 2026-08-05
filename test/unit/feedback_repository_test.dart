import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uuid/uuid.dart';
import 'package:voxcita/core/database/voxcita_database.dart';
import 'package:voxcita/features/feedback/data/feedback_repository.dart';
import 'package:voxcita/features/feedback/domain/feedback_entity.dart';

void main() {
  late VoxCitaDatabase db;
  late FeedbackRepository repository;
  const uuid = Uuid();

  setUp(() async {
    db = VoxCitaDatabase.forTesting(NativeDatabase.memory());
    repository = FeedbackRepository(db, const Uuid());
  });

  tearDown(() async => db.close());

  Future<String> seedNoteAndClaim() async {
    final noteId = uuid.v4();
    final now = DateTime.now().toUtc();
    await db
        .into(db.notes)
        .insert(
          NotesCompanion.insert(
            id: noteId,
            noteType: 'voice',
            createdAt: now,
            updatedAt: now,
          ),
        );
    final claimId = uuid.v4();
    await db
        .into(db.insightClaims)
        .insert(
          InsightClaimsCompanion.insert(
            id: claimId,
            noteId: noteId,
            claimText: 'Test claim',
            claimType: 'summary',
            modelUsed: 'test-model',
            modelVersion: '1.0',
            promptVersion: '1.0',
            inputTranscriptHash: 'abc123',
            createdAt: now,
            updatedAt: now,
          ),
        );
    return claimId;
  }

  group('FeedbackType', () {
    test('has all expected values', () {
      expect(FeedbackType.values.length, 4);
      expect(FeedbackType.values, contains(FeedbackType.helpful));
      expect(FeedbackType.values, contains(FeedbackType.notHelpful));
      expect(FeedbackType.values, contains(FeedbackType.incorrect));
      expect(FeedbackType.values, contains(FeedbackType.suggestion));
    });

    test('displayName returns correct strings', () {
      expect(FeedbackType.helpful.displayName, 'Helpful');
      expect(FeedbackType.notHelpful.displayName, 'Not helpful');
      expect(FeedbackType.incorrect.displayName, 'Incorrect');
      expect(FeedbackType.suggestion.displayName, 'Suggestion');
    });
  });

  group('FeedbackEntity', () {
    test('hasDetail returns true for non-empty detail', () {
      final entity = FeedbackEntity(
        id: 'test-1',
        feedbackType: FeedbackType.helpful,
        createdAt: DateTime.now().toUtc(),
        feedbackDetail: 'Great insight',
      );
      expect(entity.hasDetail, isTrue);
    });

    test('hasDetail returns false for null detail', () {
      final entity = FeedbackEntity(
        id: 'test-1',
        feedbackType: FeedbackType.helpful,
        createdAt: DateTime.now().toUtc(),
      );
      expect(entity.hasDetail, isFalse);
    });

    test('hasDetail returns false for empty detail', () {
      final entity = FeedbackEntity(
        id: 'test-1',
        feedbackType: FeedbackType.helpful,
        createdAt: DateTime.now().toUtc(),
        feedbackDetail: '',
      );
      expect(entity.hasDetail, isFalse);
    });
  });

  group('FeedbackRepository', () {
    test('create inserts and returns entity', () async {
      final claimId = await seedNoteAndClaim();
      final entity = await repository.create(
        feedbackType: FeedbackType.helpful,
        claimId: claimId,
        feedbackDetail: 'Very helpful',
      );

      expect(entity.id, isNotEmpty);
      expect(entity.feedbackType, FeedbackType.helpful);
      expect(entity.claimId, claimId);
      expect(entity.feedbackDetail, 'Very helpful');
      expect(entity.hasDetail, isTrue);
    });

    test('create with null claimId works', () async {
      final entity = await repository.create(
        feedbackType: FeedbackType.suggestion,
      );

      expect(entity.claimId, isNull);
      expect(entity.feedbackType, FeedbackType.suggestion);
    });

    test('getAll returns all feedback sorted by createdAt desc', () async {
      await repository.create(feedbackType: FeedbackType.helpful);
      await Future<void>.delayed(const Duration(seconds: 1));
      await repository.create(feedbackType: FeedbackType.notHelpful);

      final all = await repository.getAll();
      expect(all.length, 2);
      expect(all.first.feedbackType, FeedbackType.notHelpful);
    });

    test('getFeedbackForClaim returns null when no feedback exists', () async {
      final result = await repository.getFeedbackForClaim('nonexistent');
      expect(result, isNull);
    });

    test('getFeedbackForClaim returns feedback for given claim', () async {
      final claimId = await seedNoteAndClaim();
      await repository.create(
        feedbackType: FeedbackType.helpful,
        claimId: claimId,
      );

      final result = await repository.getFeedbackForClaim(claimId);
      expect(result, isNotNull);
      expect(result!.feedbackType, FeedbackType.helpful);
      expect(result.claimId, claimId);
    });

    test('delete removes feedback by id', () async {
      final claimId = await seedNoteAndClaim();
      final entity = await repository.create(
        feedbackType: FeedbackType.helpful,
        claimId: claimId,
      );

      await repository.delete(entity.id);

      final all = await repository.getAll();
      expect(all, isEmpty);
    });

    test('clearAll removes all feedback', () async {
      await repository.create(feedbackType: FeedbackType.helpful);
      await repository.create(feedbackType: FeedbackType.suggestion);

      await repository.clearAll();

      final all = await repository.getAll();
      expect(all, isEmpty);
    });

    test('getFeedbackForClaimList returns all feedback for a claim', () async {
      final claimId = await seedNoteAndClaim();
      await repository.create(
        feedbackType: FeedbackType.helpful,
        claimId: claimId,
      );
      await Future<void>.delayed(const Duration(seconds: 1));
      await repository.create(
        feedbackType: FeedbackType.incorrect,
        claimId: claimId,
      );
      await repository.create(feedbackType: FeedbackType.suggestion);

      final result = await repository.getFeedbackForClaimList(claimId);
      expect(result.length, 2);
      expect(result.first.feedbackType, FeedbackType.incorrect);
    });
  });
}
