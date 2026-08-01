import 'package:flutter/material.dart';

@immutable
final class AppColors {
  const AppColors._();

  static const Color _lightSeed = Color(0xFF1A56DB);
  static const Color _darkSeed = Color(0xFF6B8AF3);
  static const Color _highContrastSeed = Color(0xFF0033CC);

  static ColorScheme get lightScheme => ColorScheme.fromSeed(
        seedColor: _lightSeed,
        brightness: Brightness.light,
      );

  static ColorScheme get darkScheme => ColorScheme.fromSeed(
        seedColor: _darkSeed,
        brightness: Brightness.dark,
      );

  static ColorScheme get highContrastLightScheme => ColorScheme.fromSeed(
        seedColor: _highContrastSeed,
        brightness: Brightness.light,
        contrastLevel: 1.0,
      );

  static ColorScheme get highContrastDarkScheme => ColorScheme.fromSeed(
        seedColor: _highContrastSeed,
        brightness: Brightness.dark,
        contrastLevel: 1.0,
      );

  static const Color recordingActive = Color(0xFFDC2626);
  static const Color recordingPaused = Color(0xFFF59E0B);
  static const Color verifiedBadge = Color(0xFF16A34A);
  static const Color unsupportedBadge = Color(0xFFDC2626);
  static const Color needsReviewBadge = Color(0xFFF59E0B);
  static const Color correctedBadge = Color(0xFF2563EB);
}
