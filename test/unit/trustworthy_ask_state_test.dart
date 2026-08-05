import 'package:flutter_test/flutter_test.dart';
import 'package:voxcita/features/library/domain/note_entity.dart';
import 'package:voxcita/features/library/domain/note_type.dart';
import 'package:voxcita/features/trustworthy_ask/application/trustworthy_ask_controller.dart';
import 'package:voxcita/features/trustworthy_ask/domain/ask_result_type.dart';

void main() {
  group('TrustworthyAskState', () {
    test('default state has empty values', () {
      const state = TrustworthyAskState();
      expect(state.availableNotes, isEmpty);
      expect(state.selectedNoteIds, isEmpty);
      expect(state.query, isEmpty);
      expect(state.result, isNull);
      expect(state.isSearching, isFalse);
      expect(state.isQuerying, isFalse);
      expect(state.hasError, isFalse);
      expect(state.hasResult, isFalse);
      expect(state.hasSelectedNotes, isFalse);
      expect(state.canSubmit, isFalse);
    });

    test('canSubmit is false when query is empty', () {
      const state = TrustworthyAskState(selectedNoteIds: {'note-1'});
      expect(state.canSubmit, isFalse);
    });

    test('canSubmit is false when no notes selected', () {
      const state = TrustworthyAskState(query: 'test query');
      expect(state.canSubmit, isFalse);
    });

    test('canSubmit is false when isQuerying is true', () {
      const state = TrustworthyAskState(
        selectedNoteIds: {'note-1'},
        query: 'test query',
        isQuerying: true,
      );
      expect(state.canSubmit, isFalse);
    });

    test('canSubmit is true when query and notes set and not querying', () {
      const state = TrustworthyAskState(
        selectedNoteIds: {'note-1'},
        query: 'test query',
      );
      expect(state.canSubmit, isTrue);
    });

    test('hasSelectedNotes returns true when notes are selected', () {
      const state = TrustworthyAskState(selectedNoteIds: {'note-1', 'note-2'});
      expect(state.hasSelectedNotes, isTrue);
    });

    test('hasResult returns true when result is set', () {
      final result = AskResult(
        type: AskResultType.answered,
        answer: 'Test answer',
        sources: [],
        confidence: 0.8,
        createdAt: DateTime.now().toUtc(),
      );
      final state = TrustworthyAskState(result: result);
      expect(state.hasResult, isTrue);
    });

    test('copyWith creates modified copy', () {
      const state = TrustworthyAskState();
      final notes = [
        NoteEntity(
          id: '1',
          noteType: NoteType.voice,
          createdAt: DateTime.now().toUtc(),
          updatedAt: DateTime.now().toUtc(),
        ),
      ];
      final modified = state.copyWith(
        availableNotes: notes,
        selectedNoteIds: {'1'},
        query: 'test',
      );
      expect(modified.availableNotes, notes);
      expect(modified.selectedNoteIds, {'1'});
      expect(modified.query, 'test');
      expect(modified.error, isNull);
    });

    test('copyWith clears error when not provided', () {
      const state = TrustworthyAskState(error: 'Old error');
      final modified = state.copyWith();
      expect(modified.error, isNull);
      expect(modified.hasError, isFalse);
    });
  });

  group('AskSource', () {
    test('stores all fields correctly', () {
      final source = AskSource(
        noteId: 'note-1',
        noteTitle: 'Test Note',
        segmentId: 'seg-1',
        segmentText: 'Some text',
        startMs: 1000,
        endMs: 5000,
        relevanceScore: 0.75,
        audioAsset: null,
      );
      expect(source.noteId, 'note-1');
      expect(source.noteTitle, 'Test Note');
      expect(source.segmentId, 'seg-1');
      expect(source.segmentText, 'Some text');
      expect(source.startMs, 1000);
      expect(source.endMs, 5000);
      expect(source.relevanceScore, 0.75);
      expect(source.audioAsset, isNull);
    });
  });

  group('AskResult', () {
    test('stores answer, sources, and createdAt', () {
      final now = DateTime.now().toUtc();
      final sources = [
        AskSource(
          noteId: 'note-1',
          noteTitle: 'Note 1',
          segmentId: 'seg-1',
          segmentText: 'Text',
          startMs: 0,
          endMs: 1000,
          relevanceScore: 0.9,
          audioAsset: null,
        ),
      ];
      final result = AskResult(
        type: AskResultType.answered,
        answer: 'Answer text',
        sources: sources,
        confidence: 0.9,
        createdAt: now,
      );
      expect(result.answer, 'Answer text');
      expect(result.sources.length, 1);
      expect(result.createdAt, now);
      expect(result.isAnswered, isTrue);
      expect(result.confidence, 0.9);
    });
  });
}
