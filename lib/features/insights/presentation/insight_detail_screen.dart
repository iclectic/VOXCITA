import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:voxcita/app/routing/routes.dart';
import 'package:voxcita/app/theme/app_spacing.dart';
import 'package:voxcita/core/audio/audio_player_controller.dart';
import 'package:voxcita/features/capture/domain/audio_asset_entity.dart';
import 'package:voxcita/features/feedback/application/feedback_controller.dart';
import 'package:voxcita/features/feedback/domain/feedback_entity.dart';
import 'package:voxcita/features/insights/application/insight_detail_controller.dart';
import 'package:voxcita/features/insights/domain/insight_claim_entity.dart';
import 'package:voxcita/features/insights/domain/insight_type.dart';
import 'package:voxcita/features/insights/domain/verification_state.dart';
import 'package:voxcita/shared/widgets/audio_player_widget.dart';
import 'package:voxcita/shared/widgets/evidence_timeline.dart';
import 'package:voxcita/shared/widgets/empty_state.dart';

class InsightDetailScreen extends ConsumerWidget {
  const InsightDetailScreen({required this.claimId, super.key});

  final String claimId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(insightDetailControllerProvider(claimId));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go(AppRoutes.insights),
        ),
        title: const Text('Insight'),
        actions: [
          if (state.claim != null)
            PopupMenuButton<String>(
              onSelected: (value) async {
                switch (value) {
                  case 'delete':
                    _confirmDelete(context, ref);
                }
              },
              itemBuilder: (context) => [
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
      ),
      body: _Body(state: state, claimId: claimId),
    );
  }

  void _confirmDelete(BuildContext context, WidgetRef ref) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete insight?'),
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
                  .read(insightDetailControllerProvider(claimId).notifier)
                  .deleteClaim();
              if (context.mounted) context.go(AppRoutes.insights);
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

class _Body extends ConsumerWidget {
  const _Body({required this.state, required this.claimId});

  final InsightDetailState state;
  final String claimId;

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

    final claim = state.claim;
    if (claim == null) {
      return const EmptyState(
        icon: Icons.lightbulb_outline,
        title: 'Insight not found',
        message: 'This insight may have been deleted.',
      );
    }

    return ListView(
      padding: AppSpacing.paddingLg,
      children: [
        _ClaimHeader(claim: claim),
        AppSpacing.gapMd,
        Text(claim.claimText, style: Theme.of(context).textTheme.bodyLarge),
        AppSpacing.gapLg,
        _VerificationActions(claim: claim, claimId: claimId),
        AppSpacing.gapLg,
        if (state.hasAudio && state.audioAsset != null) ...[
          AudioPlayerWidget(
            audioAsset: state.audioAsset!,
            label: 'Source audio',
          ),
          AppSpacing.gapLg,
        ],
        if (state.validation != null)
          EvidenceTimeline(
            claim: claim,
            segments: state.segments,
            validation: state.validation!,
            onSourceTap: (source, segment) =>
                _onSourceTap(context, ref, source, state.audioAsset),
          )
        else
          _SourcesSection(claim: claim),
        AppSpacing.gapLg,
        _MetadataSection(claim: claim),
        AppSpacing.gapLg,
        _FeedbackSection(claimId: claimId),
      ],
    );
  }

  void _onSourceTap(
    BuildContext context,
    WidgetRef ref,
    ClaimSourceEntity source,
    AudioAssetEntity? audioAsset,
  ) async {
    if (audioAsset == null) return;
    final controller = ref.read(audioPlayerControllerProvider.notifier);
    final playerState = ref.read(audioPlayerControllerProvider);

    if (playerState.currentAudioId != audioAsset.id) {
      await controller.loadAudio(
        audioId: audioAsset.id,
        relativePath: audioAsset.relativePath,
      );
    }
    await controller.seekToMs(source.audioStartMs);
    await controller.play();
  }
}

class _ClaimHeader extends StatelessWidget {
  const _ClaimHeader({required this.claim});

  final InsightClaimEntity claim;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        _ClaimTypeIcon(type: claim.claimType),
        const SizedBox(width: AppSpacing.sm),
        Text(
          claim.claimType.name,
          style: theme.textTheme.titleMedium?.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
        const Spacer(),
        _VerificationBadge(state: claim.verificationState),
      ],
    );
  }
}

class _VerificationActions extends ConsumerWidget {
  const _VerificationActions({required this.claim, required this.claimId});

