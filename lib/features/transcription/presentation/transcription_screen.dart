import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:voxcita/app/routing/routes.dart';
import 'package:voxcita/app/theme/app_spacing.dart';
import 'package:voxcita/features/library/domain/note_entity.dart';
import 'package:voxcita/features/transcription/application/transcript_controller.dart';
import 'package:voxcita/features/transcription/application/transcript_state.dart';
import 'package:voxcita/shared/widgets/empty_state.dart';

class TranscriptionScreen extends ConsumerWidget {
  const TranscriptionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(transcriptListControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Transcription')),
      body: _Body(state: state),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.state});

  final TranscriptListState state;

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

    if (state.isEmpty) {
      return const EmptyState(
        icon: Icons.transcribe_outlined,
        title: 'No transcriptions yet',
        message: 'Transcripts will appear here after processing a recording.',
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.only(bottom: AppSpacing.xl),
      itemCount: state.voiceNotes.length,
      itemBuilder: (context, index) {
        final note = state.voiceNotes[index];
        final segmentCount = state.segmentCountFor(note.id);
        return _TranscriptCard(note: note, segmentCount: segmentCount);
      },
    );
  }
}

class _TranscriptCard extends StatelessWidget {
  const _TranscriptCard({required this.note, required this.segmentCount});

  final NoteEntity note;
  final int segmentCount;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasTranscript = segmentCount > 0;

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xs,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        leading: Icon(
          hasTranscript ? Icons.transcribe : Icons.graphic_eq_outlined,
          color: hasTranscript
              ? theme.colorScheme.primary
              : theme.colorScheme.onSurfaceVariant,
        ),
        title: Text(
          note.title.isEmpty ? 'Untitled recording' : note.title,
          style: theme.textTheme.titleSmall,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpacing.gapXs,
            Row(
              children: [
                if (hasTranscript) ...[
                  Icon(
                    Icons.check_circle,
                    size: 14,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  Text(
                    '$segmentCount segment${segmentCount > 1 ? 's' : ''}',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ] else ...[
                  Icon(
                    Icons.pending,
                    size: 14,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  Text(
                    'Not transcribed',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
                const Spacer(),
                Text(
                  _formatDate(note.updatedAt),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ],
        ),
        onTap: () => context.go('${AppRoutes.transcription}/${note.id}'),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);
    if (diff.inHours < 1) return '${diff.inMinutes}m ago';
    if (diff.inDays < 1) return '${diff.inHours}h ago';
    if (diff.inDays < 7) return '${diff.inDays}d ago';
    return '${date.day}/${date.month}/${date.year}';
  }
}
