import 'package:drift/drift.dart';
import 'package:voxcita/core/database/tables/audio_assets.dart';
import 'package:voxcita/core/database/tables/notes.dart';

class TranscriptSegments extends Table {
  TextColumn get id => text()();
  TextColumn get noteId => text().references(Notes, #id)();
  TextColumn get audioAssetId => text().references(AudioAssets, #id)();
  IntColumn get startMs => integer()();
  IntColumn get endMs => integer()();
  TextColumn get originalText => text()();
  TextColumn get currentText => text()();
  RealColumn get confidence => real().nullable()();
  TextColumn get detectedLanguage => text().nullable()();
  TextColumn get speakerLabel => text().nullable()();
  TextColumn get engineName => text()();
  TextColumn get modelVersion => text()();
  TextColumn get processingSettings => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
