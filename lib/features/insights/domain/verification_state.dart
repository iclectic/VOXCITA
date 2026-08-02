enum VerificationState {
  verified,
  corrected,
  unsupported,
  needsReview;

  static VerificationState fromString(String value) {
    return VerificationState.values.firstWhere(
      (e) => e.name == value,
      orElse: () => VerificationState.needsReview,
    );
  }

  String get displayName {
    switch (this) {
      case VerificationState.verified:
        return 'Verified';
      case VerificationState.corrected:
        return 'Corrected';
      case VerificationState.unsupported:
        return 'Unsupported';
      case VerificationState.needsReview:
        return 'Needs review';
    }
  }

  bool get canTransitionToVerified =>
      this == VerificationState.needsReview ||
      this == VerificationState.corrected;

  bool get canTransitionToCorrected =>
      this == VerificationState.needsReview ||
      this == VerificationState.verified;

  bool get canTransitionToUnsupported =>
      this == VerificationState.needsReview ||
      this == VerificationState.verified ||
      this == VerificationState.corrected;

  bool get canTransitionToNeedsReview => true;
}