  final InsightClaimEntity claim;
  final String claimId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final controller = ref.read(
      insightDetailControllerProvider(claimId).notifier,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Verification', style: theme.textTheme.titleSmall),
        AppSpacing.gapSm,
        Wrap(
          spacing: AppSpacing.sm,
          children: [
            _actionChip(
              context,
              'Verify',
              Icons.check_circle_outline,
              VerificationState.verified,
              claim.verificationState,
              controller,
            ),
            _actionChip(
              context,
              'Correct',
              Icons.edit_outlined,
              VerificationState.corrected,
              claim.verificationState,
              controller,
            ),
            _actionChip(
              context,
              'Unsupported',
              Icons.cancel_outlined,
              VerificationState.unsupported,
              claim.verificationState,
              controller,
            ),
            _actionChip(
              context,
              'Needs review',
              Icons.help_outline,
              VerificationState.needsReview,
              claim.verificationState,
              controller,
            ),
          ],
        ),
      ],
    );
  }

  Widget _actionChip(
    BuildContext context,
    String label,
    IconData icon,
    VerificationState targetState,
    VerificationState currentState,
    InsightDetailController controller,
  ) {
    final isSelected = currentState == targetState;
    final theme = Theme.of(context);

    return ActionChip(
      label: Text(label),
      avatar: Icon(icon, size: 18),
      backgroundColor: isSelected
          ? theme.colorScheme.primary.withValues(alpha: 0.12)
          : null,
      onPressed: isSelected
          ? null
          : () => controller.setVerificationState(targetState),
    );
  }
}

class _SourcesSection extends StatelessWidget {
  const _SourcesSection({required this.claim});

  final InsightClaimEntity claim;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (!claim.hasSources) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Sources', style: theme.textTheme.titleSmall),
          AppSpacing.gapSm,
          Text(
            'No sources linked to this claim.',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sources (${claim.sources.length})',
          style: theme.textTheme.titleSmall,
        ),
        AppSpacing.gapSm,
        ...claim.sources.map((source) => _SourceTile(source: source)),
      ],
    );
  }
}

class _SourceTile extends StatelessWidget {
  const _SourceTile({required this.source});

  final ClaimSourceEntity source;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: ListTile(
        leading: Icon(Icons.format_quote, color: theme.colorScheme.primary),
        title: Text(
          'Segment: ${source.transcriptSegmentId.substring(0, 8)}...',
          style: theme.textTheme.bodyMedium,
        ),
        subtitle: Text(
          'Audio: ${_formatMs(source.audioStartMs)} - ${_formatMs(source.audioEndMs)}',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }

  String _formatMs(int ms) {
    final totalSeconds = ms ~/ 1000;
    final minutes = totalSeconds ~/ 60;
    final seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}

class _MetadataSection extends StatelessWidget {
  const _MetadataSection({required this.claim});

  final InsightClaimEntity claim;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Metadata', style: theme.textTheme.titleSmall),
        AppSpacing.gapSm,
        _metaRow('Model', '${claim.modelUsed} v${claim.modelVersion}'),
        _metaRow('Prompt version', claim.promptVersion),
        _metaRow('Input hash', claim.inputTranscriptHash.substring(0, 16)),
        if (claim.supportScore != null)
          _metaRow('Support score', '${(claim.supportScore! * 100).round()}%'),
        if (claim.processingDurationMs != null)
          _metaRow('Processing time', '${claim.processingDurationMs}ms'),
        _metaRow('Created', _formatDate(claim.createdAt)),
        _metaRow('Updated', _formatDate(claim.updatedAt)),
      ],
    );
  }

  Widget _metaRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: TextStyle(color: ThemeData().colorScheme.onSurfaceVariant),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }
}

class _ClaimTypeIcon extends StatelessWidget {
  const _ClaimTypeIcon({required this.type});

  final InsightType type;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final (icon, color) = switch (type) {
      InsightType.summary => (
        Icons.summarize_outlined,
        theme.colorScheme.primary,
      ),
      InsightType.decision => (
        Icons.check_circle_outline,
        theme.colorScheme.tertiary,
      ),
      InsightType.action => (
        Icons.task_alt_outlined,
        theme.colorScheme.secondary,
      ),
      InsightType.question => (
        Icons.help_outline,
        theme.colorScheme.onSurfaceVariant,
      ),
      InsightType.idea => (Icons.lightbulb_outline, theme.colorScheme.primary),
    };

