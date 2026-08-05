import 'dart:async';

import 'package:just_audio/just_audio.dart';
import 'package:voxcita/core/audio/audio_player_service.dart';

class AudioPlayerServiceImpl implements AudioPlayerService {
  AudioPlayerServiceImpl() : _player = AudioPlayer();

  final AudioPlayer _player;
  final _errorController = StreamController<PlayerError?>.broadcast();

  @override
  Future<void> loadFile(String absolutePath) async {
    try {
      await _player.setFilePath(absolutePath);
    } catch (e) {
      _errorController.add(PlayerError(message: e.toString()));
    }
  }

  @override
  Future<void> play() async {
    try {
      await _player.play();
    } catch (e) {
      _errorController.add(PlayerError(message: e.toString()));
    }
  }

  @override
  Future<void> pause() async {
    await _player.pause();
  }

  @override
  Future<void> stop() async {
    await _player.stop();
    await _player.seek(Duration.zero);
  }

  @override
  Future<void> seek(Duration position) async {
    await _player.seek(position);
  }

  @override
  Stream<bool> get playingStream => _player.playingStream;

  @override
  Stream<Duration> get positionStream => _player.positionStream;

  @override
  Stream<Duration?> get durationStream => _player.durationStream;

  @override
  Stream<PlayerError?> get errorStream => _errorController.stream;

  @override
  bool get isPlaying => _player.playing;

  @override
  Duration get position => _player.position;

  @override
  Duration? get duration => _player.duration;

  @override
  Future<void> dispose() async {
    await _errorController.close();
    await _player.dispose();
  }
}
