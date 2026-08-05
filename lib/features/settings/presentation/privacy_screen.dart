import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:voxcita/app/routing/routes.dart';
import 'package:voxcita/app/theme/app_spacing.dart';
import 'package:voxcita/features/settings/application/settings_controller.dart';

class PrivacyScreen extends ConsumerWidget {
  const PrivacyScreen({super.key});

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
        title: const Text('Privacy'),
      ),
      body: ListView(
        padding: AppSpacing.paddingMd,
        children: [
          Text('Processing mode', style: theme.textTheme.titleMedium),
          AppSpacing.gapXs,
          Text(
            'Control how your voice data is processed.',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          AppSpacing.gapLg,
          ...ProcessingMode.values.map((mode) {
            final selected = state.processingMode == mode;
            return Card(
              margin: const EdgeInsets.only(bottom: AppSpacing.sm),
              color: selected ? theme.colorScheme.primaryContainer : null,
              child: Padding(
                padding: AppSpacing.paddingMd,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          mode == ProcessingMode.onDevice
                              ? Icons.phone_android
                              : Icons.cloud_outlined,
                          color: selected
                              ? theme.colorScheme.onPrimaryContainer
                              : theme.colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Expanded(
                          child: Text(
                            mode.displayName,
                            style: selected
                                ? theme.textTheme.titleSmall?.copyWith(
                                    color: theme.colorScheme.onPrimaryContainer,
                                  )
                                : theme.textTheme.titleSmall,
                          ),
                        ),
                        if (selected)
                          Icon(
                            Icons.check,
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                      ],
                    ),
                    AppSpacing.gapXs,
                    Text(
                      mode.description,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: selected
                            ? theme.colorScheme.onPrimaryContainer.withValues(
                                alpha: 0.8,
                              )
                            : theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
          AppSpacing.gapXl,
          Text('Data flow', style: theme.textTheme.titleMedium),
          AppSpacing.gapSm,
          const _DataFlowItem(
            icon: Icons.mic,
            title: 'Audio capture',
            description:
                'Audio is recorded and stored locally on your device. Files are never uploaded.',
          ),
          const _DataFlowItem(
            icon: Icons.transcribe,
            title: 'Transcription',
            description:
                'In on-device mode, transcription runs locally. In hybrid mode, transcript text may be sent to a cloud model.',
          ),
          const _DataFlowItem(
            icon: Icons.lightbulb,
            title: 'Insight extraction',
            description:
                'Insights are generated from transcript text. In on-device mode, this runs locally. In hybrid mode, text may be sent to a cloud model.',
          ),
          const _DataFlowItem(
            icon: Icons.storage,
            title: 'Local storage',
            description:
                'All notes, transcripts, insights, and audio files are stored in a local SQLite database and the app\'s documents directory.',
          ),
          const _DataFlowItem(
            icon: Icons.lock,
            title: 'No telemetry',
            description:
                'VoxCita does not collect analytics, crash reports, or usage data.',
          ),
        ],
      ),
    );
  }
}

class _DataFlowItem extends StatelessWidget {
  const _DataFlowItem({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 24, color: theme.colorScheme.primary),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: theme.textTheme.titleSmall),
                AppSpacing.gapXs,
                Text(
                  description,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
