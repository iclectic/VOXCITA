import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:voxcita/app/routing/routes.dart';
import 'package:voxcita/app/theme/app_spacing.dart';
import 'package:voxcita/core/audio/audio_player_controller.dart';
import 'package:voxcita/features/capture/domain/audio_asset_entity.dart';
import 'package:voxcita/features/transcription/application/transcript_controller.dart';
import 'package:voxcita/features/transcription/application/transcript_state.dart';
import 'package:voxcita/features/transcription/domain/transcript_segment_entity.dart';
import 'package:voxcita/shared/widgets/audio_player_widget.dart';
import 'package:voxcita/shared/widgets/empty_state.dart';

class TranscriptDetailScreen extends ConsumerWidget {
  const TranscriptDetailScreen({required this.noteId, super.key});

  final String noteId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(transcriptDetailControllerProvider(noteId));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go(AppRoutes.transcription),
        ),
        title: const Text('Transcript'),
      ),
      body: _Body(state: state, noteId: noteId),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({required this.state, required this.noteId});

  final TranscriptDetailState state;
  final String noteId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.hasError) {
      return Center(
        child: Padding(
          padding: AppSpacing.paddingXl,
          child: Text(
            state.error!,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.error,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    final note = state.note;
    if (note == null) {
      return const EmptyState(
        icon: Icons.transcribe_outlined,
        title: 'Note not found',
        message: 'This note may have been deleted.',
      );
    }

    if (!state.hasSegments) {
      return const EmptyState(
        icon: Icons.transcribe_outlined,
        title: 'No transcript yet',
        message: 'This recording has not been transcribed yet.',
      );
    }

    return Column(
      children: [
        _SummaryBar(state: state),
        if (state.hasAudio && state.audioAsset != null)
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.sm,
            ),
            child: AudioPlayerWidget(
              audioAsset: state.audioAsset!,
              label: 'Recording',
            ),
          ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(bottom: AppSpacing.xl),
            itemCount: state.segments.length,
            itemBuilder: (context, index) {
              final segment = state.segments[index];
              return _SegmentTile(
                segment: segment,
                isEditing: state.editingSegmentId == segment.id,
                noteId: noteId,
                audioAsset: state.audioAsset,
              );
            },
          ),
        ),
      ],
    );
  }
}

class _SummaryBar extends StatelessWidget {
  const _SummaryBar({required this.state});

  final TranscriptDetailState state;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: AppSpacing.paddingMd,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        border: Border(
          bottom: BorderSide(color: theme.colorScheme.outlineVariant),
        ),
      ),
      child: Row(
        children: [
          _stat(context, Icons.segment, '${state.segments.length}', 'segments'),
          const SizedBox(width: AppSpacing.lg),
          _stat(
            context,
            Icons.timer_outlined,
            _formatDuration(state.totalDurationMs),
            'duration',
          ),
          const SizedBox(width: AppSpacing.lg),
          _stat(context, Icons.edit, '${state.correctedCount}', 'corrected'),
        ],
      ),
    );
  }

  Widget _stat(
    BuildContext context,
    IconData icon,
    String value,
    String label,
  ) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, size: 16, color: theme.colorScheme.onSurfaceVariant),
            const SizedBox(width: AppSpacing.xs),
            Text(
              value,
              style: theme.textTheme.titleSmall?.copyWith(
                fontFeatures: [const FontFeature.tabularFigures()],
              ),
            ),
          ],
        ),
        Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  String _formatDuration(int ms) {
    final totalSeconds = ms ~/ 1000;
    final minutes = totalSeconds ~/ 60;
    final seconds = totalSeconds % 60;
    return '${minutes}m ${seconds}s';
  }
}

class _SegmentTile extends ConsumerWidget {
  const _SegmentTile({
    required this.segment,
    required this.isEditing,
    required this.noteId,
    this.audioAsset,
  });

  final TranscriptSegmentEntity segment;
  final bool isEditing;
  final String noteId;
  final AudioAssetEntity? audioAsset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final controller = ref.read(
      transcriptDetailControllerProvider(noteId).notifier,
    );

