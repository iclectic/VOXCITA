import 'package:voxcita/features/library/domain/note_entity.dart';

enum NoteFilter { all, favourites, pinned, voice, text }

class NoteListState {
  const NoteListState({
    this.notes = const [],
    this.filter = NoteFilter.all,
    this.searchQuery = '',
    this.isLoading = false,
    this.error,
  });

  final List<NoteEntity> notes;
  final NoteFilter filter;
  final String searchQuery;
  final bool isLoading;
  final String? error;

  List<NoteEntity> get filteredNotes {
    var result = notes;

    switch (filter) {
      case NoteFilter.favourites:
        result = result.where((n) => n.isFavourite).toList();
      case NoteFilter.pinned:
        result = result.where((n) => n.isPinned).toList();
      case NoteFilter.voice:
        result = result.where((n) => n.noteType.name == 'voice').toList();
      case NoteFilter.text:
        result = result.where((n) => n.noteType.name == 'text').toList();
      case NoteFilter.all:
        break;
    }

    if (searchQuery.isNotEmpty) {
      final query = searchQuery.toLowerCase();
      result = result
          .where(
            (n) =>
                n.title.toLowerCase().contains(query) ||
                n.body.toLowerCase().contains(query),
          )
          .toList();
    }

    final pinned = result.where((n) => n.isPinned).toList();
    final unpinned = result.where((n) => !n.isPinned).toList();
    pinned.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    unpinned.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    return [...pinned, ...unpinned];
  }

  bool get hasError => error != null;
  bool get isEmpty => filteredNotes.isEmpty && !isLoading;

  NoteListState copyWith({
    List<NoteEntity>? notes,
    NoteFilter? filter,
    String? searchQuery,
    bool? isLoading,
    String? error,
  }) {
    return NoteListState(
      notes: notes ?? this.notes,
      filter: filter ?? this.filter,
      searchQuery: searchQuery ?? this.searchQuery,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
