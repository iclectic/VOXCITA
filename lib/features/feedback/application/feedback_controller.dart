import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voxcita/core/database/database_provider.dart';
import 'package:voxcita/features/feedback/data/feedback_repository.dart';
import 'package:voxcita/features/feedback/domain/feedback_entity.dart';

class FeedbackState {
  const FeedbackState({
    this.feedbackForClaim,
    this.allFeedback = const [],
    this.isSubmitting = false,
    this.error,
  });

  final FeedbackEntity? feedbackForClaim;
  final List<FeedbackEntity> allFeedback;
  final bool isSubmitting;
  final String? error;

  bool get hasFeedback => feedbackForClaim != null;
  bool get hasError => error != null;

  FeedbackState copyWith({
    FeedbackEntity? feedbackForClaim,
    List<FeedbackEntity>? allFeedback,
    bool? isSubmitting,
    String? error,
  }) {
    return FeedbackState(
      feedbackForClaim: feedbackForClaim ?? this.feedbackForClaim,
      allFeedback: allFeedback ?? this.allFeedback,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      error: error,
    );
  }
}

class FeedbackController extends StateNotifier<FeedbackState> {
  FeedbackController(this._repository) : super(const FeedbackState());

  final FeedbackRepository _repository;

  Future<void> loadFeedbackForClaim(String claimId) async {
    final feedback = await _repository.getFeedbackForClaim(claimId);
    state = state.copyWith(feedbackForClaim: feedback);
  }

  Future<void> submitFeedback({
    required String claimId,
    required FeedbackType type,
    String? detail,
  }) async {
    state = state.copyWith(isSubmitting: true, error: null);
    try {
      final existing = await _repository.getFeedbackForClaim(claimId);
      if (existing != null) {
        await _repository.delete(existing.id);
      }
      final feedback = await _repository.create(
        feedbackType: type,
        claimId: claimId,
        feedbackDetail: detail,
      );
      state = state.copyWith(feedbackForClaim: feedback, isSubmitting: false);
    } catch (e) {
      state = state.copyWith(isSubmitting: false, error: e.toString());
    }
  }

  Future<void> removeFeedback(String claimId) async {
    final existing = await _repository.getFeedbackForClaim(claimId);
    if (existing != null) {
      await _repository.delete(existing.id);
      state = state.copyWith(feedbackForClaim: null);
    }
  }

  Future<void> loadAllFeedback() async {
    final all = await _repository.getAll();
    state = state.copyWith(allFeedback: all);
  }
}

final feedbackControllerProvider =
    StateNotifierProvider<FeedbackController, FeedbackState>((ref) {
      return FeedbackController(ref.watch(feedbackRepositoryProvider));
    });
