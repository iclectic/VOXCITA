import 'package:drift/drift.dart';

class AudioAssets extends Table {
  TextColumn get id => text()();
  TextColumn get relativePath => text()();
  TextColumn get mimeType => text().withDefault(const Constant('audio/m4a'))();
  IntColumn get durationMs => integer()();
  IntColumn get fileSizeBytes => integer()();
  TextColumn get sha256Hash => text()();
  TextColumn get waveformJson => text().nullable()();
  BoolColumn get isOriginal => boolean().withDefault(const Constant(true))();
  TextColumn get derivedFromId =>
      text().nullable().references(AudioAssets, #id)();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
