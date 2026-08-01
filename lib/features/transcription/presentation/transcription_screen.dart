import 'package:flutter/material.dart';
import 'package:voxcita/shared/widgets/empty_state.dart';

class TranscriptionScreen extends StatelessWidget {
  const TranscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transcription'),
      ),
      body: const EmptyState(
        icon: Icons.transcribe_outlined,
        title: 'No transcriptions yet',
        message: 'Transcripts will appear here after processing a recording.',
      ),
    );
  }
}
