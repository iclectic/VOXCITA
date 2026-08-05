import 'package:flutter_test/flutter_test.dart';
import 'package:voxcita/features/insights/application/insights_list_state.dart';
import 'package:voxcita/features/insights/domain/insight_claim_entity.dart';
import 'package:voxcita/features/insights/domain/insight_type.dart';
import 'package:voxcita/features/insights/domain/verification_state.dart';

void main() {
  group('InsightsListState', () {
    late List<InsightClaimEntity> sampleClaims;

    setUp(() {
      final now = DateTime.now().toUtc();
      sampleClaims = [
        InsightClaimEntity(
          id: '1',
          noteId: 'note-1',
          claimText: 'Summary claim',
          claimType: InsightType.summary,
          modelUsed: 'gpt-4',
          modelVersion: '1.0',
          promptVersion: 'v1',
          inputTranscriptHash: 'abc123',
          createdAt: now,
          updatedAt: now,
          sources: [],
          verificationState: VerificationState.needsReview,
        ),
        InsightClaimEntity(
          id: '2',
          noteId: 'note-1',
          claimText: 'Decision claim',
          claimType: InsightType.decision,
          modelUsed: 'gpt-4',
          modelVersion: '1.0',
          promptVersion: 'v1',
          inputTranscriptHash: 'def456',
          createdAt: now.subtract(const Duration(hours: 1)),
          updatedAt: now,
          sources: [
            ClaimSourceEntity(
              id: 'src-1',
              claimId: '2',
              transcriptSegmentId: 'seg-1',
              audioStartMs: 1000,
              audioEndMs: 5000,
            ),
          ],
          verificationState: VerificationState.verified,
        ),
        InsightClaimEntity(
          id: '3',
          noteId: 'note-2',
          claimText: 'Action claim',
          claimType: InsightType.action,
          modelUsed: 'gpt-4',
          modelVersion: '1.0',
          promptVersion: 'v1',
          inputTranscriptHash: 'ghi789',
          createdAt: now.subtract(const Duration(hours: 2)),
          updatedAt: now,
          sources: [],
          verificationState: VerificationState.corrected,
        ),
        InsightClaimEntity(
          id: '4',
          noteId: 'note-2',
          claimText: 'Unsupported claim',
          claimType: InsightType.idea,
          modelUsed: 'gpt-4',
          modelVersion: '1.0',
          promptVersion: 'v1',
          inputTranscriptHash: 'jkl012',
          createdAt: now.subtract(const Duration(hours: 3)),
          updatedAt: now,
          sources: [],
          verificationState: VerificationState.unsupported,
        ),
      ];
    });

    test('default state has empty claims and filter all', () {
      const state = InsightsListState();
      expect(state.claims, isEmpty);
      expect(state.filter, InsightFilter.all);
      expect(state.isLoading, isFalse);
      expect(state.hasError, isFalse);
    });

    test('filteredClaims with all filter returns all claims', () {
      final state = InsightsListState(claims: sampleClaims);
      expect(state.filteredClaims.length, 4);
    });

    test('filteredClaims with needsReview filter', () {
      final state = InsightsListState(
        claims: sampleClaims,
        filter: InsightFilter.needsReview,
      );
      expect(state.filteredClaims.length, 1);
      expect(state.filteredClaims.first.id, '1');
    });

    test('filteredClaims with verified filter', () {
      final state = InsightsListState(
        claims: sampleClaims,
        filter: InsightFilter.verified,
      );
      expect(state.filteredClaims.length, 1);
      expect(state.filteredClaims.first.id, '2');
    });

    test('filteredClaims with corrected filter', () {
      final state = InsightsListState(
        claims: sampleClaims,
        filter: InsightFilter.corrected,
      );
      expect(state.filteredClaims.length, 1);
      expect(state.filteredClaims.first.id, '3');
    });

    test('filteredClaims with unsupported filter', () {
      final state = InsightsListState(
        claims: sampleClaims,
        filter: InsightFilter.unsupported,
      );
      expect(state.filteredClaims.length, 1);
      expect(state.filteredClaims.first.id, '4');
    });

    test('needsReviewCount counts only needsReview claims', () {
      final state = InsightsListState(claims: sampleClaims);
      expect(state.needsReviewCount, 1);
    });

    test('isEmpty returns true when no claims and not loading', () {
      const state = InsightsListState();
      expect(state.isEmpty, isTrue);
    });

    test('isEmpty returns false when loading', () {
      const state = InsightsListState(isLoading: true);
      expect(state.isEmpty, isFalse);
    });

    test('copyWith creates modified copy', () {
      const state = InsightsListState();
      final modified = state.copyWith(
        claims: sampleClaims,
        filter: InsightFilter.verified,
        isLoading: true,
      );
      expect(modified.claims, sampleClaims);
      expect(modified.filter, InsightFilter.verified);
      expect(modified.isLoading, isTrue);
      expect(modified.error, isNull);
    });

    test('copyWith clears error when not provided', () {
      const state = InsightsListState(error: 'Old error');
      final modified = state.copyWith(claims: sampleClaims);
      expect(modified.error, isNull);
      expect(modified.hasError, isFalse);
    });
  });

  group('InsightFilter', () {
    test('has all expected values', () {
      expect(InsightFilter.values.length, 5);
      expect(InsightFilter.values, contains(InsightFilter.all));
      expect(InsightFilter.values, contains(InsightFilter.needsReview));
      expect(InsightFilter.values, contains(InsightFilter.verified));
      expect(InsightFilter.values, contains(InsightFilter.corrected));
      expect(InsightFilter.values, contains(InsightFilter.unsupported));
    });
  });
}
