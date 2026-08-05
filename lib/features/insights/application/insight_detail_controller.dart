import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voxcita/core/database/database_provider.dart';
import 'package:voxcita/features/capture/domain/audio_asset_entity.dart';
import 'package:voxcita/features/capture/domain/audio_repository.dart';
import 'package:voxcita/features/insights/application/citation_validator_provider.dart';
import 'package:voxcita/features/insights/domain/citation_validator.dart';
import 'package:voxcita/features/insights/domain/insight_claim_entity.dart';
import 'package:voxcita/features/insights/domain/insight_repository.dart';
import 'package:voxcita/features/insights/domain/verification_state.dart';
import 'package:voxcita/features/library/domain/note_entity.dart';
import 'package:voxcita/features/library/domain/note_repository.dart';
import 'package:voxcita/features/transcription/domain/transcript_segment_entity.dart';
import 'package:voxcita/features/transcription/domain/transcript_repository.dart';

class InsightDetailState {
  const InsightDetailState({
    this.claim,
    this.segments = const [],
    this.audioAsset,
    this.note,
    this.validation,
    this.isLoading = false,
    this.error,
  });

  final InsightClaimEntity? claim;
  final List<TranscriptSegmentEntity> segments;
  final AudioAssetEntity? audioAsset;
  final NoteEntity? note;
  final ClaimValidationSummary? validation;
  final bool isLoading;
  final String? error;

  bool get hasError => error != null;

  bool get hasAudio => audioAsset != null;

  InsightDetailState copyWith({
    InsightClaimEntity? claim,
    List<TranscriptSegmentEntity>? segments,
    AudioAssetEntity? audioAsset,
    NoteEntity? note,
    ClaimValidationSummary? validation,
    bool? isLoading,
    String? error,
  }) {
    return InsightDetailState(
      claim: claim ?? this.claim,
      segments: segments ?? this.segments,
      audioAsset: audioAsset ?? this.audioAsset,
      note: note ?? this.note,
      validation: validation ?? this.validation,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class InsightDetailController extends StateNotifier<InsightDetailState> {
  InsightDetailController({
    required InsightRepository insightRepository,
    required TranscriptRepository transcriptRepository,
    required NoteRepository noteRepository,
    required AudioRepository audioRepository,
    required CitationValidator citationValidator,
    required String claimId,
  }) : _insightRepository = insightRepository,
       _transcriptRepository = transcriptRepository,
       _noteRepository = noteRepository,
       _audioRepository = audioRepository,
       _citationValidator = citationValidator,
       _claimId = claimId,
       super(const InsightDetailState(isLoading: true));

  final InsightRepository _insightRepository;
  final TranscriptRepository _transcriptRepository;
  final NoteRepository _noteRepository;
  final AudioRepository _audioRepository;
  final CitationValidator _citationValidator;
  final String _claimId;

  Future<void> load() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final claim = await _insightRepository.getClaimById(_claimId);
      if (claim == null) {
        state = state.copyWith(isLoading: false, error: 'Claim not found');
        return;
      }

      final note = await _noteRepository.getNoteById(claim.noteId);
      final segments = await _transcriptRepository.getSegmentsForNote(
        claim.noteId,
      );

      AudioAssetEntity? audioAsset;
      if (note?.audioAssetId != null) {
        audioAsset = await _audioRepository.getAudioAssetById(
          note!.audioAssetId!,
        );
      }

      final validation = _citationValidator.validateClaim(
        claim: claim,
        segments: segments,
      );

      state = InsightDetailState(
        claim: claim,
        segments: segments,
        audioAsset: audioAsset,
        note: note,
        validation: validation,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> setVerificationState(VerificationState newState) async {
    await _insightRepository.updateVerificationState(_claimId, newState.name);
    await load();
  }

  Future<void> deleteClaim() async {
    await _insightRepository.deleteClaim(_claimId);
  }
}

final insightDetailControllerProvider =
    StateNotifierProvider.family<
      InsightDetailController,
      InsightDetailState,
      String
    >((ref, claimId) {
      final controller = InsightDetailController(
        insightRepository: ref.watch(insightRepositoryProvider),
        transcriptRepository: ref.watch(transcriptRepositoryProvider),
        noteRepository: ref.watch(noteRepositoryProvider),
        audioRepository: ref.watch(audioRepositoryProvider),
        citationValidator: ref.watch(citationValidatorProvider),
        claimId: claimId,
      );
      controller.load();
      return controller;
    });
