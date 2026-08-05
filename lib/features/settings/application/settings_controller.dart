import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:voxcita/core/database/database_provider.dart';
import 'package:voxcita/core/database/fake_data.dart';
import 'package:voxcita/core/database/voxcita_database.dart';

enum ThemeModePreference {
  system,
  light,
  dark,
  highContrastLight,
  highContrastDark,
}

enum ProcessingMode { onDevice, hybrid }

extension ThemeModePreferenceX on ThemeModePreference {
  String get displayName => switch (this) {
    ThemeModePreference.system => 'System default',
    ThemeModePreference.light => 'Light',
    ThemeModePreference.dark => 'Dark',
    ThemeModePreference.highContrastLight => 'High contrast (light)',
    ThemeModePreference.highContrastDark => 'High contrast (dark)',
  };

  IconData get icon => switch (this) {
    ThemeModePreference.system => Icons.brightness_auto,
    ThemeModePreference.light => Icons.light_mode,
    ThemeModePreference.dark => Icons.dark_mode,
    ThemeModePreference.highContrastLight => Icons.contrast,
    ThemeModePreference.highContrastDark => Icons.contrast,
  };
}

extension ProcessingModeX on ProcessingMode {
  String get displayName => switch (this) {
    ProcessingMode.onDevice => 'On-device only',
    ProcessingMode.hybrid => 'Hybrid (on-device + cloud)',
  };

  String get description => switch (this) {
    ProcessingMode.onDevice =>
      'All processing happens locally. No data leaves your device.',
    ProcessingMode.hybrid =>
      'Transcription and insights may use cloud models. Audio stays local.',
  };
}

class SettingsState {
  const SettingsState({
    this.themeMode = ThemeModePreference.system,
    this.processingMode = ProcessingMode.onDevice,
    this.biometricLockEnabled = false,
    this.autoTranscribe = true,
    this.isSeedingData = false,
    this.error,
  });

  final ThemeModePreference themeMode;
  final ProcessingMode processingMode;
  final bool biometricLockEnabled;
  final bool autoTranscribe;
  final bool isSeedingData;
  final String? error;

  bool get hasError => error != null;

  SettingsState copyWith({
    ThemeModePreference? themeMode,
    ProcessingMode? processingMode,
    bool? biometricLockEnabled,
    bool? autoTranscribe,
    bool? isSeedingData,
    String? error,
  }) {
    return SettingsState(
      themeMode: themeMode ?? this.themeMode,
      processingMode: processingMode ?? this.processingMode,
      biometricLockEnabled: biometricLockEnabled ?? this.biometricLockEnabled,
      autoTranscribe: autoTranscribe ?? this.autoTranscribe,
      isSeedingData: isSeedingData ?? this.isSeedingData,
      error: error,
    );
  }
}

class SettingsController extends StateNotifier<SettingsState> {
  SettingsController({required VoxCitaDatabase database, required Uuid uuid})
    : _database = database,
      _uuid = uuid,
      super(const SettingsState());

  final VoxCitaDatabase _database;
  final Uuid _uuid;

  void setThemeMode(ThemeModePreference mode) {
    state = state.copyWith(themeMode: mode);
  }

  void setProcessingMode(ProcessingMode mode) {
    state = state.copyWith(processingMode: mode);
  }

  void toggleBiometricLock() {
    state = state.copyWith(biometricLockEnabled: !state.biometricLockEnabled);
  }

  void toggleAutoTranscribe() {
    state = state.copyWith(autoTranscribe: !state.autoTranscribe);
  }

  Future<void> seedDemoData() async {
    state = state.copyWith(isSeedingData: true, error: null);
    try {
      final fakeData = FakeData(_uuid);
      await fakeData.seedAll(_database);
      state = state.copyWith(isSeedingData: false);
    } catch (e) {
      state = state.copyWith(isSeedingData: false, error: e.toString());
    }
  }
}

final settingsControllerProvider =
    StateNotifierProvider<SettingsController, SettingsState>((ref) {
      return SettingsController(
        database: ref.watch(voxCitaDatabaseProvider),
        uuid: ref.watch(uuidProvider),
      );
    });
