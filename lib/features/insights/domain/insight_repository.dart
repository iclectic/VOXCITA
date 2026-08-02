import 'package:voxcita/features/insights/domain/insight_claim_entity.dart';

abstract interface class InsightRepository {
  Future<InsightClaimEntity> createClaim({
    required String noteId,
    required String claimText,
    required String claimType,
    required String modelUsed,
    required String modelVersion,
    required String promptVersion,
    required String inputTranscriptHash,
    required List<ClaimSourceInput> sources,
    double? supportScore,
    int? processingDurationMs,
  });

  Future<InsightClaimEntity?> getClaimById(String id);

  Future<List<InsightClaimEntity>> getClaimsForNote(String noteId);

  Future<void> updateVerificationState(String id, String verificationState);

  Future<void> deleteClaim(String id);
}

class ClaimSourceInput {
  ClaimSourceInput({
    required this.transcriptSegmentId,
    required this.audioStartMs,
    required this.audioEndMs,
  });

  final String transcriptSegmentId;
  final int audioStartMs;
  final int audioEndMs;
}
