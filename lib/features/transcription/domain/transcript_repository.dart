import 'package:voxcita/features/transcription/domain/transcript_segment_entity.dart';

abstract interface class TranscriptRepository {
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
  });

  Future<List<TranscriptSegmentEntity>> getSegmentsForNote(String noteId);

  Future<void> correctSegment({
    required String segmentId,
    required String correctedText,
  });

  Future<void> deleteSegmentsForNote(String noteId);
}
