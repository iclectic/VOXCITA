import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voxcita/core/database/database_provider.dart';
import 'package:voxcita/features/insights/domain/insight_claim_entity.dart';
import 'package:voxcita/features/insights/domain/insight_repository.dart';
import 'package:voxcita/features/insights/domain/verification_state.dart';

class InsightDetailState {
  const InsightDetailState({this.claim, this.isLoading = false, this.error});

  final InsightClaimEntity? claim;
  final bool isLoading;
  final String? error;

  bool get hasError => error != null;

  InsightDetailState copyWith({
    InsightClaimEntity? claim,
    bool? isLoading,
    String? error,
  }) {
    return InsightDetailState(
      claim: claim ?? this.claim,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class InsightDetailController extends StateNotifier<InsightDetailState> {
  InsightDetailController({
    required InsightRepository insightRepository,
    required String claimId,
  }) : _insightRepository = insightRepository,
       _claimId = claimId,
       super(const InsightDetailState(isLoading: true));

  final InsightRepository _insightRepository;
  final String _claimId;

  Future<void> load() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final claim = await _insightRepository.getClaimById(_claimId);
      if (claim == null) {
        state = state.copyWith(isLoading: false, error: 'Claim not found');
        return;
      }
      state = InsightDetailState(claim: claim);
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
        claimId: claimId,
      );
      controller.load();
      return controller;
    });
