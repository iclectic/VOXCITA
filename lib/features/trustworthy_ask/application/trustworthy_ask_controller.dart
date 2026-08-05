import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voxcita/core/database/database_provider.dart';
import 'package:voxcita/features/capture/domain/audio_asset_entity.dart';
import 'package:voxcita/features/capture/domain/audio_repository.dart';
import 'package:voxcita/features/library/domain/note_entity.dart';
import 'package:voxcita/features/library/domain/note_repository.dart';
import 'package:voxcita/features/library/domain/note_type.dart';
import 'package:voxcita/features/transcription/domain/transcript_repository.dart';
import 'package:voxcita/features/trustworthy_ask/application/ask_answer_provider.dart';
import 'package:voxcita/features/trustworthy_ask/data/ask_history_repository.dart';
import 'package:voxcita/features/trustworthy_ask/domain/ask_answer_service.dart';
import 'package:voxcita/features/trustworthy_ask/domain/ask_history_entity.dart';
import 'package:voxcita/features/trustworthy_ask/domain/ask_result_type.dart';

class AskSource {
  AskSource({
    required this.noteId,
    required this.noteTitle,
    required this.segmentId,
    required this.segmentText,
    required this.startMs,
    required this.endMs,
    required this.relevanceScore,
    required this.audioAsset,
  });

  final String noteId;
  final String noteTitle;
  final String segmentId;
  final String segmentText;
  final int startMs;
  final int endMs;
  final double relevanceScore;
  final AudioAssetEntity? audioAsset;
}

class AskResult {
  AskResult({
    required this.type,
    required this.answer,
    required this.sources,
    required this.confidence,
    required this.createdAt,
    this.abstentionReason,
  });

  final AskResultType type;
  final String answer;
  final List<AskSource> sources;
  final double confidence;
  final DateTime createdAt;
  final String? abstentionReason;

  bool get isAnswered => type == AskResultType.answered;
  bool get isAbstained => type == AskResultType.abstained;
  bool get hasSources => sources.isNotEmpty;
}

class TrustworthyAskState {
  const TrustworthyAskState({
    this.availableNotes = const [],
    this.selectedNoteIds = const {},
    this.query = '',
    this.result,
    this.history = const [],
    this.isSearching = false,
    this.isQuerying = false,
    this.error,
  });

  final List<NoteEntity> availableNotes;
  final Set<String> selectedNoteIds;
  final String query;
  final AskResult? result;
  final List<AskHistoryEntity> history;
  final bool isSearching;
  final bool isQuerying;
  final String? error;

  bool get hasError => error != null;
  bool get hasResult => result != null;
  bool get canSubmit =>
      query.trim().isNotEmpty && selectedNoteIds.isNotEmpty && !isQuerying;
  bool get hasSelectedNotes => selectedNoteIds.isNotEmpty;

  bool get hasHistory => history.isNotEmpty;

  TrustworthyAskState copyWith({
    List<NoteEntity>? availableNotes,
    Set<String>? selectedNoteIds,
    String? query,
    AskResult? result,
    List<AskHistoryEntity>? history,
    bool? isSearching,
    bool? isQuerying,
    String? error,
  }) {
    return TrustworthyAskState(
      availableNotes: availableNotes ?? this.availableNotes,
      selectedNoteIds: selectedNoteIds ?? this.selectedNoteIds,
      query: query ?? this.query,
      result: result ?? this.result,
      history: history ?? this.history,
      isSearching: isSearching ?? this.isSearching,
      isQuerying: isQuerying ?? this.isQuerying,
      error: error,
    );
  }
}

class TrustworthyAskController extends StateNotifier<TrustworthyAskState> {
  TrustworthyAskController({
    required NoteRepository noteRepository,
    required TranscriptRepository transcriptRepository,
    required AudioRepository audioRepository,
    required AskAnswerService askAnswerService,
    required AskHistoryRepository askHistoryRepository,
  }) : _noteRepository = noteRepository,
       _transcriptRepository = transcriptRepository,
       _audioRepository = audioRepository,
       _askAnswerService = askAnswerService,
       _askHistoryRepository = askHistoryRepository,
       super(const TrustworthyAskState(isSearching: true));

  final NoteRepository _noteRepository;
  final TranscriptRepository _transcriptRepository;
  final AudioRepository _audioRepository;
  final AskAnswerService _askAnswerService;
  final AskHistoryRepository _askHistoryRepository;

