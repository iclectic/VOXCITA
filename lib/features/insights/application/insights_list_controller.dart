import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voxcita/core/database/database_provider.dart';
import 'package:voxcita/features/insights/application/insights_list_state.dart';
import 'package:voxcita/features/insights/domain/insight_claim_entity.dart';
import 'package:voxcita/features/insights/domain/insight_repository.dart';
import 'package:voxcita/features/insights/domain/verification_state.dart';
import 'package:voxcita/features/library/domain/note_repository.dart';

class InsightsListController extends StateNotifier<InsightsListState> {
  InsightsListController({
    required InsightRepository insightRepository,
    required NoteRepository noteRepository,
  }) : _insightRepository = insightRepository,
       _noteRepository = noteRepository,
       super(const InsightsListState(isLoading: true));

  final InsightRepository _insightRepository;
  final NoteRepository _noteRepository;

  Future<void> loadAllClaims() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final notes = await _noteRepository.getAllNotes();
      final allClaims = <InsightClaimEntity>[];
      for (final note in notes) {
        final claims = await _insightRepository.getClaimsForNote(note.id);
        allClaims.addAll(claims);
      }
      allClaims.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      state = state.copyWith(claims: allClaims, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> loadClaimsForNote(String noteId) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final claims = await _insightRepository.getClaimsForNote(noteId);
      claims.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      state = state.copyWith(claims: claims, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void setFilter(InsightFilter filter) {
    state = state.copyWith(filter: filter);
  }

  Future<void> setVerificationState(
    String claimId,
    VerificationState newState,
  ) async {
    await _insightRepository.updateVerificationState(claimId, newState.name);
    await loadAllClaims();
  }

  Future<void> deleteClaim(String claimId) async {
    await _insightRepository.deleteClaim(claimId);
    await loadAllClaims();
  }
}

final insightsListControllerProvider =
    StateNotifierProvider<InsightsListController, InsightsListState>((ref) {
      final controller = InsightsListController(
        insightRepository: ref.watch(insightRepositoryProvider),
        noteRepository: ref.watch(noteRepositoryProvider),
      );
      controller.loadAllClaims();
      return controller;
    });
