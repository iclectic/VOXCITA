import 'package:drift/drift.dart';
import 'package:voxcita/core/database/tables/notes.dart';

class ModelRuns extends Table {
  TextColumn get id => text()();
  TextColumn get noteId => text().references(Notes, #id)();
  TextColumn get modelUsed => text()();
  TextColumn get modelVersion => text()();
  TextColumn get promptVersion => text()();
  TextColumn get inputTranscriptHash => text()();
  IntColumn get processingDurationMs => integer().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
