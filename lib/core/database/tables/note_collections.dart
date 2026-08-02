import 'package:drift/drift.dart';
import 'package:voxcita/core/database/tables/collections.dart';
import 'package:voxcita/core/database/tables/notes.dart';

class NoteCollections extends Table {
  TextColumn get noteId => text().references(Notes, #id)();
  TextColumn get collectionId => text().references(Collections, #id)();

  @override
  Set<Column> get primaryKey => {noteId, collectionId};
}
