import 'package:drift/drift.dart';

class AskHistory extends Table {
  TextColumn get id => text()();
  TextColumn get query => text()();
  TextColumn get resultType => text()();
  TextColumn get answerText => text()();
  RealColumn get confidence => real().withDefault(const Constant(0))();
  TextColumn get abstentionReason => text().nullable()();
  TextColumn get sourceNoteIds => text()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
