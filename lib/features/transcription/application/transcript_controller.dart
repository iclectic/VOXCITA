import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voxcita/core/database/database_provider.dart';
import 'package:voxcita/features/capture/domain/audio_asset_entity.dart';
import 'package:voxcita/features/capture/domain/audio_repository.dart';
import 'package:voxcita/features/library/domain/note_repository.dart';
import 'package:voxcita/features/library/domain/note_type.dart';
import 'package:voxcita/features/transcription/application/transcript_state.dart';
import 'package:voxcita/features/transcription/domain/transcript_repository.dart';

class TranscriptListController extends StateNotifier<TranscriptListState> {
  TranscriptListController({
    required NoteRepository noteRepository,
    required TranscriptRepository transcriptRepository,
  }) : _noteRepository = noteRepository,
       _transcriptRepository = transcriptRepository,
       super(const TranscriptListState(isLoading: true));

  final NoteRepository _noteRepository;
  final TranscriptRepository _transcriptRepository;

  Future<void> load() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final allNotes = await _noteRepository.getAllNotes();
      final voiceNotes = allNotes
          .where((n) => n.noteType == NoteType.voice)
          .toList();
      voiceNotes.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));

      final counts = <String, int>{};
      for (final note in voiceNotes) {
        final segments = await _transcriptRepository.getSegmentsForNote(
          note.id,
        );
        counts[note.id] = segments.length;
      }

      state = TranscriptListState(
        voiceNotes: voiceNotes,
        segmentCounts: counts,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

final transcriptListControllerProvider =
    StateNotifierProvider<TranscriptListController, TranscriptListState>((ref) {
      final controller = TranscriptListController(
        noteRepository: ref.watch(noteRepositoryProvider),
        transcriptRepository: ref.watch(transcriptRepositoryProvider),
      );
      controller.load();
      return controller;
    });

class TranscriptDetailController extends StateNotifier<TranscriptDetailState> {
  TranscriptDetailController({
    required NoteRepository noteRepository,
    required TranscriptRepository transcriptRepository,
    required AudioRepository audioRepository,
    required String noteId,
  }) : _noteRepository = noteRepository,
       _transcriptRepository = transcriptRepository,
       _audioRepository = audioRepository,
       _noteId = noteId,
       super(const TranscriptDetailState(isLoading: true));

  final NoteRepository _noteRepository;
  final TranscriptRepository _transcriptRepository;
  final AudioRepository _audioRepository;
  final String _noteId;

  Future<void> load() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final note = await _noteRepository.getNoteById(_noteId);
      if (note == null) {
        state = state.copyWith(isLoading: false, error: 'Note not found');
        return;
      }
      final segments = await _transcriptRepository.getSegmentsForNote(_noteId);

      AudioAssetEntity? audioAsset;
      if (note.audioAssetId != null) {
        audioAsset = await _audioRepository.getAudioAssetById(
          note.audioAssetId!,
        );
      }

      state = TranscriptDetailState(
        note: note,
        segments: segments,
        audioAsset: audioAsset,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void startEditing(String segmentId) {
    state = state.copyWith(editingSegmentId: segmentId);
  }

  void cancelEditing() {
    state = state.copyWith(editingSegmentId: null);
  }

  Future<void> saveCorrection(String segmentId, String correctedText) async {
    await _transcriptRepository.correctSegment(
      segmentId: segmentId,
      correctedText: correctedText,
    );
    state = state.copyWith(editingSegmentId: null);
    await load();
  }
}

final transcriptDetailControllerProvider =
    StateNotifierProvider.family<
      TranscriptDetailController,
      TranscriptDetailState,
      String
    >((ref, noteId) {
      final controller = TranscriptDetailController(
        noteRepository: ref.watch(noteRepositoryProvider),
        transcriptRepository: ref.watch(transcriptRepositoryProvider),
        audioRepository: ref.watch(audioRepositoryProvider),
        noteId: noteId,
      );
      controller.load();
      return controller;
    });
