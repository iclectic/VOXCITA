import 'package:flutter/material.dart';
import 'package:voxcita/app/theme/app_colors.dart';
import 'package:voxcita/app/theme/app_spacing.dart';
import 'package:voxcita/features/insights/domain/citation_validator.dart';
import 'package:voxcita/features/insights/domain/insight_claim_entity.dart';
import 'package:voxcita/features/insights/domain/insight_type.dart';
import 'package:voxcita/features/insights/domain/verification_state.dart';
import 'package:voxcita/features/transcription/domain/transcript_segment_entity.dart';

class EvidenceTimeline extends StatelessWidget {
  const EvidenceTimeline({
    required this.claim,
    required this.segments,
    required this.validation,
    required this.onSourceTap,
    super.key,
  });

  final InsightClaimEntity claim;
  final List<TranscriptSegmentEntity> segments;
  final ClaimValidationSummary validation;
  final void Function(
    ClaimSourceEntity source,
    TranscriptSegmentEntity? segment,
  )
  onSourceTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Evidence Map', style: theme.textTheme.titleSmall),
        AppSpacing.gapXs,
        Text(
          '${validation.validCount} of ${claim.sources.length} sources validated',
          style: theme.textTheme.bodySmall?.copyWith(
            color: validation.allValid
                ? AppColors.verifiedBadge
                : theme.colorScheme.onSurfaceVariant,
          ),
        ),
        AppSpacing.gapMd,
        ..._buildTimelineItems(context),
      ],
    );
  }

  List<Widget> _buildTimelineItems(BuildContext context) {
    final theme = Theme.of(context);
    final segmentMap = <String, TranscriptSegmentEntity>{
      for (final s in segments) s.id: s,
    };

    final sortedSources = List<ClaimSourceEntity>.from(claim.sources)
      ..sort((a, b) => a.audioStartMs.compareTo(b.audioStartMs));

    return sortedSources.asMap().entries.map((entry) {
      final index = entry.key;
      final source = entry.value;
      final result = validation.results.firstWhere(
        (r) => r.source.id == source.id,
        orElse: () => CitationValidationResult(
          source: source,
          status: CitationStatus.orphaned,
        ),
      );
      final segment = segmentMap[source.transcriptSegmentId];
      final isLast = index == sortedSources.length - 1;

      return _TimelineItem(
        source: source,
        segment: segment,
        result: result,
        isLast: isLast,
        onTap: () => onSourceTap(source, segment),
        theme: theme,
      );
    }).toList();
  }
}

class _TimelineItem extends StatelessWidget {
  const _TimelineItem({
    required this.source,
    required this.segment,
    required this.result,
    required this.isLast,
    required this.onTap,
    required this.theme,
  });

  final ClaimSourceEntity source;
  final TranscriptSegmentEntity? segment;
  final CitationValidationResult result;
  final bool isLast;
  final VoidCallback onTap;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final isValid = result.isValid;
    final color = isValid
        ? AppColors.verifiedBadge
        : result.status == CitationStatus.outOfRange
        ? theme.colorScheme.tertiary
        : AppColors.unsupportedBadge;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 32,
            child: Column(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isValid ? Icons.check : Icons.error_outline,
                    size: 14,
                    color: color,
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: theme.colorScheme.outlineVariant,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: onTap,
                child: Padding(
                  padding: AppSpacing.paddingSm,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.play_circle_outline,
                            size: 16,
                            color: theme.colorScheme.primary,
                          ),
                          const SizedBox(width: AppSpacing.xs),
                          Text(
                            _formatTimestamp(source.audioStartMs),
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: theme.colorScheme.primary,
                              fontFeatures: [
                                const FontFeature.tabularFigures(),
                              ],
                            ),
                          ),
                          Text(
                            ' - ${_formatTimestamp(source.audioEndMs)}',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                              fontFeatures: [
                                const FontFeature.tabularFigures(),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.chevron_right,
                            size: 16,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ],
                      ),
                      if (segment != null) ...[
                        AppSpacing.gapXs,
                        Text(
                          segment!.currentText,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                      if (!isValid && result.reason != null) ...[
                        AppSpacing.gapXs,
                        Text(
                          result.reason!,
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: color,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
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

class ClaimTypeBadge extends StatelessWidget {
  const ClaimTypeBadge({required this.type, super.key});

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

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: AppSpacing.xs),
          Text(
            type.name,
            style: theme.textTheme.labelSmall?.copyWith(color: color),
          ),
        ],
      ),
    );
  }
}

class VerificationBadge extends StatelessWidget {
  const VerificationBadge({required this.state, super.key});

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
