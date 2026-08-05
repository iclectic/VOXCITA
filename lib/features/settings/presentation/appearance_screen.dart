import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:voxcita/app/routing/routes.dart';
import 'package:voxcita/app/theme/app_spacing.dart';
import 'package:voxcita/features/settings/application/settings_controller.dart';

class AppearanceScreen extends ConsumerWidget {
  const AppearanceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingsControllerProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go(AppRoutes.settings),
        ),
        title: const Text('Appearance'),
      ),
      body: ListView(
        padding: AppSpacing.paddingMd,
        children: [
          Text('Theme', style: theme.textTheme.titleMedium),
          AppSpacing.gapXs,
          Text(
            'Choose how VoxCita looks. High contrast themes improve accessibility.',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          AppSpacing.gapLg,
          ...ThemeModePreference.values.map((mode) {
            final selected = state.themeMode == mode;
            return Card(
              margin: const EdgeInsets.only(bottom: AppSpacing.sm),
              color: selected ? theme.colorScheme.primaryContainer : null,
              child: ListTile(
                leading: Icon(
                  mode.icon,
                  color: selected
                      ? theme.colorScheme.onPrimaryContainer
                      : theme.colorScheme.onSurfaceVariant,
                ),
                title: Text(
                  mode.displayName,
                  style: selected
                      ? theme.textTheme.titleSmall?.copyWith(
                          color: theme.colorScheme.onPrimaryContainer,
                        )
                      : theme.textTheme.titleSmall,
                ),
                trailing: selected
                    ? Icon(
                        Icons.check,
                        color: theme.colorScheme.onPrimaryContainer,
                      )
                    : null,
                onTap: () {
                  ref
                      .read(settingsControllerProvider.notifier)
                      .setThemeMode(mode);
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
