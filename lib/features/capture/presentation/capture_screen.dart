import 'package:flutter/material.dart';
import 'package:voxcita/shared/widgets/empty_state.dart';

class CaptureScreen extends StatelessWidget {
  const CaptureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Capture'),
      ),
      body: const EmptyState(
        icon: Icons.mic_none_outlined,
        title: 'Ready to record',
        message: 'Tap the microphone to start a new recording.',
      ),
    );
  }
}
