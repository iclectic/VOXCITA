import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voxcita/core/database/database_provider.dart';
import 'package:voxcita/features/library/domain/note_entity.dart';
import 'package:voxcita/features/library/domain/note_repository.dart';
import 'package:voxcita/features/transcription/domain/transcript_repository.dart';
import 'package:voxcita/features/transcription/domain/transcript_segment_entity.dart';

class NoteDetailState {
  const NoteDetailState({
    this.note,
    this.segments = const [],
    this.isLoading = false,
    this.error,
  });

  final NoteEntity? note;
  final List<TranscriptSegmentEntity> segments;
  final bool isLoading;
  final String? error;

  bool get hasError => error != null;
  bool get hasSegments => segments.isNotEmpty;
  bool get isVoiceNote => note?.noteType.name == 'voice';

  NoteDetailState copyWith({
    NoteEntity? note,
    List<TranscriptSegmentEntity>? segments,
    bool? isLoading,
    String? error,
  }) {
    return NoteDetailState(
      note: note ?? this.note,
      segments: segments ?? this.segments,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class NoteDetailController extends StateNotifier<NoteDetailState> {
  NoteDetailController({
    required NoteRepository noteRepository,
    required TranscriptRepository transcriptRepository,
    required String noteId,
  }) : _noteRepository = noteRepository,
       _transcriptRepository = transcriptRepository,
       _noteId = noteId,
       super(const NoteDetailState(isLoading: true));

  final NoteRepository _noteRepository;
  final TranscriptRepository _transcriptRepository;
  final String _noteId;

  Future<void> load() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final note = await _noteRepository.getNoteById(_noteId);
      if (note == null) {
        state = state.copyWith(isLoading: false, error: 'Note not found');
        return;
      }

      var segments = <TranscriptSegmentEntity>[];
      if (note.noteType.name == 'voice') {
        segments = await _transcriptRepository.getSegmentsForNote(_noteId);
      }

      state = NoteDetailState(note: note, segments: segments);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> toggleFavourite() async {
    final note = state.note;
    if (note == null) return;
    await _noteRepository.setFavourite(note.id, !note.isFavourite);
    await load();
  }

  Future<void> togglePinned() async {
    final note = state.note;
    if (note == null) return;
    await _noteRepository.setPinned(note.id, !note.isPinned);
    await load();
  }

  Future<void> updateNote({String? title, String? body}) async {
    final note = state.note;
    if (note == null) return;
    await _noteRepository.updateNote(
      note.copyWith(
        title: title ?? note.title,
        body: body ?? note.body,
        updatedAt: DateTime.now().toUtc(),
      ),
    );
    await load();
  }

  Future<void> correctSegment(String segmentId, String correctedText) async {
    await _transcriptRepository.correctSegment(
      segmentId: segmentId,
      correctedText: correctedText,
    );
    await load();
  }

  Future<void> deleteNote() async {
    final note = state.note;
    if (note == null) return;
    await _noteRepository.deleteNote(note.id);
  }
}

final noteDetailControllerProvider =
    StateNotifierProvider.family<NoteDetailController, NoteDetailState, String>(
      (ref, noteId) {
        final controller = NoteDetailController(
          noteRepository: ref.watch(noteRepositoryProvider),
          transcriptRepository: ref.watch(transcriptRepositoryProvider),
          noteId: noteId,
        );
        controller.load();
        return controller;
      },
    );
