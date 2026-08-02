import 'package:drift/drift.dart';

class SchemaMigrations extends Table {
  IntColumn get version => integer()();
  TextColumn get description => text()();
  DateTimeColumn get appliedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {version};
}
