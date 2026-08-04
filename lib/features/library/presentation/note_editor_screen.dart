import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:voxcita/app/routing/routes.dart';
import 'package:voxcita/app/theme/app_spacing.dart';
import 'package:voxcita/core/database/database_provider.dart';
import 'package:voxcita/features/library/domain/note_type.dart';

class NoteEditorScreen extends ConsumerStatefulWidget {
  const NoteEditorScreen({this.noteId, super.key});

  final String? noteId;

  @override
  ConsumerState<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends ConsumerState<NoteEditorScreen> {
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();
  bool _isSaving = false;
  bool _isLoading = false;

  bool get _isEditing => widget.noteId != null;

  @override
  void initState() {
    super.initState();
    if (_isEditing) {
      _loadNote();
    }
  }

  Future<void> _loadNote() async {
    setState(() => _isLoading = true);
    final repo = ref.read(noteRepositoryProvider);
    final note = await repo.getNoteById(widget.noteId!);
    if (note != null) {
      _titleController.text = note.title;
      _bodyController.text = note.body;
    }
    if (mounted) setState(() => _isLoading = false);
  }

  Future<void> _save() async {
    if (_isSaving) return;

    setState(() => _isSaving = true);

    final repo = ref.read(noteRepositoryProvider);
    final title = _titleController.text.trim();
    final body = _bodyController.text.trim();

    if (title.isEmpty && body.isEmpty) {
      if (mounted) {
        setState(() => _isSaving = false);
        context.go(AppRoutes.library);
      }
      return;
    }

    try {
      if (_isEditing) {
        final note = await repo.getNoteById(widget.noteId!);
        if (note != null) {
          await repo.updateNote(
            note.copyWith(
              title: title,
              body: body,
              updatedAt: DateTime.now().toUtc(),
            ),
          );
        }
      } else {
        await repo.createNote(
          title: title.isEmpty ? 'Untitled' : title,
          body: body,
          noteType: NoteType.text.name,
        );
      }
      if (mounted) context.go(AppRoutes.library);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to save: $e')));
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(title: const Text('Loading...')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? 'Edit Note' : 'New Note'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: _isSaving ? null : _save,
          ),
        ],
      ),
      body: Padding(
        padding: AppSpacing.paddingLg,
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
              textCapitalization: TextCapitalization.sentences,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            AppSpacing.gapMd,
            Expanded(
              child: TextField(
                controller: _bodyController,
                decoration: const InputDecoration(
                  labelText: 'Note',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
                textCapitalization: TextCapitalization.sentences,
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
