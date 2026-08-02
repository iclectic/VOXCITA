import 'package:flutter/material.dart';
import 'package:voxcita/shared/widgets/empty_state.dart';

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Insights')),
      body: const EmptyState(
        icon: Icons.lightbulb_outline,
        title: 'No insights yet',
        message: 'Cited insights will appear here after transcription.',
      ),
    );
  }
}
