import 'package:voxcita/features/insights/domain/insight_type.dart';
import 'package:voxcita/features/insights/domain/verification_state.dart';

class ClaimSourceEntity {
  ClaimSourceEntity({
    required this.id,
    required this.claimId,
    required this.transcriptSegmentId,
    required this.audioStartMs,
    required this.audioEndMs,
  });

  final String id;
  final String claimId;
  final String transcriptSegmentId;
  final int audioStartMs;
  final int audioEndMs;
}

class InsightClaimEntity {
  InsightClaimEntity({
    required this.id,
    required this.noteId,
    required this.claimText,
    required this.claimType,
    required this.modelUsed,
    required this.modelVersion,
    required this.promptVersion,
    required this.inputTranscriptHash,
    required this.createdAt,
    required this.updatedAt,
    required this.sources,
    this.supportScore,
    this.verificationState = VerificationState.needsReview,
    this.processingDurationMs,
  });

  final String id;
  final String noteId;
  final String claimText;
  final InsightType claimType;
  final String modelUsed;
  final String modelVersion;
  final String promptVersion;
  final double? supportScore;
  final VerificationState verificationState;
  final String inputTranscriptHash;
  final int? processingDurationMs;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<ClaimSourceEntity> sources;

  bool get hasSources => sources.isNotEmpty;

  bool get isVerified => verificationState == VerificationState.verified;

  bool get isUnsupported => verificationState == VerificationState.unsupported;
}
