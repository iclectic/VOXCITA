import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import 'package:voxcita/core/database/voxcita_database.dart';
import 'package:voxcita/features/library/domain/tag_entity.dart';
import 'package:voxcita/features/library/domain/tag_repository.dart';

class TagRepositoryImpl implements TagRepository {
  TagRepositoryImpl(this._db, this._uuid);

  final VoxCitaDatabase _db;
  final Uuid _uuid;

  @override
  Future<TagEntity> createTag({required String name}) async {
    final id = _uuid.v4();
    final now = DateTime.now().toUtc();

    await _db
        .into(_db.tags)
        .insert(TagsCompanion.insert(id: id, name: name, createdAt: now));

    return TagEntity(id: id, name: name, createdAt: now);
  }

  @override
  Future<List<TagEntity>> getAllTags() async {
    final rows = await (_db.select(
      _db.tags,
    )..orderBy([(t) => OrderingTerm.asc(t.name)])).get();
    return rows
        .map((r) => TagEntity(id: r.id, name: r.name, createdAt: r.createdAt))
        .toList();
  }

  @override
  Future<void> addTagToNote({
    required String noteId,
    required String tagId,
  }) async {
    await _db
        .into(_db.noteTags)
        .insert(
          NoteTagsCompanion.insert(noteId: noteId, tagId: tagId),
          mode: InsertMode.insertOrIgnore,
        );
  }

  @override
  Future<void> removeTagFromNote({
    required String noteId,
    required String tagId,
  }) async {
    await (_db.delete(
      _db.noteTags,
    )..where((nt) => nt.noteId.equals(noteId) & nt.tagId.equals(tagId))).go();
  }

  @override
  Future<List<TagEntity>> getTagsForNote(String noteId) async {
    final query = _db.select(_db.tags).join([
      innerJoin(_db.noteTags, _db.noteTags.tagId.equalsExp(_db.tags.id)),
    ])..where(_db.noteTags.noteId.equals(noteId));

    final rows = await query.get();
    return rows
        .map(
          (r) => TagEntity(
            id: r.readTable(_db.tags).id,
            name: r.readTable(_db.tags).name,
            createdAt: r.readTable(_db.tags).createdAt,
          ),
        )
        .toList();
  }

  @override
  Future<void> deleteTag(String id) async {
    await _db.transaction(() async {
      await (_db.delete(_db.noteTags)..where((nt) => nt.tagId.equals(id))).go();
      await (_db.delete(_db.tags)..where((t) => t.id.equals(id))).go();
    });
  }
}
