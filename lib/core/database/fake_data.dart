import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import 'package:voxcita/core/database/voxcita_database.dart';
import 'package:voxcita/features/capture/domain/recording_session_status.dart';
import 'package:voxcita/features/insights/domain/insight_type.dart';
import 'package:voxcita/features/library/domain/note_type.dart';
import 'package:voxcita/features/trustworthy_ask/domain/ask_result_type.dart';

class FakeData {
  FakeData(this._uuid);

  final Uuid _uuid;

  Future<void> seedAll(VoxCitaDatabase db) async {
    final now = DateTime.now().toUtc();

    final audioId = _uuid.v4();
    await db
        .into(db.audioAssets)
        .insert(
          AudioAssetsCompanion.insert(
            id: audioId,
            relativePath: 'audio/$audioId.m4a',
            durationMs: 120000,
            fileSizeBytes: 960000,
            sha256Hash: 'fake_hash_${audioId.substring(0, 8)}',
            createdAt: now,
          ),
        );

    final noteId = _uuid.v4();
    await db
        .into(db.notes)
        .insert(
          NotesCompanion.insert(
            id: noteId,
            title: const Value('Team planning discussion'),
            body: const Value(
              'Recorded meeting about Q3 priorities and community event planning.',
            ),
            noteType: NoteType.voice.name,
            audioAssetId: Value(audioId),
            createdAt: now,
            updatedAt: now,
          ),
        );

    final textNoteId = _uuid.v4();
    await db
        .into(db.notes)
        .insert(
          NotesCompanion.insert(
            id: textNoteId,
            title: const Value('Ideas for tech talk'),
            body: const Value(
              'Consider presenting about source-linked intelligence and local-first architecture.',
            ),
            noteType: NoteType.text.name,
            createdAt: now,
            updatedAt: now,
          ),
        );

    final segment1Id = _uuid.v4();
    final segment2Id = _uuid.v4();
    await db
        .into(db.transcriptSegments)
        .insert(
          TranscriptSegmentsCompanion.insert(
            id: segment1Id,
            noteId: noteId,
            audioAssetId: audioId,
            startMs: 5000,
            endMs: 15000,
            originalText:
                'We should prioritise the recording reliability work.',
            currentText: 'We should prioritise the recording reliability work.',
            engineName: 'whisper-cpp',
            modelVersion: 'base.en',
            detectedLanguage: const Value('en'),
            confidence: const Value(0.92),
            createdAt: now,
          ),
        );
    await db
        .into(db.transcriptSegments)
        .insert(
          TranscriptSegmentsCompanion.insert(
            id: segment2Id,
            noteId: noteId,
            audioAssetId: audioId,
            startMs: 18000,
            endMs: 28000,
            originalText: 'The community event is planned for October.',
            currentText: 'The community event is planned for October.',
            engineName: 'whisper-cpp',
            modelVersion: 'base.en',
            detectedLanguage: const Value('en'),
            confidence: const Value(0.88),
            createdAt: now,
          ),
        );

    final claimId = _uuid.v4();
    await db
        .into(db.insightClaims)
        .insert(
          InsightClaimsCompanion.insert(
            id: claimId,
            noteId: noteId,
            claimText: 'Prioritise recording reliability for Q3',
            claimType: InsightType.decision.name,
            modelUsed: 'local-extract',
            modelVersion: '0.1.0',
            promptVersion: 'v1',
            inputTranscriptHash: 'fake_hash_input',
            createdAt: now,
            updatedAt: now,
          ),
        );
    await db
        .into(db.claimSources)
        .insert(
          ClaimSourcesCompanion.insert(
            id: _uuid.v4(),
            claimId: claimId,
            transcriptSegmentId: segment1Id,
            audioStartMs: 4000,
            audioEndMs: 16000,
          ),
        );

    final tagId = _uuid.v4();
    await db
        .into(db.tags)
        .insert(
          TagsCompanion.insert(id: tagId, name: 'planning', createdAt: now),
        );
    await db
        .into(db.noteTags)
        .insert(NoteTagsCompanion.insert(noteId: noteId, tagId: tagId));

    final collectionId = _uuid.v4();
    await db
        .into(db.collections)
        .insert(
          CollectionsCompanion.insert(
            id: collectionId,
            name: 'Q3 Planning',
            createdAt: now,
          ),
        );
    await db
        .into(db.noteCollections)
        .insert(
          NoteCollectionsCompanion.insert(
            noteId: noteId,
            collectionId: collectionId,
          ),
        );

    await db
        .into(db.recordingSessions)
        .insert(
          RecordingSessionsCompanion.insert(
            id: _uuid.v4(),
            noteId: Value(noteId),
            audioAssetId: Value(audioId),
            status: RecordingSessionStatus.completed.name,
            startedAt: now,
            endedAt: Value(now),
          ),
        );

    await db
        .into(db.askHistory)
        .insert(
          AskHistoryCompanion.insert(
            id: _uuid.v4(),
            query: 'What are the Q3 priorities?',
            resultType: AskResultType.answered.name,
            answerText:
                'Based on 1 source from your recordings, here is what was '
                'found related to "What are the Q3 priorities?":\n\n'
                '[1] "We should prioritise the recording reliability work." '
                '— Team planning discussion (00:05)',
            confidence: const Value(0.85),
            sourceNoteIds: noteId,
            createdAt: now,
          ),
        );

    await db
        .into(db.userFeedback)
        .insert(
          UserFeedbackCompanion.insert(
            id: _uuid.v4(),
            claimId: Value(claimId),
            feedbackType: 'helpful',
            feedbackDetail: const Value(
              'This insight accurately captures the key decision.',
            ),
            createdAt: now,
          ),
        );
  }
}
