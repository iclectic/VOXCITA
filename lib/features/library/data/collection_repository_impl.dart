import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import 'package:voxcita/core/database/voxcita_database.dart';
import 'package:voxcita/features/library/domain/collection_entity.dart';
import 'package:voxcita/features/library/domain/collection_repository.dart';

class CollectionRepositoryImpl implements CollectionRepository {
  CollectionRepositoryImpl(this._db, this._uuid);

  final VoxCitaDatabase _db;
  final Uuid _uuid;

  @override
  Future<CollectionEntity> createCollection({
    required String name,
    String description = '',
  }) async {
    final id = _uuid.v4();
    final now = DateTime.now().toUtc();

    await _db
        .into(_db.collections)
        .insert(
          CollectionsCompanion.insert(
            id: id,
            name: name,
            description: Value(description),
            createdAt: now,
          ),
        );

    return CollectionEntity(
      id: id,
      name: name,
      description: description,
      createdAt: now,
    );
  }

  @override
  Future<List<CollectionEntity>> getAllCollections() async {
    final rows = await (_db.select(
      _db.collections,
    )..orderBy([(c) => OrderingTerm.asc(c.name)])).get();
    return rows
        .map(
          (r) => CollectionEntity(
            id: r.id,
            name: r.name,
            description: r.description,
            createdAt: r.createdAt,
          ),
        )
        .toList();
  }

  @override
  Future<void> addNoteToCollection({
    required String noteId,
    required String collectionId,
  }) async {
    await _db
        .into(_db.noteCollections)
        .insert(
          NoteCollectionsCompanion.insert(
            noteId: noteId,
            collectionId: collectionId,
          ),
          mode: InsertMode.insertOrIgnore,
        );
  }

  @override
  Future<void> removeNoteFromCollection({
    required String noteId,
    required String collectionId,
  }) async {
    await (_db.delete(_db.noteCollections)..where(
          (nc) =>
              nc.noteId.equals(noteId) & nc.collectionId.equals(collectionId),
        ))
        .go();
  }

  @override
  Future<void> deleteCollection(String id) async {
    await _db.transaction(() async {
      await (_db.delete(
        _db.noteCollections,
      )..where((nc) => nc.collectionId.equals(id))).go();
      await (_db.delete(_db.collections)..where((c) => c.id.equals(id))).go();
    });
  }
}
