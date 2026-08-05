import 'package:flutter/material.dart';

abstract final class AppRoutes {
  static const String library = '/library';
  static const String capture = '/capture';
  static const String transcription = '/transcription';
  static const String insights = '/insights';
  static const String trustworthyAsk = '/trustworthy-ask';
  static const String review = '/review';
  static const String settings = '/settings';
  static const String settingsAppearance = '/settings/appearance';
  static const String settingsPrivacy = '/settings/privacy';
  static const String settingsAbout = '/settings/about';
  static const String settingsAnalytics = '/settings/analytics';

  static String noteDetail(String noteId) => '$library/$noteId';
  static String noteEdit(String noteId) => '$library/$noteId/edit';
  static const String noteNew = '$library/new';
  static String insightDetail(String claimId) => '$insights/$claimId';
  static String transcriptDetail(String noteId) => '$transcription/$noteId';
}

enum AppDestination {
  library(
    label: 'Library',
    icon: Icons.library_books_outlined,
    selectedIcon: Icons.library_books,
    route: AppRoutes.library,
  ),
  capture(
    label: 'Capture',
    icon: Icons.mic_none_outlined,
    selectedIcon: Icons.mic,
    route: AppRoutes.capture,
  ),
  insights(
    label: 'Insights',
    icon: Icons.lightbulb_outline,
    selectedIcon: Icons.lightbulb,
    route: AppRoutes.insights,
  ),
  trustworthyAsk(
    label: 'Ask',
    icon: Icons.question_answer_outlined,
    selectedIcon: Icons.question_answer,
    route: AppRoutes.trustworthyAsk,
  ),
  review(
    label: 'Review',
    icon: Icons.task_alt_outlined,
    selectedIcon: Icons.task_alt,
    route: AppRoutes.review,
  ),
  settings(
    label: 'Settings',
    icon: Icons.settings_outlined,
    selectedIcon: Icons.settings,
    route: AppRoutes.settings,
  );

  const AppDestination({
    required this.label,
    required this.icon,
    required this.selectedIcon,
    required this.route,
  });

  final String label;
  final IconData icon;
  final IconData selectedIcon;
  final String route;
}
