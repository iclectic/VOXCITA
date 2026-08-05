import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:voxcita/app/routing/routes.dart';
import 'package:voxcita/app/theme/app_spacing.dart';
import 'package:voxcita/features/analytics/application/analytics_controller.dart';
import 'package:voxcita/features/analytics/domain/analytics_service.dart';

class AnalyticsScreen extends ConsumerStatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  ConsumerState<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends ConsumerState<AnalyticsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(analyticsControllerProvider.notifier).loadMetrics();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final state = ref.watch(analyticsControllerProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go(AppRoutes.settings),
        ),
        title: const Text('Analytics'),
      ),
      body: ListView(
        padding: AppSpacing.paddingMd,
        children: [
          Card(
            child: Padding(
              padding: AppSpacing.paddingMd,
              child: Row(
                children: [
                  Icon(
                    Icons.lock_outline,
                    color: theme.colorScheme.primary,
                    size: 20,
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Text(
                      'All metrics are computed locally on your device. '
                      'No data is sent to any server.',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          AppSpacing.gapLg,
          if (state.isLoading)
            const Center(child: CircularProgressIndicator())
          else if (state.hasError)
            Center(
              child: Text(
                state.error!,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.error,
                ),
              ),
            )
          else if (state.hasMetrics)
            ..._buildMetrics(context, state.metrics!)
          else
            const Center(child: Text('No metrics available')),
        ],
      ),
    );
  }

  List<Widget> _buildMetrics(BuildContext context, AnalyticsMetrics metrics) {
    final theme = Theme.of(context);
    return [
      Text('Content', style: theme.textTheme.titleMedium),
      AppSpacing.gapSm,
      _MetricTile(
        icon: Icons.library_books_outlined,
        label: 'Total notes',
        value: metrics.noteCount,
      ),
      _MetricTile(
        icon: Icons.mic_none_outlined,
        label: 'Voice notes',
        value: metrics.voiceNoteCount,
      ),
      _MetricTile(
        icon: Icons.note_outlined,
        label: 'Text notes',
        value: metrics.textNoteCount,
      ),
      _MetricTile(
        icon: Icons.graphic_eq,
        label: 'Audio assets',
        value: metrics.audioAssetCount,
      ),
      _MetricTile(
        icon: Icons.fiber_manual_record_outlined,
        label: 'Recording sessions',
        value: metrics.recordingSessionCount,
      ),
      AppSpacing.gapLg,
      Text('Transcripts & Insights', style: theme.textTheme.titleMedium),
      AppSpacing.gapSm,
      _MetricTile(
        icon: Icons.transcribe,
        label: 'Transcript segments',
        value: metrics.transcriptSegmentCount,
      ),
      _MetricTile(
        icon: Icons.lightbulb_outline,
        label: 'Insights generated',
        value: metrics.insightCount,
      ),
      AppSpacing.gapLg,
      Text('Ask & Feedback', style: theme.textTheme.titleMedium),
      AppSpacing.gapSm,
      _MetricTile(
        icon: Icons.question_answer_outlined,
        label: 'Ask queries',
        value: metrics.askHistoryCount,
      ),
      _MetricTile(
        icon: Icons.feedback_outlined,
        label: 'Feedback entries',
        value: metrics.feedbackCount,
      ),
      AppSpacing.gapLg,
      Text('Organisation', style: theme.textTheme.titleMedium),
      AppSpacing.gapSm,
      _MetricTile(
        icon: Icons.folder_outlined,
        label: 'Collections',
        value: metrics.collectionCount,
      ),
      _MetricTile(icon: Icons.tag, label: 'Tags', value: metrics.tagCount),
      AppSpacing.gapLg,
      Card(
        child: Padding(
          padding: AppSpacing.paddingLg,
          child: Column(
            children: [
              Text('Total interactions', style: theme.textTheme.titleSmall),
              AppSpacing.gapXs,
              Text(
                '${metrics.totalInteractions}',
                style: theme.textTheme.displaySmall?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              AppSpacing.gapXs,
              Text(
                'Notes + insights + ask queries + feedback',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    ];
  }
}

class _MetricTile extends StatelessWidget {
  const _MetricTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final int value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.xs),
      child: ListTile(
        leading: Icon(icon, color: theme.colorScheme.primary),
        title: Text(label),
        trailing: Text(
          '$value',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            fontFeatures: [const FontFeature.tabularFigures()],
          ),
        ),
      ),
    );
  }
}
