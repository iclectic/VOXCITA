import 'package:drift/drift.dart';
import 'package:voxcita/core/database/tables/notes.dart';
import 'package:voxcita/core/database/tables/tags.dart';

class NoteTags extends Table {
  TextColumn get noteId => text().references(Notes, #id)();
  TextColumn get tagId => text().references(Tags, #id)();

  @override
  Set<Column> get primaryKey => {noteId, tagId};
}
