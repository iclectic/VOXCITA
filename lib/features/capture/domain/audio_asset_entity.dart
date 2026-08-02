class AudioAssetEntity {
  AudioAssetEntity({
    required this.id,
    required this.relativePath,
    required this.durationMs,
    required this.fileSizeBytes,
    required this.sha256Hash,
    required this.createdAt,
    this.mimeType = 'audio/m4a',
    this.waveformJson,
    this.isOriginal = true,
    this.derivedFromId,
  });

  final String id;
  final String relativePath;
  final String mimeType;
  final int durationMs;
  final int fileSizeBytes;
  final String sha256Hash;
  final String? waveformJson;
  final bool isOriginal;
  final String? derivedFromId;
  final DateTime createdAt;
}
