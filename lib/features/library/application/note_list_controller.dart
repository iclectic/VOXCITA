import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voxcita/core/database/database_provider.dart';
import 'package:voxcita/features/library/application/note_list_state.dart';
import 'package:voxcita/features/library/domain/note_repository.dart';

class NoteListController extends StateNotifier<NoteListState> {
  NoteListController({required NoteRepository noteRepository})
    : _noteRepository = noteRepository,
      super(const NoteListState(isLoading: true));

  final NoteRepository _noteRepository;

  Future<void> loadNotes() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final notes = await _noteRepository.getAllNotes();
      state = state.copyWith(notes: notes, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void setFilter(NoteFilter filter) {
    state = state.copyWith(filter: filter);
  }

  void setSearchQuery(String query) {
    state = state.copyWith(searchQuery: query);
  }

  void clearSearch() {
    state = state.copyWith(searchQuery: '');
  }

  Future<void> toggleFavourite(String noteId, bool currentValue) async {
    await _noteRepository.setFavourite(noteId, !currentValue);
    await loadNotes();
  }

  Future<void> togglePinned(String noteId, bool currentValue) async {
    await _noteRepository.setPinned(noteId, !currentValue);
    await loadNotes();
  }

  Future<void> deleteNote(String noteId) async {
    await _noteRepository.deleteNote(noteId);
    await loadNotes();
  }
}

final noteListControllerProvider =
    StateNotifierProvider<NoteListController, NoteListState>((ref) {
      final controller = NoteListController(
        noteRepository: ref.watch(noteRepositoryProvider),
      );
      controller.loadNotes();
      return controller;
    });
