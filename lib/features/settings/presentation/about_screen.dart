import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:voxcita/app/routing/routes.dart';
import 'package:voxcita/app/theme/app_spacing.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go(AppRoutes.settings),
        ),
        title: const Text('About VoxCita'),
      ),
      body: ListView(
        padding: AppSpacing.paddingLg,
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    Icons.graphic_eq,
                    size: 40,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                ),
                AppSpacing.gapMd,
                Text('VoxCita', style: theme.textTheme.headlineSmall),
                AppSpacing.gapXs,
                Text(
                  'Version 0.1.0',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          AppSpacing.gapXl,
          Text(
            'A private, local-first voice thinking companion with source-linked intelligence.',
            style: theme.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          AppSpacing.gapXl,
          const _InfoCard(
            title: 'Built with',
            items: [
              'Flutter & Dart',
              'Riverpod for state management',
              'Drift for local database',
              'GoRouter for navigation',
              'Material 3 design system',
              'just_audio for audio playback',
            ],
          ),
          AppSpacing.gapMd,
          const _InfoCard(
            title: 'Key principles',
            items: [
              'Local-first: your data stays on your device',
              'Source-linked: every insight traces back to audio',
              'Verifiable: review and correct every claim',
              'Private: no telemetry, no cloud required',
              'Transparent: abstains when evidence is insufficient',
            ],
          ),
          AppSpacing.gapMd,
          const _InfoCard(
            title: 'Open source',
            items: [
              'Licensed under the MIT Licence',
              'Source code available on GitHub',
              'AI assistance disclosed honestly',
              'All code reviewed and tested under human ownership',
            ],
          ),
          AppSpacing.gapMd,
          Text(
            'Founded by Ibim Braide',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.title, required this.items});

  final String title;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: AppSpacing.paddingMd,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: theme.textTheme.titleSmall),
            AppSpacing.gapSm,
            ...items.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.xs),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      size: 18,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Text(item, style: theme.textTheme.bodyMedium),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
