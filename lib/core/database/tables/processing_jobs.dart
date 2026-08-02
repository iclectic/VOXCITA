import 'package:drift/drift.dart';
import 'package:voxcita/core/database/tables/notes.dart';

class ProcessingJobs extends Table {
  TextColumn get id => text()();
  TextColumn get noteId => text().references(Notes, #id)();
  TextColumn get jobType => text()();
  TextColumn get status => text()();
  RealColumn get progress => real().withDefault(const Constant(0.0))();
  TextColumn get errorMessage => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get startedAt => dateTime().nullable()();
  DateTimeColumn get completedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
