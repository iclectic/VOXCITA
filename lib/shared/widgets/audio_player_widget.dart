import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voxcita/app/theme/app_spacing.dart';
import 'package:voxcita/core/audio/audio_player_controller.dart';
import 'package:voxcita/features/capture/domain/audio_asset_entity.dart';

class AudioPlayerWidget extends ConsumerStatefulWidget {
  const AudioPlayerWidget({
    required this.audioAsset,
    this.startMs,
    this.endMs,
    this.label,
    super.key,
  });

  final AudioAssetEntity audioAsset;
  final int? startMs;
  final int? endMs;
  final String? label;

  @override
  ConsumerState<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends ConsumerState<AudioPlayerWidget> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(audioPlayerControllerProvider);
    final theme = Theme.of(context);
    final isCurrentAudio = state.currentAudioId == widget.audioAsset.id;

    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Padding(
        padding: AppSpacing.paddingMd,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.label != null) ...[
              Text(
                widget.label!,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
              AppSpacing.gapXs,
            ],
            Row(
              children: [
                _PlayButton(
                  isPlaying: isCurrentAudio && state.isPlaying,
                  isLoading: _isLoading || (isCurrentAudio && state.isLoading),
                  onPressed: _onPlayTap,
                ),
                const SizedBox(width: AppSpacing.md),
              ],
            ),
            if (isCurrentAudio && !state.isLoading) ...[
              AppSpacing.gapSm,
              _SeekBar(
                position: state.position,
                duration: state.duration ?? Duration.zero,
                startMs: widget.startMs,
                endMs: widget.endMs,
                onSeek: (position) {
                  ref
                      .read(audioPlayerControllerProvider.notifier)
                      .seekTo(position);
                },
              ),
              AppSpacing.gapXs,
              _TimeRow(
                position: state.position,
                duration: state.duration ?? Duration.zero,
              ),
            ],
            if (isCurrentAudio && state.hasError)
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
        ),
      ),
    );
  }

  Future<void> _onPlayTap() async {
    final controller = ref.read(audioPlayerControllerProvider.notifier);
    final state = ref.read(audioPlayerControllerProvider);

    if (state.currentAudioId == widget.audioAsset.id) {
      await controller.togglePlayPause();
      return;
    }

    setState(() => _isLoading = true);
    await controller.loadAudio(
      audioId: widget.audioAsset.id,
      relativePath: widget.audioAsset.relativePath,
    );
    setState(() => _isLoading = false);

    if (widget.startMs != null) {
      await controller.seekToMs(widget.startMs!);
    }
    await controller.play();
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton({
    required this.isPlaying,
    required this.isLoading,
    required this.onPressed,
  });

  final bool isPlaying;
  final bool isLoading;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return IconButton.filled(
      icon: isLoading
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: theme.colorScheme.onPrimary,
              ),
            )
          : Icon(isPlaying ? Icons.pause : Icons.play_arrow),
      onPressed: isLoading ? null : onPressed,
    );
  }
}

class _SeekBar extends StatelessWidget {
  const _SeekBar({
    required this.position,
    required this.duration,
    this.startMs,
    this.endMs,
    required this.onSeek,
  });

  final Duration position;
  final Duration duration;
  final int? startMs;
  final int? endMs;
  final ValueChanged<Duration> onSeek;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final totalMs = duration.inMilliseconds > 0
        ? duration.inMilliseconds.toDouble()
        : 1.0;
    final posMs = position.inMilliseconds.clamp(0, totalMs.toInt());

    return Column(
      children: [
        if (startMs != null && endMs != null)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.xs),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: null,
                minHeight: 2,
                backgroundColor: theme.colorScheme.surfaceContainerHighest,
                valueColor: AlwaysStoppedAnimation(
                  theme.colorScheme.tertiary.withValues(alpha: 0.3),
                ),
              ),
            ),
          ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
          ),
          child: Slider(
            value: posMs.toDouble(),
            max: totalMs,
            onChanged: (value) {
              onSeek(Duration(milliseconds: value.round()));
            },
          ),
        ),
        if (startMs != null && endMs != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
            child: Row(
              children: [
                Text(
                  _formatDuration(Duration(milliseconds: startMs!)),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.tertiary,
                  ),
                ),
                const Spacer(),
                Text(
                  _formatDuration(Duration(milliseconds: endMs!)),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.tertiary,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes;
    final seconds = d.inSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}

class _TimeRow extends StatelessWidget {
  const _TimeRow({required this.position, required this.duration});

  final Duration position;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Text(
          _formatDuration(position),
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            fontFeatures: [const FontFeature.tabularFigures()],
          ),
        ),
        const Spacer(),
        Text(
          _formatDuration(duration),
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            fontFeatures: [const FontFeature.tabularFigures()],
          ),
        ),
      ],
    );
  }

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes;
    final seconds = d.inSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
