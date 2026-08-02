import 'package:flutter/material.dart';
import 'package:voxcita/app/theme/app_spacing.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({
    required this.icon,
    required this.title,
    required this.message,
    this.action,
    super.key,
  });

  final IconData icon;
  final String title;
  final String message;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: AppSpacing.paddingXl,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 64,
              color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
            ),
            AppSpacing.gapLg,
            Text(
              title,
              style: theme.textTheme.titleMedium,
              textAlign: TextAlign.center,
              semanticsLabel: title,
            ),
            AppSpacing.gapSm,
            Text(
              message,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
              semanticsLabel: message,
            ),
            if (action != null) ...[AppSpacing.gapXl, action!],
          ],
        ),
      ),
    );
  }
}
