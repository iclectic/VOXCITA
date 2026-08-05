import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uuid/uuid.dart';
import 'package:voxcita/core/database/fake_data.dart';
import 'package:voxcita/core/database/voxcita_database.dart';
import 'package:voxcita/features/analytics/domain/analytics_service.dart';

void main() {
  late VoxCitaDatabase db;
  late AnalyticsService service;

  setUp(() async {
    db = VoxCitaDatabase.forTesting(NativeDatabase.memory());
    service = AnalyticsService(db);
  });

  tearDown(() async => db.close());

  group('AnalyticsService', () {
    test('getMetrics returns zeros for empty database', () async {
      final metrics = await service.getMetrics();

      expect(metrics.noteCount, 0);
      expect(metrics.voiceNoteCount, 0);
      expect(metrics.textNoteCount, 0);
      expect(metrics.transcriptSegmentCount, 0);
      expect(metrics.insightCount, 0);
      expect(metrics.askHistoryCount, 0);
      expect(metrics.feedbackCount, 0);
      expect(metrics.audioAssetCount, 0);
      expect(metrics.recordingSessionCount, 0);
      expect(metrics.collectionCount, 0);
      expect(metrics.tagCount, 0);
      expect(metrics.totalInteractions, 0);
    });

    test('getMetrics returns correct counts after seeding', () async {
      final fakeData = FakeData(const Uuid());
      await fakeData.seedAll(db);

      final metrics = await service.getMetrics();

      expect(metrics.noteCount, greaterThan(0));
      expect(metrics.transcriptSegmentCount, greaterThan(0));
      expect(metrics.insightCount, greaterThan(0));
      expect(metrics.askHistoryCount, greaterThan(0));
      expect(metrics.feedbackCount, greaterThan(0));
      expect(metrics.audioAssetCount, greaterThan(0));
      expect(metrics.recordingSessionCount, greaterThan(0));
      expect(
        metrics.totalInteractions,
        metrics.noteCount +
            metrics.insightCount +
            metrics.askHistoryCount +
            metrics.feedbackCount,
      );
    });

    test('getMetrics distinguishes voice and text notes', () async {
      final fakeData = FakeData(const Uuid());
      await fakeData.seedAll(db);

      final metrics = await service.getMetrics();

      expect(metrics.voiceNoteCount + metrics.textNoteCount, metrics.noteCount);
    });

    test('totalInteractions sums correct fields', () async {
      final fakeData = FakeData(const Uuid());
      await fakeData.seedAll(db);

      final metrics = await service.getMetrics();

      expect(
        metrics.totalInteractions,
        metrics.noteCount +
            metrics.insightCount +
            metrics.askHistoryCount +
            metrics.feedbackCount,
      );
    });
  });

  group('AnalyticsMetrics', () {
    test('totalInteractions is zero for all-zero metrics', () {
      const metrics = AnalyticsMetrics(
        noteCount: 0,
        voiceNoteCount: 0,
        textNoteCount: 0,
        transcriptSegmentCount: 0,
        insightCount: 0,
        askHistoryCount: 0,
        feedbackCount: 0,
        audioAssetCount: 0,
        recordingSessionCount: 0,
        collectionCount: 0,
        tagCount: 0,
      );

      expect(metrics.totalInteractions, 0);
    });

    test('totalInteractions sums non-zero values', () {
      const metrics = AnalyticsMetrics(
        noteCount: 5,
        voiceNoteCount: 3,
        textNoteCount: 2,
        transcriptSegmentCount: 10,
        insightCount: 4,
        askHistoryCount: 2,
        feedbackCount: 1,
        audioAssetCount: 3,
        recordingSessionCount: 3,
        collectionCount: 1,
        tagCount: 2,
      );

      expect(metrics.totalInteractions, 12); // 5 + 4 + 2 + 1
    });
  });
}
