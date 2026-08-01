import 'package:flutter/material.dart';
import 'package:voxcita/shared/widgets/empty_state.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Library'),
      ),
      body: const EmptyState(
        icon: Icons.library_books_outlined,
        title: 'Your library is empty',
        message: 'Record a voice note or create a text note to get started.',
      ),
    );
  }
}
