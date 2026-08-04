import 'dart:math' as math;

import 'package:flutter/material.dart';

class WaveformDisplay extends StatefulWidget {
  const WaveformDisplay({
    required this.amplitude,
    required this.maxAmplitude,
    required this.isActive,
    super.key,
  });

  final double amplitude;
  final double maxAmplitude;
  final bool isActive;

  @override
  State<WaveformDisplay> createState() => _WaveformDisplayState();
}

class _WaveformDisplayState extends State<WaveformDisplay>
    with TickerProviderStateMixin {
  static const int _barCount = 48;
  final List<double> _bars = List.filled(_barCount, 0.05);
  late final AnimationController _idleController;

  @override
  void initState() {
    super.initState();
    _idleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void didUpdateWidget(WaveformDisplay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive && widget.amplitude != oldWidget.amplitude) {
      _bars.removeAt(0);
      final normalised = _normalise(widget.amplitude);
      _bars.add(normalised);
    }
  }

  double _normalise(double amplitude) {
    const minDb = -60.0;
    const maxDb = 0.0;
    final clamped = amplitude.clamp(minDb, maxDb);
    return (clamped - minDb) / (maxDb - minDb);
  }

  @override
  void dispose() {
    _idleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedBuilder(
      animation: _idleController,
      builder: (context, child) {
        return CustomPaint(
          painter: _WaveformPainter(
            bars: _bars,
            color: theme.colorScheme.primary,
            idleProgress: widget.isActive ? null : _idleController.value,
          ),
          child: const SizedBox(height: 80, width: double.infinity),
        );
      },
    );
  }
}

class _WaveformPainter extends CustomPainter {
  _WaveformPainter({
    required this.bars,
    required this.color,
    this.idleProgress,
  });

  final List<double> bars;
  final Color color;
  final double? idleProgress;

  @override
  void paint(Canvas canvas, Size size) {
    final barWidth = size.width / bars.length;
    final centerY = size.height / 2;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    for (var i = 0; i < bars.length; i++) {
      double height;
      if (idleProgress != null) {
        final wave = math.sin(
          (i / bars.length) * math.pi * 2 + idleProgress! * math.pi * 2,
        );
        height = (wave * 0.5 + 0.5) * size.height * 0.3 + size.height * 0.05;
      } else {
        height = bars[i] * size.height;
      }

      final x = i * barWidth + barWidth / 2;
      final barHeight = height.clamp(2.0, size.height);

      paint.strokeWidth = barWidth * 0.6;

      canvas.drawLine(
        Offset(x, centerY - barHeight / 2),
        Offset(x, centerY + barHeight / 2),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_WaveformPainter oldDelegate) =>
      bars != oldDelegate.bars ||
      color != oldDelegate.color ||
      idleProgress != oldDelegate.idleProgress;
}
