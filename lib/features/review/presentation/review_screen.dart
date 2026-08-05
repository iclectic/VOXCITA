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

class ReviewScreen extends ConsumerWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(insightsListControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Review'),
        actions: [
          if (state.needsReviewCount > 0)
            Padding(
              padding: const EdgeInsets.only(right: AppSpacing.md),
              child: Center(
                child: Text(
                  '${state.needsReviewCount} pending',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ),
        ],
      ),
      body: _Body(state: state),
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

    final needsReview = state.claims
        .where((c) => c.verificationState == VerificationState.needsReview)
        .toList();

    if (needsReview.isEmpty) {
      return const EmptyState(
        icon: Icons.task_alt_outlined,
        title: 'Nothing to review',
        message: 'All insights have been reviewed. Great work!',
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.only(bottom: AppSpacing.xl),
      itemCount: needsReview.length,
      itemBuilder: (context, index) {
        final claim = needsReview[index];
        return _ReviewCard(claim: claim);
      },
    );
  }
}

class _ReviewCard extends ConsumerWidget {
  const _ReviewCard({required this.claim});

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
      child: Padding(
        padding: AppSpacing.paddingMd,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _ClaimTypeIcon(type: claim.claimType),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  claim.claimType.name,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
                const Spacer(),
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
                        '${claim.sources.length}',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            AppSpacing.gapSm,
            Text(
              claim.claimText,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium,
            ),
            AppSpacing.gapSm,
            Row(
              children: [
                _quickAction(
                  context,
                  'Verify',
                  Icons.check,
                  theme.colorScheme.primary,
                  () => controller.setVerificationState(
                    claim.id,
                    VerificationState.verified,
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                _quickAction(
                  context,
                  'Correct',
                  Icons.edit,
                  theme.colorScheme.tertiary,
                  () => controller.setVerificationState(
                    claim.id,
                    VerificationState.corrected,
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                _quickAction(
                  context,
                  'Reject',
                  Icons.close,
                  theme.colorScheme.error,
                  () => controller.setVerificationState(
                    claim.id,
                    VerificationState.unsupported,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () =>
                      context.go('${AppRoutes.insights}/${claim.id}'),
                  child: const Text('Details'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _quickAction(
    BuildContext context,
    String label,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return ActionChip(
      label: Text(label),
      avatar: Icon(icon, size: 16),
      onPressed: onTap,
    );
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
