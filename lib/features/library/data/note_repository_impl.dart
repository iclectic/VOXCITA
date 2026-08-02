import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import 'package:voxcita/core/database/voxcita_database.dart';
import 'package:voxcita/features/library/domain/note_entity.dart';
import 'package:voxcita/features/library/domain/note_repository.dart';
import 'package:voxcita/features/library/domain/note_type.dart';

class NoteRepositoryImpl implements NoteRepository {
  NoteRepositoryImpl(this._db, this._uuid);

  final VoxCitaDatabase _db;
  final Uuid _uuid;

  @override
  Future<NoteEntity> createNote({
    required String title,
    required String body,
    required String noteType,
    String? audioAssetId,
  }) async {
    final now = DateTime.now().toUtc();
    final id = _uuid.v4();

    await _db
        .into(_db.notes)
        .insert(
          NotesCompanion.insert(
            id: id,
            title: Value(title),
            body: Value(body),
            noteType: noteType,
            audioAssetId: Value(audioAssetId),
            createdAt: now,
            updatedAt: now,
          ),
        );

    return NoteEntity(
      id: id,
      title: title,
      body: body,
      noteType: NoteType.fromString(noteType),
      audioAssetId: audioAssetId,
      createdAt: now,
      updatedAt: now,
    );
  }

  @override
  Future<NoteEntity?> getNoteById(String id) async {
    final row = await (_db.select(
      _db.notes,
    )..where((n) => n.id.equals(id))).getSingleOrNull();
    if (row == null) return null;
    return _mapToEntity(row);
  }

  @override
  Future<List<NoteEntity>> getAllNotes() async {
    final rows = await (_db.select(
      _db.notes,
    )..orderBy([(n) => OrderingTerm.desc(n.updatedAt)])).get();
    return rows.map(_mapToEntity).toList();
  }

  @override
  Future<List<NoteEntity>> searchNotes(String query) async {
    final lowerQuery = query.toLowerCase();
    final rows =
        await (_db.select(_db.notes)
              ..where(
                (n) =>
                    n.title.lower().contains(lowerQuery) |
                    n.body.lower().contains(lowerQuery),
              )
              ..orderBy([(n) => OrderingTerm.desc(n.updatedAt)]))
            .get();
    return rows.map(_mapToEntity).toList();
  }

  @override
  Future<void> updateNote(NoteEntity note) async {
    await (_db.update(_db.notes)..where((n) => n.id.equals(note.id))).write(
      NotesCompanion(
        title: Value(note.title),
        body: Value(note.body),
        updatedAt: Value(note.updatedAt),
        isFavourite: Value(note.isFavourite),
        isPinned: Value(note.isPinned),
      ),
    );
  }

  @override
  Future<void> deleteNote(String id) async {
    await (_db.delete(_db.notes)..where((n) => n.id.equals(id))).go();
  }

  @override
  Future<void> setFavourite(String id, bool isFavourite) async {
    await (_db.update(_db.notes)..where((n) => n.id.equals(id))).write(
      NotesCompanion(
        isFavourite: Value(isFavourite),
        updatedAt: Value(DateTime.now().toUtc()),
      ),
    );
  }

  @override
  Future<void> setPinned(String id, bool isPinned) async {
    await (_db.update(_db.notes)..where((n) => n.id.equals(id))).write(
      NotesCompanion(
        isPinned: Value(isPinned),
        updatedAt: Value(DateTime.now().toUtc()),
      ),
    );
  }

  NoteEntity _mapToEntity(Note row) {
    return NoteEntity(
      id: row.id,
      title: row.title,
      body: row.body,
      noteType: NoteType.fromString(row.noteType),
      audioAssetId: row.audioAssetId,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      isFavourite: row.isFavourite,
      isPinned: row.isPinned,
    );
  }
}
