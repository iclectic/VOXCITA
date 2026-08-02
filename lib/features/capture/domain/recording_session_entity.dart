import 'package:voxcita/features/capture/domain/recording_session_status.dart';

class RecordingSessionEntity {
  RecordingSessionEntity({
    required this.id,
    required this.status,
    required this.startedAt,
    this.noteId,
    this.audioAssetId,
    this.endedAt,
    this.checkpointMs = 0,
    this.errorMessage,
  });

  final String id;
  final String? noteId;
  final String? audioAssetId;
  final RecordingSessionStatus status;
  final DateTime startedAt;
  final DateTime? endedAt;
  final int checkpointMs;
  final String? errorMessage;
}
