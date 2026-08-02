import 'package:flutter/material.dart';
import 'package:voxcita/shared/widgets/empty_state.dart';

class TrustworthyAskScreen extends StatelessWidget {
  const TrustworthyAskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trustworthy Ask')),
      body: const EmptyState(
        icon: Icons.help_outline,
        title: 'Ask with sources',
        message: 'Select recordings and ask a question to get cited answers.',
      ),
    );
  }
}
