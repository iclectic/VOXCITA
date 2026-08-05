import 'package:flutter/material.dart';

enum FeedbackType { helpful, notHelpful, incorrect, suggestion }

extension FeedbackTypeX on FeedbackType {
  String get displayName => switch (this) {
    FeedbackType.helpful => 'Helpful',
    FeedbackType.notHelpful => 'Not helpful',
    FeedbackType.incorrect => 'Incorrect',
    FeedbackType.suggestion => 'Suggestion',
  };

  IconData get icon => switch (this) {
    FeedbackType.helpful => Icons.thumb_up_outlined,
    FeedbackType.notHelpful => Icons.thumb_down_outlined,
    FeedbackType.incorrect => Icons.error_outline,
    FeedbackType.suggestion => Icons.lightbulb_outline,
  };
}

class FeedbackEntity {
  FeedbackEntity({
    required this.id,
    required this.feedbackType,
    required this.createdAt,
    this.claimId,
    this.feedbackDetail,
  });

  final String id;
  final String? claimId;
  final FeedbackType feedbackType;
  final String? feedbackDetail;
  final DateTime createdAt;

  bool get hasDetail => feedbackDetail != null && feedbackDetail!.isNotEmpty;
}
