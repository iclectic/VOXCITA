import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voxcita/app/theme/app_colors.dart';
import 'package:voxcita/app/theme/app_spacing.dart';
import 'package:voxcita/core/audio/audio_player_controller.dart';
import 'package:voxcita/features/trustworthy_ask/application/trustworthy_ask_controller.dart';
import 'package:voxcita/features/trustworthy_ask/domain/ask_result_type.dart';
import 'package:voxcita/shared/widgets/empty_state.dart';

class TrustworthyAskScreen extends ConsumerStatefulWidget {
  const TrustworthyAskScreen({super.key});

  @override
  ConsumerState<TrustworthyAskScreen> createState() =>
      _TrustworthyAskScreenState();
}

class _TrustworthyAskScreenState extends ConsumerState<TrustworthyAskScreen> {
  final _queryController = TextEditingController();

  @override
  void dispose() {
    _queryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(trustworthyAskControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Trustworthy Ask')),
      body: state.isSearching
          ? const Center(child: CircularProgressIndicator())
          : _Content(state: state, queryController: _queryController),
    );
  }
}

class _Content extends ConsumerWidget {
  const _Content({required this.state, required this.queryController});

  final TrustworthyAskState state;
  final TextEditingController queryController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (state.availableNotes.isEmpty) {
      return const EmptyState(
        icon: Icons.help_outline,
        title: 'No transcribed recordings',
        message:
            'Record and transcribe audio first, then ask questions with cited sources.',
      );
    }

    return Column(
      children: [
        _NoteSelector(state: state),
        _QueryInput(state: state, queryController: queryController),
        if (state.hasError)
          Padding(
            padding: AppSpacing.paddingMd,
            child: Text(
              state.error!,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ),
        Expanded(
          child: state.isQuerying
              ? const Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(),
                      AppSpacing.gapMd,
                      Text('Searching sources...'),
                    ],
                  ),
                )
              : state.hasResult
              ? _ResultView(state: state)
              : _HintView(),
        ),
      ],
    );
  }
}

class _NoteSelector extends ConsumerWidget {
  const _NoteSelector({required this.state});

