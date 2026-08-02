import 'package:drift/drift.dart';
import 'package:voxcita/core/database/tables/notes.dart';

class InsightClaims extends Table {
  TextColumn get id => text()();
  TextColumn get noteId => text().references(Notes, #id)();
  TextColumn get claimText => text()();
  TextColumn get claimType => text()();
  TextColumn get modelUsed => text()();
  TextColumn get modelVersion => text()();
  TextColumn get promptVersion => text()();
  RealColumn get supportScore => real().nullable()();
  TextColumn get verificationState =>
      text().withDefault(const Constant('needs_review'))();
  TextColumn get inputTranscriptHash => text()();
  IntColumn get processingDurationMs => integer().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
