import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:voxcita/app/theme/app_colors.dart';
import 'package:voxcita/app/theme/app_spacing.dart';
import 'package:voxcita/app/theme/app_theme.dart';
import 'package:voxcita/app/theme/app_typography.dart';

void main() {
  group('AppTheme', () {
    test('light theme has Brightness.light', () {
      expect(AppTheme.light.brightness, Brightness.light);
    });

    test('dark theme has Brightness.dark', () {
      expect(AppTheme.dark.brightness, Brightness.dark);
    });

    test('highContrastLight theme has Brightness.light', () {
      expect(AppTheme.highContrastLight.brightness, Brightness.light);
    });

    test('highContrastDark theme has Brightness.dark', () {
      expect(AppTheme.highContrastDark.brightness, Brightness.dark);
    });
  });

  group('AppColors', () {
    test('light scheme has primary and onPrimary colours', () {
      final scheme = AppColors.lightScheme;
      expect(scheme.primary, isNotNull);
      expect(scheme.onPrimary, isNotNull);
    });

    test('dark scheme has primary and onPrimary colours', () {
      final scheme = AppColors.darkScheme;
      expect(scheme.primary, isNotNull);
      expect(scheme.onPrimary, isNotNull);
    });

    test('high contrast light scheme differs from standard light scheme', () {
      expect(
        AppColors.highContrastLightScheme.primary,
        isNot(AppColors.lightScheme.primary),
      );
    });

    test('recording active colour is red-toned for visibility', () {
      expect(AppColors.recordingActive.red, greaterThan(150));
      expect(AppColors.recordingActive.green, lessThan(100));
    });

    test('verified badge colour is green-toned', () {
      expect(AppColors.verifiedBadge.green, greaterThan(100));
      expect(AppColors.verifiedBadge.red, lessThan(100));
    });

    test('unsupported badge colour is red-toned', () {
      expect(AppColors.unsupportedBadge.red, greaterThan(150));
      expect(AppColors.unsupportedBadge.green, lessThan(100));
    });
  });

  group('AppTypography', () {
    test('light text theme has all required text styles', () {
      final textTheme = AppTypography.lightTextTheme;
      expect(textTheme.displayLarge, isNotNull);
      expect(textTheme.displayMedium, isNotNull);
      expect(textTheme.displaySmall, isNotNull);
      expect(textTheme.headlineLarge, isNotNull);
      expect(textTheme.headlineMedium, isNotNull);
      expect(textTheme.headlineSmall, isNotNull);
      expect(textTheme.titleLarge, isNotNull);
      expect(textTheme.titleMedium, isNotNull);
      expect(textTheme.titleSmall, isNotNull);
      expect(textTheme.bodyLarge, isNotNull);
      expect(textTheme.bodyMedium, isNotNull);
      expect(textTheme.bodySmall, isNotNull);
      expect(textTheme.labelLarge, isNotNull);
      expect(textTheme.labelMedium, isNotNull);
      expect(textTheme.labelSmall, isNotNull);
    });

    test('bodyLarge font size is 16 for readable body text', () {
      final textTheme = AppTypography.lightTextTheme;
      expect(textTheme.bodyLarge!.fontSize, 16);
    });

    test('titleMedium has medium font weight for hierarchy', () {
      final textTheme = AppTypography.lightTextTheme;
      expect(textTheme.titleMedium!.fontWeight, FontWeight.w500);
    });
  });

  group('AppSpacing', () {
    test('spacing values follow a consistent scale', () {
      expect(AppSpacing.xs, 4);
      expect(AppSpacing.sm, 8);
      expect(AppSpacing.md, 12);
      expect(AppSpacing.lg, 16);
      expect(AppSpacing.xl, 24);
      expect(AppSpacing.xxl, 32);
      expect(AppSpacing.xxxl, 48);
    });

    test('gap widgets have correct dimensions', () {
      expect(AppSpacing.gapSm.width, 8);
      expect(AppSpacing.gapSm.height, 8);
      expect(AppSpacing.gapLg.width, 16);
      expect(AppSpacing.gapLg.height, 16);
    });

    test('padding constants have correct values', () {
      expect(AppSpacing.paddingLg.left, 16);
      expect(AppSpacing.paddingLg.top, 16);
      expect(AppSpacing.paddingLg.right, 16);
      expect(AppSpacing.paddingLg.bottom, 16);
    });
  });
}
