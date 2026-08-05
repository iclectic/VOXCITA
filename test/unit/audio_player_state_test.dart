import 'package:flutter_test/flutter_test.dart';
import 'package:voxcita/core/audio/audio_player_controller.dart';

void main() {
  group('AudioPlayerState', () {
    test('default state has correct initial values', () {
      const state = AudioPlayerState();
      expect(state.isPlaying, isFalse);
      expect(state.position, Duration.zero);
      expect(state.duration, isNull);
      expect(state.isLoading, isFalse);
      expect(state.currentAudioId, isNull);
      expect(state.error, isNull);
      expect(state.hasError, isFalse);
    });

    test('copyWith creates modified copy', () {
      const state = AudioPlayerState();
      final modified = state.copyWith(
        isPlaying: true,
        position: const Duration(seconds: 5),
        duration: const Duration(seconds: 30),
        currentAudioId: 'audio-123',
      );
      expect(modified.isPlaying, isTrue);
      expect(modified.position, const Duration(seconds: 5));
      expect(modified.duration, const Duration(seconds: 30));
      expect(modified.currentAudioId, 'audio-123');
    });

    test('copyWith clears error when clearError is true', () {
      const state = AudioPlayerState(error: 'Something went wrong');
      final modified = state.copyWith(clearError: true);
      expect(modified.error, isNull);
      expect(modified.hasError, isFalse);
    });

    test('hasError is true when error is set', () {
      const state = AudioPlayerState(error: 'Load failed');
      expect(state.hasError, isTrue);
    });
  });
}
