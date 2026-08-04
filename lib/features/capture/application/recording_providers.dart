import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voxcita/core/audio/audio_recorder_service.dart';
import 'package:voxcita/core/audio/audio_recorder_service_impl.dart';
import 'package:voxcita/core/audio/file_storage_service.dart';
import 'package:voxcita/core/database/database_provider.dart';
import 'package:voxcita/features/capture/application/recording_session_controller.dart';
import 'package:voxcita/features/capture/application/recording_session_state.dart';

final fileStorageServiceProvider = Provider<FileStorageService>((ref) {
  return FileStorageService();
});

final audioRecorderServiceProvider = Provider<AudioRecorderService>((ref) {
  final service = AudioRecorderServiceImpl();
  ref.onDispose(() => service.dispose());
  return service;
});

final recordingSessionControllerProvider =
    StateNotifierProvider<RecordingSessionController, RecordingSessionState>((
      ref,
    ) {
      return RecordingSessionController(
        recorderService: ref.watch(audioRecorderServiceProvider),
        fileStorageService: ref.watch(fileStorageServiceProvider),
        audioRepository: ref.watch(audioRepositoryProvider),
        noteRepository: ref.watch(noteRepositoryProvider),
      );
    });
