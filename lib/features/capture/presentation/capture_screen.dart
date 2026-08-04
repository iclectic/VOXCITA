import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voxcita/app/theme/app_spacing.dart';
import 'package:voxcita/features/capture/application/recording_providers.dart';
import 'package:voxcita/features/capture/application/recording_session_state.dart';
import 'package:voxcita/features/capture/domain/recording_session_status.dart';
import 'package:voxcita/shared/widgets/waveform_display.dart';

class CaptureScreen extends ConsumerWidget {
  const CaptureScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(recordingSessionControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Capture')),
      body: state.isIdle && !state.hasError
          ? _IdleView(state: state)
          : _RecordingView(state: state),
    );
  }
}

class _IdleView extends StatelessWidget {
  const _IdleView({required this.state});

  final RecordingSessionState state;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: AppSpacing.paddingXl,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (state.status == RecordingSessionStatus.completed)
              Icon(
                Icons.check_circle_outline,
                size: 64,
                color: theme.colorScheme.primary,
              )
            else
              Icon(
                Icons.mic_none_outlined,
                size: 64,
                color: theme.colorScheme.onSurfaceVariant.withValues(
                  alpha: 0.5,
                ),
              ),
            AppSpacing.gapLg,
            Text(
              state.status == RecordingSessionStatus.completed
                  ? 'Recording saved'
                  : 'Ready to record',
              style: theme.textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            AppSpacing.gapSm,
            Text(
              state.status == RecordingSessionStatus.completed
                  ? 'Your recording has been saved to the library.'
                  : 'Tap the microphone to start a new recording.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            AppSpacing.gapXxl,
            _RecordButton(),
          ],
        ),
      ),
    );
  }
}

class _RecordingView extends ConsumerWidget {
  const _RecordingView({required this.state});

  final RecordingSessionState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Padding(
        padding: AppSpacing.paddingXl,
        child: Column(
          children: [
            AppSpacing.gapXxl,
            _TimerDisplay(elapsedMs: state.elapsedMs),
            AppSpacing.gapLg,
            WaveformDisplay(
              amplitude: state.amplitude,
              maxAmplitude: state.maxAmplitude,
              isActive: state.isRecording,
            ),
            AppSpacing.gapXxl,
            if (state.hasError)
              Padding(
                padding: AppSpacing.paddingSmH,
                child: Text(
                  state.error!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.error,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            const Spacer(),
            _ControlBar(state: state),
            AppSpacing.gapXxl,
          ],
        ),
      ),
    );
  }
}

class _TimerDisplay extends StatelessWidget {
  const _TimerDisplay({required this.elapsedMs});

  final int elapsedMs;

  String _format() {
    final totalSeconds = elapsedMs ~/ 1000;
    final hours = totalSeconds ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;
    final seconds = totalSeconds % 60;
    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:'
          '${minutes.toString().padLeft(2, '0')}:'
          '${seconds.toString().padLeft(2, '0')}';
    }
    return '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      _format(),
      style: theme.textTheme.displaySmall?.copyWith(
        fontFeatures: [const FontFeature.tabularFigures()],
      ),
    );
  }
}

class _ControlBar extends ConsumerWidget {
  const _ControlBar({required this.state});

  final RecordingSessionState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(recordingSessionControllerProvider.notifier);

    if (state.isRecording) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _ControlButton(
            icon: Icons.cancel_outlined,
            label: 'Cancel',
            color: Theme.of(context).colorScheme.error,
            onPressed: () => controller.cancelRecording(),
          ),
          _ControlButton(
            icon: Icons.pause,
            label: 'Pause',
            color: Theme.of(context).colorScheme.primary,
            onPressed: () => controller.pauseRecording(),
          ),
          _ControlButton(
            icon: Icons.stop,
            label: 'Stop',
            color: Theme.of(context).colorScheme.primary,
            onPressed: () => controller.stopRecording(),
          ),
        ],
      );
    }

    if (state.isPaused) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _ControlButton(
            icon: Icons.cancel_outlined,
            label: 'Cancel',
            color: Theme.of(context).colorScheme.error,
            onPressed: () => controller.cancelRecording(),
          ),
          _ControlButton(
            icon: Icons.play_arrow,
            label: 'Resume',
            color: Theme.of(context).colorScheme.primary,
            onPressed: () => controller.resumeRecording(),
          ),
          _ControlButton(
            icon: Icons.stop,
            label: 'Stop',
            color: Theme.of(context).colorScheme.primary,
            onPressed: () => controller.stopRecording(),
          ),
        ],
      );
    }

    return _RecordButton();
  }
}

class _RecordButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final controller = ref.read(recordingSessionControllerProvider.notifier);

    return FilledButton.icon(
      onPressed: () => controller.startRecording(),
      icon: const Icon(Icons.fiber_manual_record, size: 32),
      label: const Padding(
        padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
        child: Text('Start Recording', style: TextStyle(fontSize: 18)),
      ),
      style: FilledButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.xxl),
        ),
      ),
    );
  }
}

class _ControlButton extends StatelessWidget {
  const _ControlButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton.filled(
          onPressed: onPressed,
          icon: Icon(icon, size: 28),
          style: IconButton.styleFrom(
            backgroundColor: color.withValues(alpha: 0.15),
            foregroundColor: color,
            minimumSize: const Size(64, 64),
          ),
        ),
        AppSpacing.gapXs,
        Text(label, style: Theme.of(context).textTheme.labelMedium),
      ],
    );
  }
}