  final TrustworthyAskState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Container(
      padding: AppSpacing.paddingMd,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        border: Border(
          bottom: BorderSide(color: theme.colorScheme.outlineVariant),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Select recordings', style: theme.textTheme.titleSmall),
              const Spacer(),
              if (state.hasSelectedNotes)
                TextButton(
                  onPressed: () {
                    ref
                        .read(trustworthyAskControllerProvider.notifier)
                        .clearResult();
                  },
                  child: Text('Clear (${state.selectedNoteIds.length})'),
                ),
            ],
          ),
          AppSpacing.gapSm,
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: state.availableNotes.map((note) {
                final selected = state.selectedNoteIds.contains(note.id);
                return Padding(
                  padding: const EdgeInsets.only(right: AppSpacing.sm),
                  child: FilterChip(
                    label: Text(
                      note.title.isEmpty ? 'Untitled' : note.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    selected: selected,
                    onSelected: (_) {
                      ref
                          .read(trustworthyAskControllerProvider.notifier)
                          .toggleNoteSelection(note.id);
                    },
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _QueryInput extends ConsumerWidget {
  const _QueryInput({required this.state, required this.queryController});

  final TrustworthyAskState state;
  final TextEditingController queryController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: AppSpacing.paddingMd,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: queryController,
              decoration: const InputDecoration(
                hintText: 'Ask a question about your recordings...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                ref
                    .read(trustworthyAskControllerProvider.notifier)
                    .setQuery(value);
              },
              onSubmitted: (_) {
                if (state.canSubmit) {
                  ref
                      .read(trustworthyAskControllerProvider.notifier)
                      .submitQuery();
                }
              },
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          FilledButton.icon(
            onPressed: state.canSubmit
                ? () => ref
                      .read(trustworthyAskControllerProvider.notifier)
                      .submitQuery()
                : null,
            icon: const Icon(Icons.send),
            label: const Text('Ask'),
          ),
        ],
      ),
    );
  }
}

class _HintView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppSpacing.paddingXl,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.quiz_outlined,
              size: 64,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            AppSpacing.gapMd,
            Text(
              'Select recordings and ask a question',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _ResultView extends ConsumerWidget {
  const _ResultView({required this.state});

  final TrustworthyAskState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final result = state.result!;

    return ListView(
      padding: AppSpacing.paddingMd,
      children: [
        Card(
          child: Padding(
            padding: AppSpacing.paddingLg,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      result.isAnswered
                          ? Icons.lightbulb
                          : result.isAbstained
                          ? Icons.do_not_disturb_on_outlined
                          : Icons.search_off,
                      color: result.isAnswered
                          ? theme.colorScheme.primary
                          : theme.colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Text(
                      result.isAnswered ? 'Answer' : result.type.displayName,
                      style: theme.textTheme.titleMedium,
                    ),
                    const Spacer(),
                    if (result.isAnswered)
                      _ConfidenceBadge(confidence: result.confidence),
                  ],
                ),
                AppSpacing.gapSm,
                Text(result.answer, style: theme.textTheme.bodyLarge),
                if (result.isAbstained && result.abstentionReason != null) ...[
                  AppSpacing.gapSm,
                  Container(
                    padding: AppSpacing.paddingSm,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.info_outline,
                          size: 16,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: AppSpacing.xs),
                        Expanded(
                          child: Text(
                            result.abstentionReason!,
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
        AppSpacing.gapMd,
        if (result.hasSources) ...[
          Text(
            'Sources (${result.sources.length})',
            style: theme.textTheme.titleSmall,
          ),
          AppSpacing.gapSm,
          ...result.sources.asMap().entries.map(
            (entry) => _SourceCard(
              source: entry.value,
              index: entry.key + 1,
              onPlayTap: () => _playSource(ref, entry.value),
            ),
          ),
        ],
      ],
    );
  }

  Future<void> _playSource(WidgetRef ref, AskSource source) async {
    if (source.audioAsset == null) return;
    final controller = ref.read(audioPlayerControllerProvider.notifier);
    final playerState = ref.read(audioPlayerControllerProvider);

    if (playerState.currentAudioId != source.audioAsset!.id) {
      await controller.loadAudio(
        audioId: source.audioAsset!.id,
        relativePath: source.audioAsset!.relativePath,
      );
    }
    await controller.seekToMs(source.startMs);
    await controller.play();
  }
}

class _ConfidenceBadge extends StatelessWidget {
  const _ConfidenceBadge({required this.confidence});

  final double confidence;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final percentage = (confidence * 100).round();
    final color = percentage >= 70
        ? AppColors.verifiedBadge
        : percentage >= 40
        ? AppColors.needsReviewBadge
        : AppColors.unsupportedBadge;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.analytics_outlined, size: 12, color: color),
          const SizedBox(width: AppSpacing.xs),
          Text(
            '$percentage% confident',
            style: theme.textTheme.labelSmall?.copyWith(color: color),
          ),
        ],
      ),
    );
  }
}

class _SourceCard extends StatelessWidget {
  const _SourceCard({
    required this.source,
    required this.index,
    required this.onPlayTap,
  });

  final AskSource source;
  final int index;
  final VoidCallback onPlayTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: InkWell(
        onTap: source.audioAsset != null ? onPlayTap : null,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: AppSpacing.paddingMd,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(
                        '$index',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  Icon(
                    Icons.format_quote,
                    size: 16,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  Expanded(
                    child: Text(
                      source.noteTitle,
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (source.audioAsset != null) ...[
                    Icon(
                      Icons.play_circle_outline,
                      size: 18,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(width: AppSpacing.xs),
                  ],
                  Text(
                    _formatTimestamp(source.startMs),
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      fontFeatures: [const FontFeature.tabularFigures()],
                    ),
                  ),
                ],
              ),
              AppSpacing.gapXs,
              Text(
                source.segmentText,
                style: theme.textTheme.bodySmall,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
              if (source.relevanceScore > 0) ...[
                AppSpacing.gapXs,
                Row(
                  children: [
                    Icon(
                      Icons.analytics_outlined,
                      size: 12,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Text(
                      'Relevance: ${(source.relevanceScore * 100).round()}%',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  String _formatTimestamp(int ms) {
    final totalSeconds = ms ~/ 1000;
    final minutes = totalSeconds ~/ 60;
    final seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
