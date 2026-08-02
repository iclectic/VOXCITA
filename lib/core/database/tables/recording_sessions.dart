import 'package:drift/drift.dart';
import 'package:voxcita/core/database/tables/audio_assets.dart';
import 'package:voxcita/core/database/tables/notes.dart';

class RecordingSessions extends Table {
  TextColumn get id => text()();
  TextColumn get noteId => text().nullable().references(Notes, #id)();
  TextColumn get audioAssetId =>
      text().nullable().references(AudioAssets, #id)();
  TextColumn get status => text()();
  DateTimeColumn get startedAt => dateTime()();
  DateTimeColumn get endedAt => dateTime().nullable()();
  IntColumn get checkpointMs => integer().withDefault(const Constant(0))();
  TextColumn get errorMessage => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
