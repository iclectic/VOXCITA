import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voxcita/core/audio/audio_player_service.dart';
import 'package:voxcita/core/audio/audio_player_service_impl.dart';
import 'package:voxcita/core/audio/file_storage_service.dart';

final audioPlayerServiceProvider = Provider<AudioPlayerService>((ref) {
  final service = AudioPlayerServiceImpl();
  ref.onDispose(service.dispose);
  return service;
});

final fileStorageServiceProvider = Provider<FileStorageService>((ref) {
  return FileStorageService();
});

class AudioPlayerState {
  const AudioPlayerState({
    this.isPlaying = false,
    this.position = Duration.zero,
    this.duration,
    this.isLoading = false,
    this.currentAudioId,
    this.error,
  });

  final bool isPlaying;
  final Duration position;
  final Duration? duration;
  final bool isLoading;
  final String? currentAudioId;
  final String? error;

  bool get hasError => error != null;

  AudioPlayerState copyWith({
    bool? isPlaying,
    Duration? position,
    Duration? duration,
    bool? isLoading,
    String? currentAudioId,
    String? error,
    bool clearError = false,
  }) {
    return AudioPlayerState(
      isPlaying: isPlaying ?? this.isPlaying,
      position: position ?? this.position,
      duration: duration ?? this.duration,
      isLoading: isLoading ?? this.isLoading,
      currentAudioId: currentAudioId ?? this.currentAudioId,
      error: clearError ? null : error ?? this.error,
    );
  }
}

class AudioPlayerController extends StateNotifier<AudioPlayerState> {
  AudioPlayerController({
    required AudioPlayerService playerService,
    required FileStorageService fileStorageService,
  }) : _playerService = playerService,
       _fileStorageService = fileStorageService,
       super(const AudioPlayerState()) {
    _subscriptions = [
      _playerService.playingStream.listen((isPlaying) {
        state = state.copyWith(isPlaying: isPlaying);
      }),
      _playerService.positionStream.listen((position) {
        state = state.copyWith(position: position);
      }),
      _playerService.durationStream.listen((duration) {
        state = state.copyWith(duration: duration);
      }),
      _playerService.errorStream.listen((error) {
        if (error != null) {
          state = state.copyWith(error: error.message, isLoading: false);
        }
      }),
    ];
  }

  final AudioPlayerService _playerService;
  final FileStorageService _fileStorageService;
  late final List<StreamSubscription<dynamic>> _subscriptions;

  Future<void> loadAudio({
    required String audioId,
    required String relativePath,
  }) async {
    state = AudioPlayerState(isLoading: true, currentAudioId: audioId);
    try {
      final absolutePath = await _fileStorageService.getAbsolutePath(
        relativePath,
      );
      await _playerService.loadFile(absolutePath);
      state = state.copyWith(isLoading: false, currentAudioId: audioId);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
        clearError: false,
      );
    }
  }

  Future<void> play() async {
    await _playerService.play();
  }

  Future<void> pause() async {
    await _playerService.pause();
  }

  Future<void> togglePlayPause() async {
    if (state.isPlaying) {
      await pause();
    } else {
      await play();
    }
  }

  Future<void> stop() async {
    await _playerService.stop();
  }

  Future<void> seekTo(Duration position) async {
    await _playerService.seek(position);
  }

  Future<void> seekToMs(int milliseconds) async {
    await _playerService.seek(Duration(milliseconds: milliseconds));
  }

  @override
  void dispose() {
    for (final sub in _subscriptions) {
      sub.cancel();
    }
    super.dispose();
  }
}

final audioPlayerControllerProvider =
    StateNotifierProvider<AudioPlayerController, AudioPlayerState>((ref) {
      return AudioPlayerController(
        playerService: ref.watch(audioPlayerServiceProvider),
        fileStorageService: ref.watch(fileStorageServiceProvider),
      );
    });
