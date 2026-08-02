import 'package:flutter_test/flutter_test.dart';
import 'package:voxcita/features/insights/domain/verification_state.dart';
import 'package:voxcita/features/insights/domain/insight_type.dart';
import 'package:voxcita/features/library/domain/note_type.dart';
import 'package:voxcita/features/capture/domain/recording_session_status.dart';

void main() {
  group('VerificationState', () {
    test('fromString returns correct enum', () {
      expect(
        VerificationState.fromString('verified'),
        VerificationState.verified,
      );
      expect(
        VerificationState.fromString('corrected'),
        VerificationState.corrected,
      );
      expect(
        VerificationState.fromString('unsupported'),
        VerificationState.unsupported,
      );
      expect(
        VerificationState.fromString('needs_review'),
        VerificationState.needsReview,
      );
    });

    test('fromString defaults to needsReview for unknown', () {
      expect(
        VerificationState.fromString('unknown'),
        VerificationState.needsReview,
      );
    });

    test('displayName returns human-readable string', () {
      expect(VerificationState.verified.displayName, 'Verified');
      expect(VerificationState.corrected.displayName, 'Corrected');
      expect(VerificationState.unsupported.displayName, 'Unsupported');
      expect(VerificationState.needsReview.displayName, 'Needs review');
    });

    test('canTransitionToVerified allows valid transitions', () {
      expect(VerificationState.needsReview.canTransitionToVerified, isTrue);
      expect(VerificationState.corrected.canTransitionToVerified, isTrue);
      expect(VerificationState.verified.canTransitionToVerified, isFalse);
    });

    test('canTransitionToCorrected allows valid transitions', () {
      expect(VerificationState.needsReview.canTransitionToCorrected, isTrue);
      expect(VerificationState.verified.canTransitionToCorrected, isTrue);
      expect(VerificationState.corrected.canTransitionToCorrected, isFalse);
    });

    test('canTransitionToUnsupported allows valid transitions', () {
      expect(VerificationState.needsReview.canTransitionToUnsupported, isTrue);
      expect(VerificationState.verified.canTransitionToUnsupported, isTrue);
      expect(VerificationState.corrected.canTransitionToUnsupported, isTrue);
      expect(VerificationState.unsupported.canTransitionToUnsupported, isFalse);
    });

    test('canTransitionToNeedsReview always allows', () {
      for (final state in VerificationState.values) {
        expect(state.canTransitionToNeedsReview, isTrue);
      }
    });
  });

  group('InsightType', () {
    test('fromString returns correct enum', () {
      expect(InsightType.fromString('summary'), InsightType.summary);
      expect(InsightType.fromString('decision'), InsightType.decision);
      expect(InsightType.fromString('action'), InsightType.action);
      expect(InsightType.fromString('question'), InsightType.question);
      expect(InsightType.fromString('idea'), InsightType.idea);
    });

    test('fromString defaults to summary for unknown', () {
      expect(InsightType.fromString('unknown'), InsightType.summary);
    });
  });

  group('NoteType', () {
    test('fromString returns correct enum', () {
      expect(NoteType.fromString('text'), NoteType.text);
      expect(NoteType.fromString('voice'), NoteType.voice);
    });

    test('fromString defaults to text for unknown', () {
      expect(NoteType.fromString('unknown'), NoteType.text);
    });
  });

  group('RecordingSessionStatus', () {
    test('fromString returns correct enum', () {
      expect(
        RecordingSessionStatus.fromString('created'),
        RecordingSessionStatus.created,
      );
      expect(
        RecordingSessionStatus.fromString('recording'),
        RecordingSessionStatus.recording,
      );
      expect(
        RecordingSessionStatus.fromString('paused'),
        RecordingSessionStatus.paused,
      );
      expect(
        RecordingSessionStatus.fromString('stopped'),
        RecordingSessionStatus.stopped,
      );
      expect(
        RecordingSessionStatus.fromString('completed'),
        RecordingSessionStatus.completed,
      );
      expect(
        RecordingSessionStatus.fromString('cancelled'),
        RecordingSessionStatus.cancelled,
      );
      expect(
        RecordingSessionStatus.fromString('failed'),
        RecordingSessionStatus.failed,
      );
    });

    test('fromString defaults to created for unknown', () {
      expect(
        RecordingSessionStatus.fromString('unknown'),
        RecordingSessionStatus.created,
      );
    });
  });
}
