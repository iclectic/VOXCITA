import 'package:voxcita/core/database/voxcita_database.dart';

class AnalyticsMetrics {
  const AnalyticsMetrics({
    required this.noteCount,
    required this.voiceNoteCount,
    required this.textNoteCount,
    required this.transcriptSegmentCount,
    required this.insightCount,
    required this.askHistoryCount,
    required this.feedbackCount,
    required this.audioAssetCount,
    required this.recordingSessionCount,
    required this.collectionCount,
    required this.tagCount,
  });

  final int noteCount;
  final int voiceNoteCount;
  final int textNoteCount;
  final int transcriptSegmentCount;
  final int insightCount;
  final int askHistoryCount;
  final int feedbackCount;
  final int audioAssetCount;
  final int recordingSessionCount;
  final int collectionCount;
  final int tagCount;

  int get totalInteractions =>
      noteCount + insightCount + askHistoryCount + feedbackCount;
}

class AnalyticsService {
  AnalyticsService(this._db);

  final VoxCitaDatabase _db;

  Future<AnalyticsMetrics> getMetrics() async {
    final notes = await _db.select(_db.notes).get();
    final voiceNoteCount = notes.where((n) => n.noteType == 'voice').length;
    final textNoteCount = notes.length - voiceNoteCount;

    final segments = await _db.select(_db.transcriptSegments).get();
    final insights = await _db.select(_db.insightClaims).get();
    final askHistory = await _db.select(_db.askHistory).get();
    final feedback = await _db.select(_db.userFeedback).get();
    final audioAssets = await _db.select(_db.audioAssets).get();
    final sessions = await _db.select(_db.recordingSessions).get();
    final collections = await _db.select(_db.collections).get();
    final tags = await _db.select(_db.tags).get();

    return AnalyticsMetrics(
      noteCount: notes.length,
      voiceNoteCount: voiceNoteCount,
      textNoteCount: textNoteCount,
      transcriptSegmentCount: segments.length,
      insightCount: insights.length,
      askHistoryCount: askHistory.length,
      feedbackCount: feedback.length,
      audioAssetCount: audioAssets.length,
      recordingSessionCount: sessions.length,
      collectionCount: collections.length,
      tagCount: tags.length,
    );
  }

  Future<int> getFeedbackBreakdown(FeedbackFilter filter) async {
    final feedback = await _db.select(_db.userFeedback).get();
    return feedback.where((f) => f.feedbackType == filter.name).length;
  }
}

enum FeedbackFilter { helpful, notHelpful, incorrect, suggestion }
