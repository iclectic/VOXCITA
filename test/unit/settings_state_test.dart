import 'package:flutter_test/flutter_test.dart';
import 'package:voxcita/features/settings/application/settings_controller.dart';

void main() {
  group('SettingsState', () {
    test('default state has system theme and on-device processing', () {
      const state = SettingsState();
      expect(state.themeMode, ThemeModePreference.system);
      expect(state.processingMode, ProcessingMode.onDevice);
      expect(state.biometricLockEnabled, isFalse);
      expect(state.autoTranscribe, isTrue);
      expect(state.isSeedingData, isFalse);
      expect(state.hasError, isFalse);
    });

    test('copyWith creates modified copy', () {
      const state = SettingsState();
      final modified = state.copyWith(
        themeMode: ThemeModePreference.dark,
        processingMode: ProcessingMode.hybrid,
        biometricLockEnabled: true,
        autoTranscribe: false,
      );
      expect(modified.themeMode, ThemeModePreference.dark);
      expect(modified.processingMode, ProcessingMode.hybrid);
      expect(modified.biometricLockEnabled, isTrue);
      expect(modified.autoTranscribe, isFalse);
      expect(modified.error, isNull);
    });

    test('copyWith clears error when not provided', () {
      const state = SettingsState(error: 'Old error');
      final modified = state.copyWith();
      expect(modified.error, isNull);
      expect(modified.hasError, isFalse);
    });
  });

  group('ThemeModePreference', () {
    test('has all expected values', () {
      expect(ThemeModePreference.values.length, 5);
      expect(ThemeModePreference.values, contains(ThemeModePreference.system));
      expect(ThemeModePreference.values, contains(ThemeModePreference.light));
      expect(ThemeModePreference.values, contains(ThemeModePreference.dark));
      expect(
        ThemeModePreference.values,
        contains(ThemeModePreference.highContrastLight),
      );
      expect(
        ThemeModePreference.values,
        contains(ThemeModePreference.highContrastDark),
      );
    });

    test('displayName is non-empty for all values', () {
      for (final mode in ThemeModePreference.values) {
        expect(mode.displayName, isNotEmpty);
      }
    });

    test('icon is defined for all values', () {
      for (final mode in ThemeModePreference.values) {
        expect(mode.icon, isNotNull);
      }
    });
  });

  group('ProcessingMode', () {
    test('has all expected values', () {
      expect(ProcessingMode.values.length, 2);
      expect(ProcessingMode.values, contains(ProcessingMode.onDevice));
      expect(ProcessingMode.values, contains(ProcessingMode.hybrid));
    });

    test('displayName is non-empty for all values', () {
      for (final mode in ProcessingMode.values) {
        expect(mode.displayName, isNotEmpty);
      }
    });

    test('description is non-empty for all values', () {
      for (final mode in ProcessingMode.values) {
        expect(mode.description, isNotEmpty);
      }
    });

    test('onDevice mode mentions local', () {
      expect(
        ProcessingMode.onDevice.description.toLowerCase(),
        contains('local'),
      );
    });

    test('hybrid mode mentions cloud', () {
      expect(
        ProcessingMode.hybrid.description.toLowerCase(),
        contains('cloud'),
      );
    });
  });
}
