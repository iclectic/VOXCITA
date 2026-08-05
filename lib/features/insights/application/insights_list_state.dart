import 'package:voxcita/features/insights/domain/insight_claim_entity.dart';
import 'package:voxcita/features/insights/domain/verification_state.dart';

enum InsightFilter { all, needsReview, verified, corrected, unsupported }

class InsightsListState {
  const InsightsListState({
    this.claims = const [],
    this.filter = InsightFilter.all,
    this.isLoading = false,
    this.error,
  });

  final List<InsightClaimEntity> claims;
  final InsightFilter filter;
  final bool isLoading;
  final String? error;

  List<InsightClaimEntity> get filteredClaims {
    switch (filter) {
      case InsightFilter.needsReview:
        return claims
            .where((c) => c.verificationState == VerificationState.needsReview)
            .toList();
      case InsightFilter.verified:
        return claims
            .where((c) => c.verificationState == VerificationState.verified)
            .toList();
      case InsightFilter.corrected:
        return claims
            .where((c) => c.verificationState == VerificationState.corrected)
            .toList();
      case InsightFilter.unsupported:
        return claims
            .where((c) => c.verificationState == VerificationState.unsupported)
            .toList();
      case InsightFilter.all:
        return claims;
    }
  }

  int get needsReviewCount => claims
      .where((c) => c.verificationState == VerificationState.needsReview)
      .length;

  bool get hasError => error != null;
  bool get isEmpty => filteredClaims.isEmpty && !isLoading;

  InsightsListState copyWith({
    List<InsightClaimEntity>? claims,
    InsightFilter? filter,
    bool? isLoading,
    String? error,
  }) {
    return InsightsListState(
      claims: claims ?? this.claims,
      filter: filter ?? this.filter,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
