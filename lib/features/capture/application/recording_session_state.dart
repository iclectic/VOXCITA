import 'package:voxcita/features/capture/domain/recording_session_status.dart';

class RecordingSessionState {
  const RecordingSessionState({
    this.status = RecordingSessionStatus.created,
    this.sessionId,
    this.elapsedMs = 0,
    this.amplitude = 0,
    this.maxAmplitude = 0,
    this.error,
  });

  final RecordingSessionStatus status;
  final String? sessionId;
  final int elapsedMs;
  final double amplitude;
  final double maxAmplitude;
  final String? error;

  bool get isRecording => status == RecordingSessionStatus.recording;
  bool get isPaused => status == RecordingSessionStatus.paused;
  bool get isIdle =>
      status == RecordingSessionStatus.created ||
      status == RecordingSessionStatus.completed ||
      status == RecordingSessionStatus.cancelled ||
      status == RecordingSessionStatus.failed;
  bool get hasError => error != null;

  RecordingSessionState copyWith({
    RecordingSessionStatus? status,
    String? sessionId,
    int? elapsedMs,
    double? amplitude,
    double? maxAmplitude,
    String? error,
  }) {
    return RecordingSessionState(
      status: status ?? this.status,
      sessionId: sessionId ?? this.sessionId,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      amplitude: amplitude ?? this.amplitude,
      maxAmplitude: maxAmplitude ?? this.maxAmplitude,
      error: error,
    );
  }
}