    return CircleAvatar(
      backgroundColor: color.withValues(alpha: 0.12),
      child: Icon(icon, color: color, size: 20),
    );
  }
}

class _VerificationBadge extends StatelessWidget {
  const _VerificationBadge({required this.state});

  final VerificationState state;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final (color, bg) = switch (state) {
      VerificationState.verified => (
        theme.colorScheme.primary,
        theme.colorScheme.primary.withValues(alpha: 0.12),
      ),
      VerificationState.corrected => (
        theme.colorScheme.tertiary,
        theme.colorScheme.tertiary.withValues(alpha: 0.12),
      ),
      VerificationState.unsupported => (
        theme.colorScheme.error,
        theme.colorScheme.error.withValues(alpha: 0.12),
      ),
      VerificationState.needsReview => (
        theme.colorScheme.onSurfaceVariant,
        theme.colorScheme.surfaceContainerHighest,
      ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        state.displayName,
        style: theme.textTheme.labelSmall?.copyWith(color: color),
      ),
    );
  }
}

class _FeedbackSection extends ConsumerStatefulWidget {
  const _FeedbackSection({required this.claimId});

  final String claimId;

  @override
  ConsumerState<_FeedbackSection> createState() => _FeedbackSectionState();
}

class _FeedbackSectionState extends ConsumerState<_FeedbackSection> {
  final _detailController = TextEditingController();
  bool _showDetailField = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(feedbackControllerProvider.notifier)
          .loadFeedbackForClaim(widget.claimId);
    });
  }

  @override
  void dispose() {
    _detailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final state = ref.watch(feedbackControllerProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Feedback', style: theme.textTheme.titleSmall),
        AppSpacing.gapXs,
        Text(
          'Is this insight helpful? Your feedback stays on your device.',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        AppSpacing.gapSm,
        if (state.isSubmitting)
          const Padding(
            padding: AppSpacing.paddingSm,
            child: Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          )
        else
          Wrap(
            spacing: AppSpacing.sm,
            children: FeedbackType.values.map((type) {
              final isSelected = state.feedbackForClaim?.feedbackType == type;
              return ActionChip(
                label: Text(type.displayName),
                avatar: Icon(type.icon, size: 18),
                backgroundColor: isSelected
                    ? theme.colorScheme.primary.withValues(alpha: 0.12)
                    : null,
                onPressed: () => _submitFeedback(type),
              );
            }).toList(),
          ),
        if (state.hasFeedback && state.feedbackForClaim!.hasDetail) ...[
          AppSpacing.gapSm,
          Container(
            padding: AppSpacing.paddingSm,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              state.feedbackForClaim!.feedbackDetail!,
              style: theme.textTheme.bodySmall,
            ),
          ),
        ],
        if (!_showDetailField && !state.isSubmitting)
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.xs),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                onPressed: () => setState(() => _showDetailField = true),
                icon: const Icon(Icons.edit_note, size: 18),
                label: const Text('Add detail'),
              ),
            ),
          ),
        if (_showDetailField) ...[
          AppSpacing.gapSm,
          TextField(
            controller: _detailController,
            maxLines: 3,
            decoration: const InputDecoration(
              labelText: 'Additional detail (optional)',
              border: OutlineInputBorder(),
            ),
          ),
          AppSpacing.gapXs,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => setState(() => _showDetailField = false),
                child: const Text('Cancel'),
              ),
              const SizedBox(width: AppSpacing.sm),
              FilledButton(
                onPressed: () {
                  final detail = _detailController.text.trim();
                  if (detail.isNotEmpty) {
                    final currentType = state.feedbackForClaim?.feedbackType;
                    if (currentType != null) {
                      ref
                          .read(feedbackControllerProvider.notifier)
                          .submitFeedback(
                            claimId: widget.claimId,
                            type: currentType,
                            detail: detail,
                          );
                    }
                  }
                  setState(() => _showDetailField = false);
                  _detailController.clear();
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ],
        if (state.hasError)
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.xs),
            child: Text(
              state.error!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.error,
              ),
            ),
          ),
      ],
    );
  }

  void _submitFeedback(FeedbackType type) {
    ref
        .read(feedbackControllerProvider.notifier)
        .submitFeedback(
          claimId: widget.claimId,
          type: type,
          detail: _detailController.text.trim().isNotEmpty
              ? _detailController.text.trim()
              : null,
        );
    setState(() => _showDetailField = false);
    _detailController.clear();
  }
}
