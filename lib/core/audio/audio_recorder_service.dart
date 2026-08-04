abstract interface class AudioRecorderService {
  Future<bool> hasPermission();

  Future<bool> requestPermission();

  Future<void> start(String filePath);

  Future<void> pause();

  Future<void> resume();

  Future<RecordingResult> stop();

  Future<void> cancel();

  Stream<AmplitudeSample> amplitudeStream();

  bool get isRecording;

  bool get isPaused;
}

class AmplitudeSample {
  const AmplitudeSample({required this.current, required this.max});

  final double current;
  final double max;
}

class RecordingResult {
  const RecordingResult({
    required this.path,
    required this.durationMs,
    required this.fileSizeBytes,
  });

  final String path;
  final int durationMs;
  final int fileSizeBytes;
}

enum RecordingExceptionType {
  permissionDenied,
  alreadyRecording,
  notRecording,
  encoderError,
  unknown,
}

class RecordingException implements Exception {
  const RecordingException(this.type, [this.message]);

  final RecordingExceptionType type;
  final String? message;

  @override
  String toString() {
    final msg = message != null ? ': $message' : '';
    return 'RecordingException($type$msg)';
  }
}
