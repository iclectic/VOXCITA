import 'package:voxcita/features/capture/domain/audio_asset_entity.dart';
import 'package:voxcita/features/capture/domain/recording_session_entity.dart';

abstract interface class AudioRepository {
  Future<AudioAssetEntity> createAudioAsset({
    required String relativePath,
    required int durationMs,
    required int fileSizeBytes,
    required String sha256Hash,
    String mimeType,
    String? waveformJson,
    bool isOriginal,
    String? derivedFromId,
  });

  Future<AudioAssetEntity?> getAudioAssetById(String id);

  Future<void> deleteAudioAsset(String id);

  Future<RecordingSessionEntity> createRecordingSession();

  Future<RecordingSessionEntity?> getRecordingSessionById(String id);

  Future<List<RecordingSessionEntity>> getAbandonedSessions();

  Future<void> updateSessionStatus(
    String id,
    String status, {
    String? audioAssetId,
    String? noteId,
    DateTime? endedAt,
    int? checkpointMs,
    String? errorMessage,
  });
}
