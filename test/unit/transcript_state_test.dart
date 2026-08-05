import 'package:flutter_test/flutter_test.dart';
import 'package:voxcita/features/library/domain/note_entity.dart';
import 'package:voxcita/features/library/domain/note_type.dart';
import 'package:voxcita/features/transcription/application/transcript_state.dart';
import 'package:voxcita/features/transcription/domain/transcript_segment_entity.dart';

void main() {
  group('TranscriptListState', () {
    test('default state is empty and not loading', () {
      const state = TranscriptListState();
      expect(state.voiceNotes, isEmpty);
      expect(state.segmentCounts, isEmpty);
      expect(state.isLoading, isFalse);
      expect(state.hasError, isFalse);
      expect(state.isEmpty, isTrue);
    });

    test('isEmpty returns false when loading', () {
      const state = TranscriptListState(isLoading: true);
      expect(state.isEmpty, isFalse);
    });

    test('segmentCountFor returns 0 for unknown note', () {
      const state = TranscriptListState();
      expect(state.segmentCountFor('unknown'), 0);
    });

    test('segmentCountFor returns count for known note', () {
      const state = TranscriptListState(
        segmentCounts: {'note-1': 5, 'note-2': 0},
      );
      expect(state.segmentCountFor('note-1'), 5);
      expect(state.segmentCountFor('note-2'), 0);
    });

    test('hasTranscript returns true when segments > 0', () {
      const state = TranscriptListState(
        segmentCounts: {'note-1': 3, 'note-2': 0},
      );
      expect(state.hasTranscript('note-1'), isTrue);
      expect(state.hasTranscript('note-2'), isFalse);
    });

    test('copyWith creates modified copy', () {
      const state = TranscriptListState();
      final notes = [
        NoteEntity(
          id: '1',
          noteType: NoteType.voice,
          createdAt: DateTime.now().toUtc(),
          updatedAt: DateTime.now().toUtc(),
        ),
      ];
      final modified = state.copyWith(
        voiceNotes: notes,
        segmentCounts: {'1': 3},
      );
      expect(modified.voiceNotes, notes);
      expect(modified.segmentCounts['1'], 3);
      expect(modified.error, isNull);
    });

    test('copyWith clears error when not provided', () {
      const state = TranscriptListState(error: 'Old error');
      final modified = state.copyWith();
      expect(modified.error, isNull);
      expect(modified.hasError, isFalse);
    });
  });

  group('TranscriptDetailState', () {
    late List<TranscriptSegmentEntity> sampleSegments;

    setUp(() {
      final now = DateTime.now().toUtc();
      sampleSegments = [
        TranscriptSegmentEntity(
          id: 'seg-1',
          noteId: 'note-1',
          audioAssetId: 'asset-1',
          startMs: 0,
          endMs: 5000,
          originalText: 'Hello world',
          currentText: 'Hello world',
          engineName: 'whisper',
          modelVersion: '1.0',
          createdAt: now,
        ),
        TranscriptSegmentEntity(
          id: 'seg-2',
          noteId: 'note-1',
          audioAssetId: 'asset-1',
          startMs: 5000,
          endMs: 10000,
          originalText: 'Original text',
          currentText: 'Corrected text',
          engineName: 'whisper',
          modelVersion: '1.0',
          createdAt: now,
          confidence: 0.95,
          speakerLabel: 'Speaker 1',
        ),
      ];
    });

    test('default state is empty and not loading', () {
      const state = TranscriptDetailState();
      expect(state.note, isNull);
      expect(state.segments, isEmpty);
      expect(state.isLoading, isFalse);
      expect(state.hasError, isFalse);
      expect(state.hasSegments, isFalse);
      expect(state.isEditing, isFalse);
    });

    test('hasSegments returns true when segments exist', () {
      final state = TranscriptDetailState(segments: sampleSegments);
      expect(state.hasSegments, isTrue);
    });

    test('correctedCount counts corrected segments', () {
      final state = TranscriptDetailState(segments: sampleSegments);
      expect(state.correctedCount, 1);
    });

    test('totalDurationMs calculates from first start to last end', () {
      final state = TranscriptDetailState(segments: sampleSegments);
      expect(state.totalDurationMs, 10000);
    });

    test('totalDurationMs is 0 for empty segments', () {
      const state = TranscriptDetailState();
      expect(state.totalDurationMs, 0);
    });

    test('isEditing returns true when editingSegmentId is set', () {
      final state = TranscriptDetailState(
        segments: sampleSegments,
        editingSegmentId: 'seg-1',
      );
      expect(state.isEditing, isTrue);
    });

    test('editingSegment returns the segment being edited', () {
      final state = TranscriptDetailState(
        segments: sampleSegments,
        editingSegmentId: 'seg-2',
      );
      expect(state.editingSegment, isNotNull);
      expect(state.editingSegment!.id, 'seg-2');
    });

    test('editingSegment returns null for unknown id', () {
      final state = TranscriptDetailState(
        segments: sampleSegments,
        editingSegmentId: 'unknown',
      );
      expect(state.editingSegment, isNull);
    });

    test('copyWith creates modified copy', () {
      const state = TranscriptDetailState();
      final modified = state.copyWith(
        segments: sampleSegments,
        editingSegmentId: 'seg-1',
      );
      expect(modified.segments, sampleSegments);
      expect(modified.editingSegmentId, 'seg-1');
      expect(modified.error, isNull);
    });

    test('copyWith clears error when not provided', () {
      const state = TranscriptDetailState(error: 'Old error');
      final modified = state.copyWith();
      expect(modified.error, isNull);
      expect(modified.hasError, isFalse);
    });
  });
}