    if (isEditing) {
      return _EditingTile(segment: segment, controller: controller);
    }

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xs,
      ),
      child: Padding(
        padding: AppSpacing.paddingMd,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (audioAsset != null)
                  InkWell(
                    onTap: () => _playSegment(ref, audioAsset!),
                    borderRadius: BorderRadius.circular(4),
                    child: Padding(
                      padding: const EdgeInsets.only(right: AppSpacing.xs),
                      child: Icon(
                        Icons.play_circle_outline,
                        size: 18,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  )
                else
                  Icon(
                    Icons.access_time,
                    size: 14,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                Text(
                  _formatTimestamp(segment.startMs),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.primary,
                    fontFeatures: [const FontFeature.tabularFigures()],
                  ),
                ),
                Text(
                  ' - ${_formatTimestamp(segment.endMs)}',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    fontFeatures: [const FontFeature.tabularFigures()],
                  ),
                ),
                const Spacer(),
                if (segment.isCorrected) ...[
                  Icon(Icons.edit, size: 14, color: theme.colorScheme.tertiary),
                  const SizedBox(width: AppSpacing.xs),
                  Text(
                    'corrected',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.tertiary,
                    ),
                  ),
                ],
                if (segment.confidence != null) ...[
                  const SizedBox(width: AppSpacing.sm),
                  _ConfidenceIndicator(confidence: segment.confidence!),
                ],
              ],
            ),
            if (segment.speakerLabel != null) ...[
              AppSpacing.gapXs,
              Text(
                segment.speakerLabel!,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
            AppSpacing.gapXs,
            Text(segment.currentText, style: theme.textTheme.bodyMedium),
            AppSpacing.gapXs,
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                icon: const Icon(Icons.edit, size: 16),
                label: const Text('Edit'),
                onPressed: () => controller.startEditing(segment.id),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _playSegment(WidgetRef ref, AudioAssetEntity asset) async {
    final controller = ref.read(audioPlayerControllerProvider.notifier);
    final playerState = ref.read(audioPlayerControllerProvider);

    if (playerState.currentAudioId != asset.id) {
      await controller.loadAudio(
        audioId: asset.id,
        relativePath: asset.relativePath,
      );
    }
    await controller.seekToMs(segment.startMs);
    await controller.play();
  }

  String _formatTimestamp(int ms) {
    final totalSeconds = ms ~/ 1000;
    final minutes = totalSeconds ~/ 60;
    final seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}

class _EditingTile extends ConsumerStatefulWidget {
  const _EditingTile({required this.segment, required this.controller});

  final TranscriptSegmentEntity segment;
  final TranscriptDetailController controller;

  @override
  ConsumerState<_EditingTile> createState() => _EditingTileState();
}

class _EditingTileState extends ConsumerState<_EditingTile> {
  late final TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: widget.segment.currentText);
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xs,
      ),
      color: theme.colorScheme.surfaceContainerLow,
      child: Padding(
        padding: AppSpacing.paddingMd,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  _formatTimestamp(widget.segment.startMs),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
                const Spacer(),
                Text(
                  'Original: ${widget.segment.originalText}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            AppSpacing.gapSm,
            TextField(
              controller: _textController,
              maxLines: null,
              autofocus: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Corrected text',
              ),
            ),
            AppSpacing.gapSm,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => widget.controller.cancelEditing(),
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: AppSpacing.sm),
                FilledButton(
                  onPressed: () => widget.controller.saveCorrection(
                    widget.segment.id,
                    _textController.text.trim(),
                  ),
                  child: const Text('Save'),
                ),
              ],
            ),
          ],
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

class _ConfidenceIndicator extends StatelessWidget {
  const _ConfidenceIndicator({required this.confidence});

  final double confidence;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final percentage = (confidence * 100).round();
    final color = percentage >= 80
        ? theme.colorScheme.primary
        : percentage >= 50
        ? theme.colorScheme.tertiary
        : theme.colorScheme.error;

    return Row(
      children: [
        Icon(Icons.analytics_outlined, size: 14, color: color),
        const SizedBox(width: AppSpacing.xs),
        Text(
          '$percentage%',
          style: theme.textTheme.labelSmall?.copyWith(color: color),
        ),
      ],
    );
  }
}
