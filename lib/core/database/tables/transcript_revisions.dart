import 'package:drift/drift.dart';
import 'package:voxcita/core/database/tables/transcript_segments.dart';

class TranscriptRevisions extends Table {
  TextColumn get id => text()();
  TextColumn get segmentId => text().references(TranscriptSegments, #id)();
  TextColumn get previousText => text()();
  TextColumn get correctedText => text()();
  TextColumn get revisedBy => text().withDefault(const Constant('user'))();
  DateTimeColumn get revisedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
