import 'package:voxcita/features/library/domain/note_entity.dart';

abstract interface class NoteRepository {
  Future<NoteEntity> createNote({
    required String title,
    required String body,
    required String noteType,
    String? audioAssetId,
  });

  Future<NoteEntity?> getNoteById(String id);

  Future<List<NoteEntity>> getAllNotes();

  Future<List<NoteEntity>> searchNotes(String query);

  Future<void> updateNote(NoteEntity note);

  Future<void> deleteNote(String id);

  Future<void> setFavourite(String id, bool isFavourite);

  Future<void> setPinned(String id, bool isPinned);
}
