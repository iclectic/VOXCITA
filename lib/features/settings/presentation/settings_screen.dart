import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:voxcita/app/routing/routes.dart';
import 'package:voxcita/app/theme/app_spacing.dart';
import 'package:voxcita/features/settings/application/settings_controller.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingsControllerProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          const _SectionHeader('Appearance'),
          ListTile(
            leading: const Icon(Icons.palette_outlined),
            title: const Text('Theme'),
            subtitle: Text(state.themeMode.displayName),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go(AppRoutes.settingsAppearance),
          ),
          const _SectionHeader('Processing'),
          ListTile(
            leading: const Icon(Icons.memory),
            title: const Text('Processing mode'),
            subtitle: Text(state.processingMode.displayName),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showProcessingModeDialog(context, ref),
          ),
          SwitchListTile(
            secondary: const Icon(Icons.transcribe_outlined),
            title: const Text('Auto-transcribe recordings'),
            subtitle: const Text(
              'Automatically transcribe after stopping a recording',
            ),
            value: state.autoTranscribe,
            onChanged: (_) => ref
                .read(settingsControllerProvider.notifier)
                .toggleAutoTranscribe(),
          ),
          const _SectionHeader('Security'),
          SwitchListTile(
            secondary: const Icon(Icons.lock_outline),
            title: const Text('Biometric lock'),
            subtitle: const Text('Require biometric auth to open app'),
            value: state.biometricLockEnabled,
            onChanged: (_) => ref
                .read(settingsControllerProvider.notifier)
                .toggleBiometricLock(),
          ),
          const _SectionHeader('Data'),
          ListTile(
            leading: const Icon(Icons.science_outlined),
            title: const Text('Load demo data'),
            subtitle: const Text(
              'Seed sample notes, transcripts, and insights',
            ),
            trailing: state.isSeedingData
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.download_outlined),
            onTap: state.isSeedingData
                ? null
                : () => ref
                      .read(settingsControllerProvider.notifier)
                      .seedDemoData(),
          ),
          ListTile(
            leading: const Icon(Icons.backup_outlined),
            title: const Text('Backup and restore'),
            subtitle: const Text('Export and import archives'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          const _SectionHeader('Privacy'),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: const Text('Privacy'),
            subtitle: const Text('Data flow and processing modes'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go(AppRoutes.settingsPrivacy),
          ),
          ListTile(
            leading: const Icon(Icons.analytics_outlined),
            title: const Text('Analytics'),
            subtitle: const Text('Local usage metrics (stays on device)'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go(AppRoutes.settingsAnalytics),
          ),
          Divider(color: theme.colorScheme.outlineVariant),
          const _SectionHeader('About'),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About VoxCita'),
            subtitle: const Text('Version 0.1.0 (beta)'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go(AppRoutes.settingsAbout),
          ),
        ],
      ),
    );
  }

  void _showProcessingModeDialog(BuildContext context, WidgetRef ref) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => SimpleDialog(
        title: const Text('Processing mode'),
        children: ProcessingMode.values.map((mode) {
          return SimpleDialogOption(
            onPressed: () {
              ref
                  .read(settingsControllerProvider.notifier)
                  .setProcessingMode(mode);
              Navigator.of(dialogContext).pop();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(mode.displayName),
                Text(
                  mode.description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.lg,
        AppSpacing.lg,
        AppSpacing.sm,
      ),
      child: Text(
        title,
        style: theme.textTheme.labelLarge?.copyWith(
          color: theme.colorScheme.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
