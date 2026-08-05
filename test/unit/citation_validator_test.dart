import 'package:flutter_test/flutter_test.dart';
import 'package:voxcita/features/insights/domain/citation_validator.dart';
import 'package:voxcita/features/insights/domain/insight_claim_entity.dart';
import 'package:voxcita/features/insights/domain/insight_type.dart';
import 'package:voxcita/features/transcription/domain/transcript_segment_entity.dart';

void main() {
  late CitationValidator validator;

  setUp(() {
    validator = const CitationValidator();
  });

  InsightClaimEntity createClaim({
    required String id,
    required String noteId,
    List<ClaimSourceEntity> sources = const [],
  }) {
    return InsightClaimEntity(
      id: id,
      noteId: noteId,
      claimText: 'Test claim',
      claimType: InsightType.decision,
      modelUsed: 'test-model',
      modelVersion: '1.0',
      promptVersion: 'v1',
      inputTranscriptHash: 'hash123',
      createdAt: DateTime(2025, 1, 1),
      updatedAt: DateTime(2025, 1, 1),
      sources: sources,
    );
  }

  TranscriptSegmentEntity createSegment({
    required String id,
    required String noteId,
    required int startMs,
    required int endMs,
  }) {
    return TranscriptSegmentEntity(
      id: id,
      noteId: noteId,
      audioAssetId: 'audio-1',
      startMs: startMs,
      endMs: endMs,
      originalText: 'Original text',
      currentText: 'Current text',
      engineName: 'whisper',
      modelVersion: 'base.en',
      createdAt: DateTime(2025, 1, 1),
    );
  }

  ClaimSourceEntity createSource({
    required String id,
    required String claimId,
    required String segmentId,
    required int startMs,
    required int endMs,
  }) {
    return ClaimSourceEntity(
      id: id,
      claimId: claimId,
      transcriptSegmentId: segmentId,
      audioStartMs: startMs,
      audioEndMs: endMs,
    );
  }

  group('CitationValidator', () {
    test('validates claim with all valid sources', () {
      final segment = createSegment(
        id: 'seg-1',
        noteId: 'note-1',
        startMs: 5000,
        endMs: 15000,
      );
      final source = createSource(
        id: 'src-1',
        claimId: 'claim-1',
        segmentId: 'seg-1',
        startMs: 6000,
        endMs: 14000,
      );
      final claim = createClaim(
        id: 'claim-1',
        noteId: 'note-1',
        sources: [source],
      );

      final result = validator.validateClaim(claim: claim, segments: [segment]);

      expect(result.allValid, isTrue);
      expect(result.hasInvalidSources, isFalse);
      expect(result.validCount, 1);
      expect(result.invalidCount, 0);
      expect(result.results.first.status, CitationStatus.valid);
      expect(result.results.first.segment, isNotNull);
    });

    test('detects invalid segment reference', () {
      final source = createSource(
        id: 'src-1',
        claimId: 'claim-1',
        segmentId: 'nonexistent',
        startMs: 6000,
        endMs: 14000,
      );
      final claim = createClaim(
        id: 'claim-1',
        noteId: 'note-1',
        sources: [source],
      );

      final result = validator.validateClaim(claim: claim, segments: []);

      expect(result.allValid, isFalse);
      expect(result.hasInvalidSources, isTrue);
      expect(result.invalidCount, 1);
      expect(result.results.first.status, CitationStatus.invalidSegment);
      expect(result.results.first.segment, isNull);
      expect(result.results.first.reason, isNotNull);
    });

    test('detects out of range audio timestamps', () {
      final segment = createSegment(
        id: 'seg-1',
        noteId: 'note-1',
        startMs: 5000,
        endMs: 15000,
      );
      final source = createSource(
        id: 'src-1',
        claimId: 'claim-1',
        segmentId: 'seg-1',
        startMs: 4000,
        endMs: 20000,
      );
      final claim = createClaim(
        id: 'claim-1',
        noteId: 'note-1',
        sources: [source],
      );

      final result = validator.validateClaim(claim: claim, segments: [segment]);

      expect(result.allValid, isFalse);
      expect(result.invalidCount, 1);
      expect(result.results.first.status, CitationStatus.outOfRange);
      expect(result.results.first.segment, isNotNull);
      expect(result.results.first.reason, contains('outside segment'));
    });

    test('allows tolerance for edge-case timestamps', () {
      final segment = createSegment(
        id: 'seg-1',
        noteId: 'note-1',
        startMs: 5000,
        endMs: 15000,
      );
      final source = createSource(
        id: 'src-1',
        claimId: 'claim-1',
        segmentId: 'seg-1',
        startMs: 3000,
        endMs: 17000,
      );
      final claim = createClaim(
        id: 'claim-1',
        noteId: 'note-1',
        sources: [source],
      );

      final result = validator.validateClaim(claim: claim, segments: [segment]);

      expect(result.allValid, isTrue);
      expect(result.results.first.status, CitationStatus.valid);
    });

    test('handles multiple sources with mixed validity', () {
      final seg1 = createSegment(
        id: 'seg-1',
        noteId: 'note-1',
        startMs: 5000,
        endMs: 15000,
      );
      final seg2 = createSegment(
        id: 'seg-2',
        noteId: 'note-1',
        startMs: 20000,
        endMs: 30000,
      );

      final validSource = createSource(
        id: 'src-1',
        claimId: 'claim-1',
        segmentId: 'seg-1',
        startMs: 6000,
        endMs: 14000,
      );
      final invalidSource = createSource(
        id: 'src-2',
        claimId: 'claim-1',
        segmentId: 'nonexistent',
        startMs: 21000,
        endMs: 29000,
      );

      final claim = createClaim(
        id: 'claim-1',
        noteId: 'note-1',
        sources: [validSource, invalidSource],
      );

      final result = validator.validateClaim(
        claim: claim,
        segments: [seg1, seg2],
      );

      expect(result.allValid, isFalse);
      expect(result.validCount, 1);
      expect(result.invalidCount, 1);
      expect(result.invalidResults.length, 1);
      expect(result.invalidResults.first.status, CitationStatus.invalidSegment);
    });

    test('handles claim with no sources', () {
      final claim = createClaim(id: 'claim-1', noteId: 'note-1', sources: []);

      final result = validator.validateClaim(claim: claim, segments: []);

      expect(result.allValid, isTrue);
      expect(result.validCount, 0);
      expect(result.invalidCount, 0);
      expect(result.results, isEmpty);
    });

    test('validateClaims processes multiple claims', () {
      final segment = createSegment(
        id: 'seg-1',
        noteId: 'note-1',
        startMs: 5000,
        endMs: 15000,
      );
      final source = createSource(
        id: 'src-1',
        claimId: 'claim-1',
        segmentId: 'seg-1',
        startMs: 6000,
        endMs: 14000,
      );
      final claim1 = createClaim(
        id: 'claim-1',
        noteId: 'note-1',
        sources: [source],
      );
      final claim2 = createClaim(id: 'claim-2', noteId: 'note-1', sources: []);

      final results = validator.validateClaims(
        claims: [claim1, claim2],
        segments: [segment],
      );

      expect(results.length, 2);
      expect(results[0].allValid, isTrue);
      expect(results[0].validCount, 1);
      expect(results[1].allValid, isTrue);
      expect(results[1].validCount, 0);
    });
  });

  group('CitationStatus', () {
    test('has all expected values', () {
      expect(CitationStatus.values.length, 4);
      expect(CitationStatus.values, contains(CitationStatus.valid));
      expect(CitationStatus.values, contains(CitationStatus.invalidSegment));
      expect(CitationStatus.values, contains(CitationStatus.outOfRange));
      expect(CitationStatus.values, contains(CitationStatus.orphaned));
    });
  });

  group('ClaimValidationSummary', () {
    test('invalidResults returns only invalid ones', () {
      final segment = createSegment(
        id: 'seg-1',
        noteId: 'note-1',
        startMs: 5000,
        endMs: 15000,
      );
      final validSource = createSource(
        id: 'src-1',
        claimId: 'claim-1',
        segmentId: 'seg-1',
        startMs: 6000,
        endMs: 14000,
      );
      final invalidSource = createSource(
        id: 'src-2',
        claimId: 'claim-1',
        segmentId: 'missing',
        startMs: 6000,
        endMs: 14000,
      );
      final claim = createClaim(
        id: 'claim-1',
        noteId: 'note-1',
        sources: [validSource, invalidSource],
      );

      final result = validator.validateClaim(claim: claim, segments: [segment]);

      expect(result.invalidResults.length, 1);
      expect(result.invalidResults.first.source.id, 'src-2');
    });
  });
}
