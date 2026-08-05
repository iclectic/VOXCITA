import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:voxcita/core/database/tables/ask_history.dart';
import 'package:voxcita/core/database/tables/audio_assets.dart';
import 'package:voxcita/core/database/tables/claim_sources.dart';
import 'package:voxcita/core/database/tables/collections.dart';
import 'package:voxcita/core/database/tables/insight_claims.dart';
import 'package:voxcita/core/database/tables/model_runs.dart';
import 'package:voxcita/core/database/tables/note_collections.dart';
import 'package:voxcita/core/database/tables/note_tags.dart';
import 'package:voxcita/core/database/tables/notes.dart';
import 'package:voxcita/core/database/tables/processing_jobs.dart';
import 'package:voxcita/core/database/tables/recording_sessions.dart';
import 'package:voxcita/core/database/tables/schema_migrations.dart';
import 'package:voxcita/core/database/tables/tags.dart';
import 'package:voxcita/core/database/tables/transcript_revisions.dart';
import 'package:voxcita/core/database/tables/transcript_segments.dart';
import 'package:voxcita/core/database/tables/user_feedback.dart';

part 'voxcita_database.g.dart';

@DriftDatabase(
  tables: [
    Notes,
    AudioAssets,
    RecordingSessions,
    TranscriptSegments,
    TranscriptRevisions,
    InsightClaims,
    ClaimSources,
    Collections,
    NoteCollections,
    Tags,
    NoteTags,
    ProcessingJobs,
    ModelRuns,
    UserFeedback,
    AskHistory,
    SchemaMigrations,
  ],
)
class VoxCitaDatabase extends _$VoxCitaDatabase {
  VoxCitaDatabase() : super(_openConnection());

  VoxCitaDatabase.forTesting(super.e);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
        await _recordMigration(m, 1, 'Initial schema');
      },
      onUpgrade: (m, from, to) async {
        if (from < 2) {
          await m.createTable(askHistory);
          await _recordMigration(m, 2, 'Add ask_history table');
        }
      },
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }

  Future<void> _recordMigration(
    Migrator m,
    int version,
    String description,
  ) async {
    await into(schemaMigrations).insert(
      SchemaMigrationsCompanion.insert(
        version: Value(version),
        description: description,
        appliedAt: DateTime.now().toUtc(),
      ),
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'voxcita.db'));
    return NativeDatabase.createInBackground(file);
  });
}
