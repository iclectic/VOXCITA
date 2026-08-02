import 'package:flutter/material.dart';
import 'package:voxcita/shared/widgets/empty_state.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Review')),
      body: const EmptyState(
        icon: Icons.task_alt_outlined,
        title: 'Nothing to review',
        message: 'Unverified actions and decisions will appear here.',
      ),
    );
  }
}
