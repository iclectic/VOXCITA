import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:voxcita/app/routing/routes.dart';
import 'package:voxcita/app/theme/app_spacing.dart';
import 'package:voxcita/features/insights/application/insights_list_controller.dart';
import 'package:voxcita/features/insights/application/insights_list_state.dart';
import 'package:voxcita/features/insights/domain/insight_claim_entity.dart';
import 'package:voxcita/features/insights/domain/insight_type.dart';
import 'package:voxcita/features/insights/domain/verification_state.dart';
import 'package:voxcita/shared/widgets/empty_state.dart';

class InsightsScreen extends ConsumerWidget {
  const InsightsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(insightsListControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Insights')),
      body: Column(
        children: [
          _FilterChips(state: state),
          Expanded(child: _Body(state: state)),
        ],
      ),
    );
  }
}

class _FilterChips extends ConsumerWidget {
  const _FilterChips({required this.state});

  final InsightsListState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 48,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
        children: [
          _chip(ref, 'All', InsightFilter.all),
          _chip(ref, 'Needs review', InsightFilter.needsReview),
          _chip(ref, 'Verified', InsightFilter.verified),
          _chip(ref, 'Corrected', InsightFilter.corrected),
          _chip(ref, 'Unsupported', InsightFilter.unsupported),
        ],
      ),
    );
  }

  Widget _chip(WidgetRef ref, String label, InsightFilter filter) {
    final selected = state.filter == filter;
    return Padding(
      padding: const EdgeInsets.only(right: AppSpacing.sm),
      child: FilterChip(
        label: Text(label),
        selected: selected,
        onSelected: (_) {
          ref.read(insightsListControllerProvider.notifier).setFilter(filter);
        },
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.state});

  final InsightsListState state;

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
        icon: Icons.lightbulb_outline,
        title: 'No insights yet',
        message: 'Cited insights will appear here after transcription.',
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.only(bottom: AppSpacing.xl),
      itemCount: state.filteredClaims.length,
      itemBuilder: (context, index) {
        final claim = state.filteredClaims[index];
        return _ClaimCard(claim: claim);
      },
    );
  }
}

class _ClaimCard extends ConsumerWidget {
  const _ClaimCard({required this.claim});

  final InsightClaimEntity claim;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final controller = ref.read(insightsListControllerProvider.notifier);

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
        leading: _ClaimTypeIcon(type: claim.claimType),
        title: Text(
          claim.claimText,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.bodyMedium,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpacing.gapXs,
            Row(
              children: [
                _VerificationBadge(state: claim.verificationState),
                const SizedBox(width: AppSpacing.sm),
                if (claim.hasSources)
                  Row(
                    children: [
                      Icon(
                        Icons.format_quote,
                        size: 14,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: AppSpacing.xs),
                      Text(
                        '${claim.sources.length} source${claim.sources.length > 1 ? 's' : ''}',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                const Spacer(),
                Text(
                  _formatDate(claim.createdAt),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ],
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            switch (value) {
              case 'verify':
                controller.setVerificationState(
                  claim.id,
                  VerificationState.verified,
                );
              case 'correct':
                controller.setVerificationState(
                  claim.id,
                  VerificationState.corrected,
                );
              case 'unsupported':
                controller.setVerificationState(
                  claim.id,
                  VerificationState.unsupported,
                );
              case 'delete':
                _confirmDelete(context, controller, claim.id);
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem(value: 'verify', child: Text('Mark verified')),
            const PopupMenuItem(
              value: 'correct',
              child: Text('Mark corrected'),
            ),
            const PopupMenuItem(
              value: 'unsupported',
              child: Text('Mark unsupported'),
            ),
            PopupMenuItem(
              value: 'delete',
              child: Text(
                'Delete',
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ),
          ],
        ),
        onTap: () => context.go('${AppRoutes.insights}/${claim.id}'),
      ),
    );
  }

  void _confirmDelete(
    BuildContext context,
    InsightsListController controller,
    String claimId,
  ) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete insight?'),
        content: const Text('This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              controller.deleteClaim(claimId);
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

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);
    if (diff.inHours < 1) return '${diff.inMinutes}m ago';
    if (diff.inDays < 1) return '${diff.inHours}h ago';
    if (diff.inDays < 7) return '${diff.inDays}d ago';
    return '${date.day}/${date.month}/${date.year}';
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
