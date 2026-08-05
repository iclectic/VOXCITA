import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voxcita/app/routing/app_router.dart';
import 'package:voxcita/app/theme/app_theme.dart';
import 'package:voxcita/features/settings/application/settings_controller.dart';

class VoxCitaApp extends ConsumerWidget {
  const VoxCitaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    final settings = ref.watch(settingsControllerProvider);

    final themeMode = switch (settings.themeMode) {
      ThemeModePreference.system => ThemeMode.system,
      ThemeModePreference.light => ThemeMode.light,
      ThemeModePreference.dark => ThemeMode.dark,
      ThemeModePreference.highContrastLight => ThemeMode.light,
      ThemeModePreference.highContrastDark => ThemeMode.dark,
    };

    final useHighContrast =
        settings.themeMode == ThemeModePreference.highContrastLight ||
        settings.themeMode == ThemeModePreference.highContrastDark;

    return MaterialApp.router(
      title: 'VoxCita',
      debugShowCheckedModeBanner: false,
      theme: useHighContrast ? AppTheme.highContrastLight : AppTheme.light,
      darkTheme: useHighContrast ? AppTheme.highContrastDark : AppTheme.dark,
      themeMode: themeMode,
      routerConfig: router,
    );
  }
}
