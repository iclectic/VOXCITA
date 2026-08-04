import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:voxcita/app/routing/routes.dart';
import 'package:voxcita/app/theme/app_spacing.dart';
import 'package:voxcita/features/library/application/note_list_controller.dart';
import 'package:voxcita/features/library/application/note_list_state.dart';
import 'package:voxcita/features/library/domain/note_entity.dart';
import 'package:voxcita/shared/widgets/empty_state.dart';

class LibraryScreen extends ConsumerStatefulWidget {
  const LibraryScreen({super.key});

  @override
  ConsumerState<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends ConsumerState<LibraryScreen> {
  bool _isSearching = false;
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(noteListControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? TextField(
                controller: _searchController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Search notes...',
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  ref
                      .read(noteListControllerProvider.notifier)
                      .setSearchQuery(value);
                },
              )
            : const Text('Library'),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
                if (!_isSearching) {
                  _searchController.clear();
                  ref.read(noteListControllerProvider.notifier).clearSearch();
                }
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _FilterChips(state: state),
          Expanded(child: _Body(state: state)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('${AppRoutes.library}/new'),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _FilterChips extends ConsumerWidget {
  const _FilterChips({required this.state});

  final NoteListState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 48,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
        children: [
          _chip(ref, 'All', NoteFilter.all),
          _chip(ref, 'Favourites', NoteFilter.favourites),
          _chip(ref, 'Pinned', NoteFilter.pinned),
          _chip(ref, 'Voice', NoteFilter.voice),
          _chip(ref, 'Text', NoteFilter.text),
        ],
      ),
    );
  }

  Widget _chip(WidgetRef ref, String label, NoteFilter filter) {
    final selected = state.filter == filter;
    return Padding(
      padding: const EdgeInsets.only(right: AppSpacing.sm),
      child: FilterChip(
        label: Text(label),
        selected: selected,
        onSelected: (_) {
          ref.read(noteListControllerProvider.notifier).setFilter(filter);
        },
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.state});

  final NoteListState state;

  @override
  Widget build(BuildContext context) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.hasError) {
      return Center(
        child: Padding(
          padding: AppSpacing.paddingXl,
          child: Text(
            state.error!,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.error,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    if (state.isEmpty) {
      return const EmptyState(
        icon: Icons.library_books_outlined,
        title: 'Your library is empty',
        message: 'Record a voice note or create a text note to get started.',
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 80),
      itemCount: state.filteredNotes.length,
      itemBuilder: (context, index) {
        final note = state.filteredNotes[index];
        return _NoteCard(note: note);
      },
    );
  }
}

class _NoteCard extends ConsumerWidget {
  const _NoteCard({required this.note});

  final NoteEntity note;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final controller = ref.read(noteListControllerProvider.notifier);

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xs,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        leading: Icon(
          note.noteType.name == 'voice'
              ? Icons.graphic_eq_outlined
              : Icons.article_outlined,
          color: theme.colorScheme.primary,
        ),
        title: Row(
          children: [
            if (note.isPinned)
              Padding(
                padding: const EdgeInsets.only(right: AppSpacing.xs),
                child: Icon(
                  Icons.push_pin,
                  size: 16,
                  color: theme.colorScheme.tertiary,
                ),
              ),
            Expanded(
              child: Text(
                note.title.isEmpty ? 'Untitled' : note.title,
                style: theme.textTheme.titleSmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (note.body.isNotEmpty)
              Text(
                note.body,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            AppSpacing.gapXs,
            Row(
              children: [
                Text(
                  _formatDate(note.updatedAt),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                if (note.isFavourite) ...[
                  const SizedBox(width: AppSpacing.sm),
                  Icon(
                    Icons.star,
                    size: 14,
                    color: theme.colorScheme.secondary,
                  ),
                ],
              ],
            ),
          ],
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            switch (value) {
              case 'favourite':
                controller.toggleFavourite(note.id, note.isFavourite);
              case 'pin':
                controller.togglePinned(note.id, note.isPinned);
              case 'delete':
                _confirmDelete(context, controller, note.id);
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'favourite',
              child: Text(note.isFavourite ? 'Unfavourite' : 'Favourite'),
            ),
            PopupMenuItem(
              value: 'pin',
              child: Text(note.isPinned ? 'Unpin' : 'Pin'),
            ),
            PopupMenuItem(
              value: 'delete',
              child: Text(
                'Delete',
                style: TextStyle(color: theme.colorScheme.error),
              ),
            ),
          ],
        ),
        onTap: () => context.go('${AppRoutes.library}/${note.id}'),
      ),
    );
  }

  void _confirmDelete(
    BuildContext context,
    NoteListController controller,
    String noteId,
  ) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete note?'),
        content: const Text('This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              controller.deleteNote(noteId);
            },
            child: Text(
              'Delete',
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);
    if (diff.inMinutes < 1) return 'Just now';
    if (diff.inHours < 1) return '${diff.inMinutes}m ago';
    if (diff.inDays < 1) return '${diff.inHours}h ago';
    if (diff.inDays < 7) return '${diff.inDays}d ago';
    return '${date.day}/${date.month}/${date.year}';
  }
}
