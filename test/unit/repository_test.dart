import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uuid/uuid.dart';
import 'package:voxcita/core/database/voxcita_database.dart';
import 'package:voxcita/features/capture/data/audio_repository_impl.dart';
import 'package:voxcita/features/insights/data/insight_repository_impl.dart';
import 'package:voxcita/features/insights/domain/insight_repository.dart';
import 'package:voxcita/features/insights/domain/verification_state.dart';
import 'package:voxcita/features/library/data/collection_repository_impl.dart';
import 'package:voxcita/features/library/data/note_repository_impl.dart';
import 'package:voxcita/features/library/data/tag_repository_impl.dart';
import 'package:voxcita/features/library/domain/note_entity.dart';
import 'package:voxcita/features/library/domain/note_type.dart';
import 'package:voxcita/features/transcription/data/transcript_repository_impl.dart';

void main() {
  late VoxCitaDatabase db;
  const uuid = Uuid();

  setUp(() {
    db = VoxCitaDatabase.forTesting(NativeDatabase.memory());
  });

  tearDown(() async {
    await db.close();
  });

  group('NoteRepositoryImpl', () {
    late NoteRepositoryImpl repo;

    setUp(() {
      repo = NoteRepositoryImpl(db, uuid);
    });

    test('createNote inserts and returns entity', () async {
      final note = await repo.createNote(
        title: 'Test note',
        body: 'Test body',
        noteType: 'text',
      );

      expect(note.id, isNotEmpty);
      expect(note.title, 'Test note');
      expect(note.body, 'Test body');
      expect(note.noteType, NoteType.text);

      final retrieved = await repo.getNoteById(note.id);
      expect(retrieved, isNotNull);
      expect(retrieved!.title, 'Test note');
    });

    test('getAllNotes returns all notes ordered by updatedAt desc', () async {
      await repo.createNote(title: 'Note 1', body: '', noteType: 'text');
      await Future<void>.delayed(const Duration(seconds: 1));
      await repo.createNote(title: 'Note 2', body: '', noteType: 'text');

      final notes = await repo.getAllNotes();
      expect(notes, hasLength(2));
      expect(notes.first.title, 'Note 2');
    });

    test('searchNotes matches title and body', () async {
      await repo.createNote(
        title: 'Planning meeting',
        body: 'Discussed roadmap',
        noteType: 'text',
      );
      await repo.createNote(
        title: 'Random',
        body: 'Nothing about planning here',
        noteType: 'text',
      );

      final results = await repo.searchNotes('planning');
      expect(results, hasLength(2));
    });

    test('setFavourite toggles favourite flag', () async {
      final note = await repo.createNote(
        title: 'Test',
        body: '',
        noteType: 'text',
      );

      await repo.setFavourite(note.id, true);
      final updated = await repo.getNoteById(note.id);
      expect(updated!.isFavourite, isTrue);
    });

    test('setPinned toggles pinned flag', () async {
      final note = await repo.createNote(
        title: 'Test',
        body: '',
        noteType: 'text',
      );

      await repo.setPinned(note.id, true);
      final updated = await repo.getNoteById(note.id);
      expect(updated!.isPinned, isTrue);
    });

    test('deleteNote removes the note', () async {
      final note = await repo.createNote(
        title: 'To delete',
        body: '',
        noteType: 'text',
      );

      await repo.deleteNote(note.id);
      final retrieved = await repo.getNoteById(note.id);
      expect(retrieved, isNull);
    });

    test('updateNote updates fields', () async {
      final note = await repo.createNote(
        title: 'Original',
        body: 'Original body',
        noteType: 'text',
      );

      await repo.updateNote(
        note.copyWith(
          title: 'Updated title',
          body: 'Updated body',
          updatedAt: DateTime.now().toUtc(),
        ),
      );

      final updated = await repo.getNoteById(note.id);
      expect(updated!.title, 'Updated title');
      expect(updated.body, 'Updated body');
    });
  });

  group('TranscriptRepositoryImpl', () {
    late TranscriptRepositoryImpl repo;
    late NoteRepositoryImpl noteRepo;
    late AudioRepositoryImpl audioRepo;

    setUp(() {
      repo = TranscriptRepositoryImpl(db, uuid);
      noteRepo = NoteRepositoryImpl(db, uuid);
      audioRepo = AudioRepositoryImpl(db, uuid);
    });

    test('createSegment and getSegmentsForNote', () async {
      final note = await noteRepo.createNote(
        title: 'Test',
        body: '',
        noteType: 'voice',
      );
      final audio = await audioRepo.createAudioAsset(
        relativePath: 'audio/test.m4a',
        durationMs: 5000,
        fileSizeBytes: 100,
        sha256Hash: 'hash',
      );

      await repo.createSegment(
        noteId: note.id,
        audioAssetId: audio.id,
        startMs: 0,
        endMs: 1000,
        originalText: 'Hello world',
        engineName: 'whisper',
        modelVersion: 'base',
      );
      await repo.createSegment(
        noteId: note.id,
        audioAssetId: audio.id,
        startMs: 1000,
        endMs: 2000,
        originalText: 'Second segment',
        engineName: 'whisper',
        modelVersion: 'base',
      );

      final segments = await repo.getSegmentsForNote(note.id);
      expect(segments, hasLength(2));
      expect(segments[0].startMs, 0);
      expect(segments[1].startMs, 1000);
    });

    test('correctSegment updates currentText and creates revision', () async {
      final note = await noteRepo.createNote(
        title: 'Test',
        body: '',
        noteType: 'voice',
      );
      final audio = await audioRepo.createAudioAsset(
        relativePath: 'audio/test.m4a',
        durationMs: 5000,
        fileSizeBytes: 100,
        sha256Hash: 'hash',
      );

      final segment = await repo.createSegment(
        noteId: note.id,
        audioAssetId: audio.id,
        startMs: 0,
        endMs: 1000,
        originalText: 'Hello world',
        engineName: 'whisper',
        modelVersion: 'base',
      );

      await repo.correctSegment(
        segmentId: segment.id,
        correctedText: 'Hello, world!',
      );

      final segments = await repo.getSegmentsForNote(note.id);
      expect(segments.first.currentText, 'Hello, world!');
      expect(segments.first.originalText, 'Hello world');
      expect(segments.first.isCorrected, isTrue);

      final revisions = await db.select(db.transcriptRevisions).get();
      expect(revisions, hasLength(1));
      expect(revisions.first.previousText, 'Hello world');
      expect(revisions.first.correctedText, 'Hello, world!');
    });
  });

  group('InsightRepositoryImpl', () {
    late InsightRepositoryImpl repo;
    late NoteRepositoryImpl noteRepo;
    late AudioRepositoryImpl audioRepo;
    late TranscriptRepositoryImpl transcriptRepo;

    setUp(() {
      repo = InsightRepositoryImpl(db, uuid);
      noteRepo = NoteRepositoryImpl(db, uuid);
      audioRepo = AudioRepositoryImpl(db, uuid);
      transcriptRepo = TranscriptRepositoryImpl(db, uuid);
    });

    test('createClaim with sources and retrieve', () async {
      final note = await noteRepo.createNote(
        title: 'Test',
        body: '',
        noteType: 'voice',
      );
      final audio = await audioRepo.createAudioAsset(
        relativePath: 'audio/test.m4a',
        durationMs: 5000,
        fileSizeBytes: 100,
        sha256Hash: 'hash',
      );
      final segment = await transcriptRepo.createSegment(
        noteId: note.id,
        audioAssetId: audio.id,
        startMs: 0,
        endMs: 1000,
        originalText: 'We should ship it',
        engineName: 'whisper',
        modelVersion: 'base',
      );

      final claim = await repo.createClaim(
        noteId: note.id,
        claimText: 'Ship the product',
        claimType: 'decision',
        modelUsed: 'local-extract',
        modelVersion: '0.1.0',
        promptVersion: 'v1',
        inputTranscriptHash: 'hash123',
        sources: [
          ClaimSourceInput(
            transcriptSegmentId: segment.id,
            audioStartMs: 0,
            audioEndMs: 1000,
          ),
        ],
      );

      expect(claim.id, isNotEmpty);
      expect(claim.claimText, 'Ship the product');
      expect(claim.sources, hasLength(1));
      expect(claim.verificationState, VerificationState.needsReview);

      final retrieved = await repo.getClaimById(claim.id);
      expect(retrieved, isNotNull);
      expect(retrieved!.sources, hasLength(1));
    });

    test('updateVerificationState changes state', () async {
      final note = await noteRepo.createNote(
        title: 'Test',
        body: '',
        noteType: 'voice',
      );

      final claim = await repo.createClaim(
        noteId: note.id,
        claimText: 'Test claim',
        claimType: 'summary',
        modelUsed: 'test',
        modelVersion: '0.1',
        promptVersion: 'v1',
        inputTranscriptHash: 'hash',
        sources: [],
      );

      await repo.updateVerificationState(claim.id, 'verified');

      final updated = await repo.getClaimById(claim.id);
      expect(updated!.verificationState, VerificationState.verified);
      expect(updated.isVerified, isTrue);
    });

    test('deleteClaim removes claim and its sources', () async {
      final note = await noteRepo.createNote(
        title: 'Test',
        body: '',
        noteType: 'voice',
      );
      final audio = await audioRepo.createAudioAsset(
        relativePath: 'audio/test.m4a',
        durationMs: 5000,
        fileSizeBytes: 100,
        sha256Hash: 'hash',
      );
      final segment = await transcriptRepo.createSegment(
        noteId: note.id,
        audioAssetId: audio.id,
        startMs: 0,
        endMs: 1000,
        originalText: 'Test',
        engineName: 'whisper',
        modelVersion: 'base',
      );

      final claim = await repo.createClaim(
        noteId: note.id,
        claimText: 'Test claim',
        claimType: 'summary',
        modelUsed: 'test',
        modelVersion: '0.1',
        promptVersion: 'v1',
        inputTranscriptHash: 'hash',
        sources: [
          ClaimSourceInput(
            transcriptSegmentId: segment.id,
            audioStartMs: 0,
            audioEndMs: 1000,
          ),
        ],
      );

      await repo.deleteClaim(claim.id);

      final retrieved = await repo.getClaimById(claim.id);
      expect(retrieved, isNull);

      final sources = await db.select(db.claimSources).get();
      expect(sources, isEmpty);
    });
  });

  group('CollectionRepositoryImpl', () {
    late CollectionRepositoryImpl repo;
    late NoteRepositoryImpl noteRepo;

    setUp(() {
      repo = CollectionRepositoryImpl(db, uuid);
      noteRepo = NoteRepositoryImpl(db, uuid);
    });

    test('createCollection and getAllCollections', () async {
      await repo.createCollection(name: 'Collection A');
      await repo.createCollection(name: 'Collection B');

      final collections = await repo.getAllCollections();
      expect(collections, hasLength(2));
      expect(collections[0].name, 'Collection A');
    });

    test('addNoteToCollection and removeNoteFromCollection', () async {
      final note = await noteRepo.createNote(
        title: 'Test',
        body: '',
        noteType: 'text',
      );
      final collection = await repo.createCollection(name: 'Test collection');

      await repo.addNoteToCollection(
        noteId: note.id,
        collectionId: collection.id,
      );

      final junctions = await db.select(db.noteCollections).get();
      expect(junctions, hasLength(1));

      await repo.removeNoteFromCollection(
        noteId: note.id,
        collectionId: collection.id,
      );

      final afterRemoval = await db.select(db.noteCollections).get();
      expect(afterRemoval, isEmpty);
    });

    test('deleteCollection removes collection and junctions', () async {
      final note = await noteRepo.createNote(
        title: 'Test',
        body: '',
        noteType: 'text',
      );
      final collection = await repo.createCollection(name: 'Test collection');

      await repo.addNoteToCollection(
        noteId: note.id,
        collectionId: collection.id,
      );

      await repo.deleteCollection(collection.id);

      final collections = await repo.getAllCollections();
      expect(collections, isEmpty);

      final junctions = await db.select(db.noteCollections).get();
      expect(junctions, isEmpty);
    });
  });

  group('TagRepositoryImpl', () {
    late TagRepositoryImpl repo;
    late NoteRepositoryImpl noteRepo;

    setUp(() {
      repo = TagRepositoryImpl(db, uuid);
      noteRepo = NoteRepositoryImpl(db, uuid);
    });

    test('createTag and getAllTags', () async {
      await repo.createTag(name: 'important');
      await repo.createTag(name: 'follow-up');

      final tags = await repo.getAllTags();
      expect(tags, hasLength(2));
      expect(tags[0].name, 'follow-up');
    });

    test('addTagToNote and getTagsForNote', () async {
      final note = await noteRepo.createNote(
        title: 'Test',
        body: '',
        noteType: 'text',
      );
      final tag = await repo.createTag(name: 'planning');

      await repo.addTagToNote(noteId: note.id, tagId: tag.id);

      final tags = await repo.getTagsForNote(note.id);
      expect(tags, hasLength(1));
      expect(tags.first.name, 'planning');
    });

    test('removeTagFromNote', () async {
      final note = await noteRepo.createNote(
        title: 'Test',
        body: '',
        noteType: 'text',
      );
      final tag = await repo.createTag(name: 'planning');

      await repo.addTagToNote(noteId: note.id, tagId: tag.id);
      await repo.removeTagFromNote(noteId: note.id, tagId: tag.id);

      final tags = await repo.getTagsForNote(note.id);
      expect(tags, isEmpty);
    });

    test('deleteTag removes tag and junctions', () async {
      final note = await noteRepo.createNote(
        title: 'Test',
        body: '',
        noteType: 'text',
      );
      final tag = await repo.createTag(name: 'planning');

      await repo.addTagToNote(noteId: note.id, tagId: tag.id);
      await repo.deleteTag(tag.id);

      final tags = await repo.getAllTags();
      expect(tags, isEmpty);

      final junctions = await db.select(db.noteTags).get();
      expect(junctions, isEmpty);
    });
  });

  group('NoteEntity', () {
    test('copyWith creates a modified copy', () {
      final note = NoteEntity(
        id: 'test-id',
        title: 'Original',
        body: 'Original body',
        noteType: NoteType.text,
        createdAt: DateTime.parse('2024-01-01T00:00:00Z'),
        updatedAt: DateTime.parse('2024-01-01T00:00:00Z'),
      );

      final copied = note.copyWith(title: 'Updated');
      expect(copied.id, 'test-id');
      expect(copied.title, 'Updated');
      expect(copied.body, 'Original body');
    });
  });
}
