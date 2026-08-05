import 'package:voxcita/features/insights/domain/insight_claim_entity.dart';
import 'package:voxcita/features/transcription/domain/transcript_segment_entity.dart';

enum CitationStatus { valid, invalidSegment, outOfRange, orphaned }

class CitationValidationResult {
  const CitationValidationResult({
    required this.source,
    required this.status,
    this.segment,
    this.reason,
  });

  final ClaimSourceEntity source;
  final CitationStatus status;
  final TranscriptSegmentEntity? segment;
  final String? reason;

  bool get isValid => status == CitationStatus.valid;
}

class ClaimValidationSummary {
  const ClaimValidationSummary({required this.claim, required this.results});

  final InsightClaimEntity claim;
  final List<CitationValidationResult> results;

  bool get allValid => results.every((r) => r.isValid);

  bool get hasInvalidSources => results.any((r) => !r.isValid);

  int get validCount => results.where((r) => r.isValid).length;

  int get invalidCount => results.length - validCount;

  List<CitationValidationResult> get invalidResults =>
      results.where((r) => !r.isValid).toList();
}

class CitationValidator {
  const CitationValidator();

  ClaimValidationSummary validateClaim({
    required InsightClaimEntity claim,
    required List<TranscriptSegmentEntity> segments,
  }) {
    final segmentMap = <String, TranscriptSegmentEntity>{
      for (final s in segments) s.id: s,
    };

    final results = claim.sources.map((source) {
      final segment = segmentMap[source.transcriptSegmentId];

      if (segment == null) {
        return CitationValidationResult(
          source: source,
          status: CitationStatus.invalidSegment,
          reason:
              'Segment ${source.transcriptSegmentId.length > 8 ? '${source.transcriptSegmentId.substring(0, 8)}...' : source.transcriptSegmentId} not found',
        );
      }

      if (!_isInRange(source, segment)) {
        return CitationValidationResult(
          source: source,
          status: CitationStatus.outOfRange,
          segment: segment,
          reason:
              'Audio range ${source.audioStartMs}-${source.audioEndMs}ms '
              'outside segment ${segment.startMs}-${segment.endMs}ms',
        );
      }

      return CitationValidationResult(
        source: source,
        status: CitationStatus.valid,
        segment: segment,
      );
    }).toList();

    return ClaimValidationSummary(claim: claim, results: results);
  }

  List<ClaimValidationSummary> validateClaims({
    required List<InsightClaimEntity> claims,
    required List<TranscriptSegmentEntity> segments,
  }) {
    return claims
        .map(
          (claim) => validateClaim(
            claim: claim,
            segments: segments.where((s) => s.noteId == claim.noteId).toList(),
          ),
        )
        .toList();
  }

  bool _isInRange(ClaimSourceEntity source, TranscriptSegmentEntity segment) {
    const tolerance = 2000;
    return source.audioStartMs >= segment.startMs - tolerance &&
        source.audioEndMs <= segment.endMs + tolerance;
  }
}
