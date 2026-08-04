import 'package:flutter_test/flutter_test.dart';
import 'package:voxcita/features/library/application/note_list_state.dart';
import 'package:voxcita/features/library/domain/note_entity.dart';
import 'package:voxcita/features/library/domain/note_type.dart';

void main() {
  group('NoteListState', () {
    late List<NoteEntity> sampleNotes;

    setUp(() {
      final now = DateTime.now().toUtc();
      sampleNotes = [
        NoteEntity(
          id: '1',
          title: 'First note',
          body: 'Body one',
          noteType: NoteType.text,
          createdAt: now,
          updatedAt: now.subtract(const Duration(hours: 1)),
        ),
        NoteEntity(
          id: '2',
          title: 'Second note',
          body: 'Body two',
          noteType: NoteType.voice,
          createdAt: now,
          updatedAt: now,
          isFavourite: true,
        ),
        NoteEntity(
          id: '3',
          title: 'Third note',
          body: 'Body three',
          noteType: NoteType.text,
          createdAt: now,
          updatedAt: now.subtract(const Duration(hours: 2)),
          isPinned: true,
        ),
      ];
    });

    test('default state has empty notes and filter all', () {
      const state = NoteListState();
      expect(state.notes, isEmpty);
      expect(state.filter, NoteFilter.all);
      expect(state.searchQuery, isEmpty);
      expect(state.isLoading, isFalse);
      expect(state.hasError, isFalse);
    });

    test('filteredNotes with all filter returns all notes', () {
      final state = NoteListState(notes: sampleNotes);
      expect(state.filteredNotes.length, 3);
    });

    test('filteredNotes with favourites filter returns only favourites', () {
      final state = NoteListState(
        notes: sampleNotes,
        filter: NoteFilter.favourites,
      );
      expect(state.filteredNotes.length, 1);
      expect(state.filteredNotes.first.id, '2');
    });

    test('filteredNotes with pinned filter returns only pinned', () {
      final state = NoteListState(
        notes: sampleNotes,
        filter: NoteFilter.pinned,
      );
      expect(state.filteredNotes.length, 1);
      expect(state.filteredNotes.first.id, '3');
    });

    test('filteredNotes with voice filter returns only voice notes', () {
      final state = NoteListState(notes: sampleNotes, filter: NoteFilter.voice);
      expect(state.filteredNotes.length, 1);
      expect(state.filteredNotes.first.id, '2');
    });

    test('filteredNotes with text filter returns only text notes', () {
      final state = NoteListState(notes: sampleNotes, filter: NoteFilter.text);
      expect(state.filteredNotes.length, 2);
    });

    test('filteredNotes with search query filters by title', () {
      final state = NoteListState(notes: sampleNotes, searchQuery: 'second');
      expect(state.filteredNotes.length, 1);
      expect(state.filteredNotes.first.id, '2');
    });

    test('filteredNotes with search query filters by body', () {
      final state = NoteListState(
        notes: sampleNotes,
        searchQuery: 'body three',
      );
      expect(state.filteredNotes.length, 1);
      expect(state.filteredNotes.first.id, '3');
    });

    test('filteredNotes places pinned before unpinned', () {
      final state = NoteListState(notes: sampleNotes);
      final filtered = state.filteredNotes;
      expect(filtered.first.id, '3');
    });

    test('filteredNotes sorts by updatedAt desc within pinned/unpinned', () {
      final state = NoteListState(notes: sampleNotes);
      final filtered = state.filteredNotes;
      final pinned = filtered.where((n) => n.isPinned).toList();
      final unpinned = filtered.where((n) => !n.isPinned).toList();
      expect(pinned.length, 1);
      expect(unpinned.length, 2);
      expect(unpinned.first.id, '2');
      expect(unpinned.last.id, '1');
    });

    test('isEmpty returns true when no notes and not loading', () {
      const state = NoteListState();
      expect(state.isEmpty, isTrue);
    });

    test('isEmpty returns false when loading', () {
      const state = NoteListState(isLoading: true);
      expect(state.isEmpty, isFalse);
    });

    test('copyWith creates modified copy', () {
      const state = NoteListState();
      final modified = state.copyWith(
        notes: sampleNotes,
        filter: NoteFilter.favourites,
        isLoading: true,
      );
      expect(modified.notes, sampleNotes);
      expect(modified.filter, NoteFilter.favourites);
      expect(modified.isLoading, isTrue);
      expect(modified.error, isNull);
    });

    test('copyWith clears error when not provided', () {
      const state = NoteListState(error: 'Old error');
      final modified = state.copyWith(notes: sampleNotes);
      expect(modified.error, isNull);
      expect(modified.hasError, isFalse);
    });
  });

  group('NoteFilter', () {
    test('has all expected values', () {
      expect(NoteFilter.values.length, 5);
      expect(NoteFilter.values, contains(NoteFilter.all));
      expect(NoteFilter.values, contains(NoteFilter.favourites));
      expect(NoteFilter.values, contains(NoteFilter.pinned));
      expect(NoteFilter.values, contains(NoteFilter.voice));
      expect(NoteFilter.values, contains(NoteFilter.text));
    });
  });
}
