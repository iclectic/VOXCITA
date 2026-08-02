class TranscriptSegmentEntity {
  TranscriptSegmentEntity({
    required this.id,
    required this.noteId,
    required this.audioAssetId,
    required this.startMs,
    required this.endMs,
    required this.originalText,
    required this.currentText,
    required this.engineName,
    required this.modelVersion,
    required this.createdAt,
    this.confidence,
    this.detectedLanguage,
    this.speakerLabel,
    this.processingSettings,
  });

  final String id;
  final String noteId;
  final String audioAssetId;
  final int startMs;
  final int endMs;
  final String originalText;
  final String currentText;
  final double? confidence;
  final String? detectedLanguage;
  final String? speakerLabel;
  final String engineName;
  final String modelVersion;
  final String? processingSettings;
  final DateTime createdAt;

  bool get isCorrected => originalText != currentText;
}
