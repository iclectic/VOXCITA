import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:voxcita/app/routing/routes.dart';
import 'package:voxcita/app/theme/app_spacing.dart';
import 'package:voxcita/features/library/application/note_detail_controller.dart';
import 'package:voxcita/features/transcription/domain/transcript_segment_entity.dart';
import 'package:voxcita/shared/widgets/empty_state.dart';

class NoteDetailScreen extends ConsumerWidget {
  const NoteDetailScreen({required this.noteId, super.key});

  final String noteId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(noteDetailControllerProvider(noteId));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go(AppRoutes.library),
        ),
        title: const Text('Note'),
        actions: [
          if (state.note != null) ...[
            IconButton(
              icon: Icon(
                state.note!.isFavourite ? Icons.star : Icons.star_border,
              ),
              onPressed: () => ref
                  .read(noteDetailControllerProvider(noteId).notifier)
                  .toggleFavourite(),
            ),
            IconButton(
              icon: Icon(
                state.note!.isPinned ? Icons.push_pin : Icons.push_pin_outlined,
              ),
              onPressed: () => ref
                  .read(noteDetailControllerProvider(noteId).notifier)
                  .togglePinned(),
            ),
            PopupMenuButton<String>(
              onSelected: (value) async {
                switch (value) {
                  case 'edit':
                    context.go('${AppRoutes.library}/$noteId/edit');
                  case 'delete':
                    _confirmDelete(context, ref);
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(value: 'edit', child: Text('Edit')),
                PopupMenuItem(
                  value: 'delete',
                  child: Text(
                    'Delete',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
      body: _Body(state: state, noteId: noteId),
    );
  }

  void _confirmDelete(BuildContext context, WidgetRef ref) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete note?'),
        content: const Text('This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(dialogContext).pop();
              await ref
                  .read(noteDetailControllerProvider(noteId).notifier)
                  .deleteNote();
              if (context.mounted) context.go(AppRoutes.library);
            },
            child: Text(
              'Delete',
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.state, required this.noteId});

  final NoteDetailState state;
  final String noteId;

  @override
  Widget build(BuildContext context) {
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
        icon: Icons.note_outlined,
        title: 'Note not found',
        message: 'This note may have been deleted.',
      );
    }

    return ListView(
      padding: AppSpacing.paddingLg,
      children: [
        Text(
          note.title.isEmpty ? 'Untitled' : note.title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        AppSpacing.gapSm,
        Row(
          children: [
            Icon(
              note.noteType.name == 'voice'
                  ? Icons.graphic_eq_outlined
                  : Icons.article_outlined,
              size: 16,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: AppSpacing.xs),
            Text(
              note.noteType.name == 'voice' ? 'Voice note' : 'Text note',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const Spacer(),
            Text(
              _formatDate(note.updatedAt),
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        AppSpacing.gapMd,
        if (note.body.isNotEmpty)
          Text(note.body, style: Theme.of(context).textTheme.bodyLarge),
        if (state.isVoiceNote) ...[
          AppSpacing.gapXl,
          _TranscriptSection(state: state, noteId: noteId),
        ],
      ],
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }
}

class _TranscriptSection extends StatelessWidget {
  const _TranscriptSection({required this.state, required this.noteId});

  final NoteDetailState state;
  final String noteId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Transcript', style: theme.textTheme.titleMedium),
        AppSpacing.gapSm,
        if (!state.hasSegments)
          const EmptyState(
            icon: Icons.transcribe_outlined,
            title: 'No transcript yet',
            message: 'Transcript will appear after processing.',
          )
        else
          ...state.segments.map((segment) => _SegmentTile(segment: segment)),
      ],
    );
  }
}

class _SegmentTile extends StatelessWidget {
  const _SegmentTile({required this.segment});

  final TranscriptSegmentEntity segment;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isCorrected = segment.isCorrected;

    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Padding(
        padding: AppSpacing.paddingMd,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
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
                if (isCorrected)
                  Icon(Icons.edit, size: 14, color: theme.colorScheme.tertiary),
                if (segment.confidence != null) ...[
                  const SizedBox(width: AppSpacing.sm),
                  Text(
                    '${(segment.confidence! * 100).round()}%',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ],
            ),
            AppSpacing.gapXs,
            Text(segment.currentText, style: theme.textTheme.bodyMedium),
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
