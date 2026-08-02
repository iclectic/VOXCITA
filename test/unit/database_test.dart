import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uuid/uuid.dart';
import 'package:voxcita/core/database/voxcita_database.dart';

void main() {
  late VoxCitaDatabase db;

  setUp(() {
    db = VoxCitaDatabase.forTesting(NativeDatabase.memory());
  });

  tearDown(() async {
    await db.close();
  });

  group('VoxCitaDatabase', () {
    test('creates all tables on initialisation', () async {
      final tables = await db
          .customSelect(
            "SELECT name FROM sqlite_master WHERE type='table' ORDER BY name",
          )
          .get();

      final tableNames = tables.map((row) => row.read<String>('name')).toList();

      expect(tableNames, contains('notes'));
      expect(tableNames, contains('audio_assets'));
      expect(tableNames, contains('recording_sessions'));
      expect(tableNames, contains('transcript_segments'));
      expect(tableNames, contains('transcript_revisions'));
      expect(tableNames, contains('insight_claims'));
      expect(tableNames, contains('claim_sources'));
      expect(tableNames, contains('collections'));
      expect(tableNames, contains('note_collections'));
      expect(tableNames, contains('tags'));
      expect(tableNames, contains('note_tags'));
      expect(tableNames, contains('processing_jobs'));
      expect(tableNames, contains('model_runs'));
      expect(tableNames, contains('user_feedback'));
      expect(tableNames, contains('schema_migrations'));
    });

    test('enables foreign keys', () async {
      final result = await db.customSelect('PRAGMA foreign_keys').get();
      expect(result.first.read<int>('foreign_keys'), 1);
    });

    test('records schema migration on creation', () async {
      final migrations = await db.select(db.schemaMigrations).get();
      expect(migrations, hasLength(1));
      expect(migrations.first.version, 1);
      expect(migrations.first.description, 'Initial schema');
    });

    test('schema version is 1', () {
      expect(db.schemaVersion, 1);
    });
  });

  group('Notes CRUD', () {
    test('insert and retrieve a note', () async {
      final now = DateTime.now().toUtc();
      const id = 'test-note-1';

      await db
          .into(db.notes)
          .insert(
            NotesCompanion.insert(
              id: id,
              noteType: 'text',
              createdAt: now,
              updatedAt: now,
            ),
          );

      final note = await (db.select(
        db.notes,
      )..where((n) => n.id.equals(id))).getSingle();

      expect(note.id, id);
      expect(note.noteType, 'text');
      expect(note.title, '');
      expect(note.body, '');
      expect(note.isFavourite, isFalse);
      expect(note.isPinned, isFalse);
    });

    test('update note fields', () async {
      final now = DateTime.now().toUtc();
      const id = 'test-note-2';

      await db
          .into(db.notes)
          .insert(
            NotesCompanion.insert(
              id: id,
              noteType: 'text',
              createdAt: now,
              updatedAt: now,
            ),
          );

      await (db.update(db.notes)..where((n) => n.id.equals(id))).write(
        const NotesCompanion(
          title: Value('Updated title'),
          isFavourite: Value(true),
        ),
      );

      final note = await (db.select(
        db.notes,
      )..where((n) => n.id.equals(id))).getSingle();

      expect(note.title, 'Updated title');
      expect(note.isFavourite, isTrue);
    });

    test('delete a note', () async {
      final now = DateTime.now().toUtc();
      const id = 'test-note-3';

      await db
          .into(db.notes)
          .insert(
            NotesCompanion.insert(
              id: id,
              noteType: 'text',
              createdAt: now,
              updatedAt: now,
            ),
          );

      await (db.delete(db.notes)..where((n) => n.id.equals(id))).go();

      final notes = await db.select(db.notes).get();
      expect(notes, isEmpty);
    });
  });

  group('Foreign key enforcement', () {
    test('cannot insert transcript segment with non-existent note', () async {
      final now = DateTime.now().toUtc();

      expect(
        () => db
            .into(db.transcriptSegments)
            .insert(
              TranscriptSegmentsCompanion.insert(
                id: 'seg-1',
                noteId: 'non-existent-note',
                audioAssetId: 'non-existent-audio',
                startMs: 0,
                endMs: 1000,
                originalText: 'test',
                currentText: 'test',
                engineName: 'test',
                modelVersion: 'test',
                createdAt: now,
              ),
            ),
        throwsA(isA<Object>()),
      );
    });
  });

  group('Transactions', () {
    test('insight claim and sources are inserted atomically', () async {
      const uuid = Uuid();
      final now = DateTime.now().toUtc();
      const noteId = 'tx-note-1';
      const audioId = 'tx-audio-1';
      const segId = 'tx-seg-1';

      await db
          .into(db.audioAssets)
          .insert(
            AudioAssetsCompanion.insert(
              id: audioId,
              relativePath: 'audio/test.m4a',
              durationMs: 1000,
              fileSizeBytes: 100,
              sha256Hash: 'hash',
              createdAt: now,
            ),
          );
      await db
          .into(db.notes)
          .insert(
            NotesCompanion.insert(
              id: noteId,
              noteType: 'voice',
              audioAssetId: const Value(audioId),
              createdAt: now,
              updatedAt: now,
            ),
          );
      await db
          .into(db.transcriptSegments)
          .insert(
            TranscriptSegmentsCompanion.insert(
              id: segId,
              noteId: noteId,
              audioAssetId: audioId,
              startMs: 0,
              endMs: 1000,
              originalText: 'test',
              currentText: 'test',
              engineName: 'test',
              modelVersion: 'test',
              createdAt: now,
            ),
          );

      final claimId = uuid.v4();
      await db.transaction(() async {
        await db
            .into(db.insightClaims)
            .insert(
              InsightClaimsCompanion.insert(
                id: claimId,
                noteId: noteId,
                claimText: 'Test claim',
                claimType: 'decision',
                modelUsed: 'test',
                modelVersion: '0.1',
                promptVersion: 'v1',
                inputTranscriptHash: 'hash',
                createdAt: now,
                updatedAt: now,
              ),
            );
        await db
            .into(db.claimSources)
            .insert(
              ClaimSourcesCompanion.insert(
                id: uuid.v4(),
                claimId: claimId,
                transcriptSegmentId: segId,
                audioStartMs: 0,
                audioEndMs: 1000,
              ),
            );
      });

      final claims = await db.select(db.insightClaims).get();
      expect(claims, hasLength(1));
      expect(claims.first.id, claimId);

      final sources = await (db.select(
        db.claimSources,
      )..where((s) => s.claimId.equals(claimId))).get();
      expect(sources, hasLength(1));
      expect(sources.first.transcriptSegmentId, segId);
    });
  });
}
