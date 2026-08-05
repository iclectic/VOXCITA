import 'package:voxcita/features/capture/domain/audio_asset_entity.dart';
import 'package:voxcita/features/library/domain/note_entity.dart';
import 'package:voxcita/features/transcription/domain/transcript_segment_entity.dart';

class TranscriptListState {
  const TranscriptListState({
    this.voiceNotes = const [],
    this.segmentCounts = const {},
    this.isLoading = false,
    this.error,
  });

  final List<NoteEntity> voiceNotes;
  final Map<String, int> segmentCounts;
  final bool isLoading;
  final String? error;

  bool get hasError => error != null;
  bool get isEmpty => voiceNotes.isEmpty && !isLoading;

  int segmentCountFor(String noteId) => segmentCounts[noteId] ?? 0;

  bool hasTranscript(String noteId) => segmentCountFor(noteId) > 0;

  TranscriptListState copyWith({
    List<NoteEntity>? voiceNotes,
    Map<String, int>? segmentCounts,
    bool? isLoading,
    String? error,
  }) {
    return TranscriptListState(
      voiceNotes: voiceNotes ?? this.voiceNotes,
      segmentCounts: segmentCounts ?? this.segmentCounts,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class TranscriptDetailState {
  const TranscriptDetailState({
    this.note,
    this.segments = const [],
    this.audioAsset,
    this.isLoading = false,
    this.error,
    this.editingSegmentId,
  });

  final NoteEntity? note;
  final List<TranscriptSegmentEntity> segments;
  final AudioAssetEntity? audioAsset;
  final bool isLoading;
  final String? error;
  final String? editingSegmentId;

  bool get hasError => error != null;
  bool get hasSegments => segments.isNotEmpty;
  bool get isEditing => editingSegmentId != null;
  bool get hasAudio => audioAsset != null;

  TranscriptSegmentEntity? get editingSegment =>
      segments.where((s) => s.id == editingSegmentId).firstOrNull;

  int get correctedCount => segments.where((s) => s.isCorrected).length;

  int get totalDurationMs =>
      segments.isEmpty ? 0 : segments.last.endMs - segments.first.startMs;

  TranscriptDetailState copyWith({
    NoteEntity? note,
    List<TranscriptSegmentEntity>? segments,
    AudioAssetEntity? audioAsset,
    bool? isLoading,
    String? error,
    String? editingSegmentId,
  }) {
    return TranscriptDetailState(
      note: note ?? this.note,
      segments: segments ?? this.segments,
      audioAsset: audioAsset ?? this.audioAsset,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      editingSegmentId: editingSegmentId,
    );
  }
}