  Future<void> loadNotes() async {
    state = state.copyWith(isSearching: true, error: null);
    try {
      final allNotes = await _noteRepository.getAllNotes();
      final voiceNotesWithTranscripts = <NoteEntity>[];
      for (final note in allNotes) {
        if (note.noteType == NoteType.voice) {
          final segments = await _transcriptRepository.getSegmentsForNote(
            note.id,
          );
          if (segments.isNotEmpty) {
            voiceNotesWithTranscripts.add(note);
          }
        }
      }
      voiceNotesWithTranscripts.sort(
        (a, b) => b.updatedAt.compareTo(a.updatedAt),
      );
      final history = await _askHistoryRepository.getAll();
      state = state.copyWith(
        availableNotes: voiceNotesWithTranscripts,
        history: history,
        isSearching: false,
      );
    } catch (e) {
      state = state.copyWith(isSearching: false, error: e.toString());
    }
  }

  Future<void> loadHistory() async {
    final history = await _askHistoryRepository.getAll();
    state = state.copyWith(history: history);
  }

  Future<void> deleteHistoryEntry(String id) async {
    await _askHistoryRepository.delete(id);
    await loadHistory();
  }

  Future<void> clearHistory() async {
    await _askHistoryRepository.clearAll();
    state = state.copyWith(history: []);
  }

  void toggleNoteSelection(String noteId) {
    final selected = Set<String>.from(state.selectedNoteIds);
    if (selected.contains(noteId)) {
      selected.remove(noteId);
    } else {
      selected.add(noteId);
    }
    state = state.copyWith(selectedNoteIds: selected);
  }

  void setQuery(String query) {
    state = state.copyWith(query: query);
  }

  void clearResult() {
    state = state.copyWith(result: null);
  }

  Future<void> submitQuery() async {
    if (!state.canSubmit) return;

    state = state.copyWith(isQuerying: true, error: null, result: null);
    try {
      final scoredSources = <ScoredSource>[];
      final queryLower = state.query.toLowerCase();

      for (final noteId in state.selectedNoteIds) {
        final note = state.availableNotes.where((n) => n.id == noteId).first;
        final segments = await _transcriptRepository.getSegmentsForNote(noteId);

        for (final segment in segments) {
          final score = _askAnswerService.scoreRelevance(
            query: state.query,
            segmentText: segment.currentText,
          );

          if (score > 0 &&
              segment.currentText.toLowerCase().contains(queryLower)) {
            scoredSources.add(
              ScoredSource(
                noteId: noteId,
                noteTitle: note.title.isEmpty ? 'Untitled' : note.title,
                segmentId: segment.id,
                segmentText: segment.currentText,
                startMs: segment.startMs,
                endMs: segment.endMs,
                relevanceScore: score,
              ),
            );
          }
        }
      }

      final composed = _askAnswerService.composeAnswer(
        query: state.query,
        scoredSources: scoredSources,
      );

      final sources = <AskSource>[];
      for (final scored in composed.sources) {
        final note = state.availableNotes
            .where((n) => n.id == scored.noteId)
            .first;
        AudioAssetEntity? audioAsset;
        if (note.audioAssetId != null) {
          audioAsset = await _audioRepository.getAudioAssetById(
            note.audioAssetId!,
          );
        }
        sources.add(
          AskSource(
            noteId: scored.noteId,
            noteTitle: scored.noteTitle,
            segmentId: scored.segmentId,
            segmentText: scored.segmentText,
            startMs: scored.startMs,
            endMs: scored.endMs,
            relevanceScore: scored.relevanceScore,
            audioAsset: audioAsset,
          ),
        );
      }

      state = TrustworthyAskState(
        availableNotes: state.availableNotes,
        selectedNoteIds: state.selectedNoteIds,
        query: state.query,
        result: AskResult(
          type: composed.type,
          answer: composed.answerText,
          sources: sources,
          confidence: composed.confidence,
          createdAt: DateTime.now().toUtc(),
          abstentionReason: composed.abstentionReason,
        ),
        history: state.history,
        isQuerying: false,
      );

      await _askHistoryRepository.create(
        query: state.query,
        resultType: composed.type,
        answerText: composed.answerText,
        confidence: composed.confidence,
        sourceNoteIds: state.selectedNoteIds.toList(),
        abstentionReason: composed.abstentionReason,
      );
      await loadHistory();
    } catch (e) {
      state = state.copyWith(isQuerying: false, error: e.toString());
    }
  }
}

final trustworthyAskControllerProvider =
    StateNotifierProvider<TrustworthyAskController, TrustworthyAskState>((ref) {
      final controller = TrustworthyAskController(
        noteRepository: ref.watch(noteRepositoryProvider),
        transcriptRepository: ref.watch(transcriptRepositoryProvider),
        audioRepository: ref.watch(audioRepositoryProvider),
        askAnswerService: ref.watch(askAnswerServiceProvider),
        askHistoryRepository: ref.watch(askHistoryRepositoryProvider),
      );
      controller.loadNotes();
      return controller;
    });
