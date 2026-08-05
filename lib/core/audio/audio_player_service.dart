abstract interface class AudioPlayerService {
  Future<void> loadFile(String absolutePath);

  Future<void> play();

  Future<void> pause();

  Future<void> stop();

  Future<void> seek(Duration position);

  Stream<bool> get playingStream;

  Stream<Duration> get positionStream;

  Stream<Duration?> get durationStream;

  Stream<PlayerError?> get errorStream;

  bool get isPlaying;

  Duration get position;

  Duration? get duration;

  Future<void> dispose();
}

class PlayerError {
  const PlayerError({required this.message, this.code});

  final String message;
  final String? code;
}
