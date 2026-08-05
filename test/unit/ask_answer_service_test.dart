import 'package:flutter_test/flutter_test.dart';
import 'package:voxcita/features/trustworthy_ask/domain/ask_answer_service.dart';
import 'package:voxcita/features/trustworthy_ask/domain/ask_result_type.dart';

void main() {
  late AskAnswerService service;

  setUp(() {
    service = const AskAnswerService();
  });

  ScoredSource createSource({
    required String segmentText,
    required double relevanceScore,
    String noteId = 'note-1',
    String noteTitle = 'Test Note',
    String segmentId = 'seg-1',
    int startMs = 5000,
    int endMs = 15000,
  }) {
    return ScoredSource(
      noteId: noteId,
      noteTitle: noteTitle,
      segmentId: segmentId,
      segmentText: segmentText,
      startMs: startMs,
      endMs: endMs,
      relevanceScore: relevanceScore,
    );
  }

  group('AskResultType', () {
    test('has all expected values', () {
      expect(AskResultType.values.length, 3);
      expect(AskResultType.values, contains(AskResultType.answered));
      expect(AskResultType.values, contains(AskResultType.abstained));
      expect(AskResultType.values, contains(AskResultType.noSources));
    });

    test('displayName returns correct strings', () {
      expect(AskResultType.answered.displayName, 'Answered');
      expect(AskResultType.abstained.displayName, 'Cannot answer');
      expect(AskResultType.noSources.displayName, 'No sources found');
    });

    test('description returns non-empty strings', () {
      for (final type in AskResultType.values) {
        expect(type.description, isNotEmpty);
      }
    });
  });

  group('AskAnswerService.scoreRelevance', () {
    test('returns 0 for empty query', () {
      final score = service.scoreRelevance(query: '', segmentText: 'some text');
      expect(score, 0);
    });

    test('returns 0 for empty segment text', () {
      final score = service.scoreRelevance(query: 'test', segmentText: '');
      expect(score, 0);
    });

    test('returns higher score for exact phrase match', () {
      final score = service.scoreRelevance(
        query: 'recording reliability',
        segmentText: 'We should prioritise the recording reliability work.',
      );
      expect(score, greaterThan(0.5));
    });

    test('returns lower score for partial word match', () {
      final score = service.scoreRelevance(
        query: 'recording reliability',
        segmentText: 'The recording was good but not reliable enough.',
      );
      expect(score, greaterThan(0));
      expect(score, lessThan(0.8));
    });

    test('returns 0 when no words match', () {
      final score = service.scoreRelevance(
        query: 'budget planning',
        segmentText: 'The weather is nice today.',
      );
      expect(score, 0);
    });

    test('score is clamped between 0 and 1', () {
      final score = service.scoreRelevance(
        query: 'a',
        segmentText: 'a a a a a',
      );
      expect(score, lessThanOrEqualTo(1));
      expect(score, greaterThanOrEqualTo(0));
    });
  });

  group('AskAnswerService.composeAnswer', () {
    test('returns noSources when scoredSources is empty', () {
      final result = service.composeAnswer(
        query: 'test query',
        scoredSources: [],
      );
      expect(result.type, AskResultType.noSources);
      expect(result.sources, isEmpty);
      expect(result.confidence, 0);
      expect(result.abstentionReason, isNull);
    });

    test('returns answered with cited answer text for high relevance', () {
      final sources = [
        createSource(
          segmentText: 'We should prioritise recording reliability.',
          relevanceScore: 0.85,
        ),
        createSource(
          segmentText: 'The team agreed on Q3 priorities.',
          relevanceScore: 0.75,
          segmentId: 'seg-2',
        ),
      ];
      final result = service.composeAnswer(
        query: 'Q3 priorities',
        scoredSources: sources,
      );
      expect(result.type, AskResultType.answered);
      expect(result.sources.length, 2);
      expect(result.confidence, closeTo(0.8, 0.1));
      expect(result.answerText, contains('[1]'));
      expect(result.answerText, contains('[2]'));
      expect(result.abstentionReason, isNull);
    });

    test('returns abstained when average score is below threshold', () {
      final sources = [
        createSource(segmentText: 'Maybe related text.', relevanceScore: 0.05),
      ];
      final result = service.composeAnswer(
        query: 'unrelated query',
        scoredSources: sources,
      );
      expect(result.type, AskResultType.abstained);
      expect(result.abstentionReason, isNotNull);
      expect(result.confidence, lessThan(0.15));
    });

    test('limits sources to maxSourcesInAnswer', () {
      final sources = List.generate(10, (i) {
        return createSource(
          segmentText: 'Source $i text',
          relevanceScore: 0.8,
          segmentId: 'seg-$i',
        );
      });
      final result = service.composeAnswer(
        query: 'test',
        scoredSources: sources,
      );
      expect(result.sources.length, lessThanOrEqualTo(5));
    });

    test('cited answer includes note title and timestamp', () {
      final sources = [
        createSource(
          noteTitle: 'Team Meeting',
          segmentText: 'Important decision was made.',
          relevanceScore: 0.9,
          startMs: 65000,
        ),
      ];
      final result = service.composeAnswer(
        query: 'decision',
        scoredSources: sources,
      );
      expect(result.type, AskResultType.answered);
      expect(result.answerText, contains('Team Meeting'));
      expect(result.answerText, contains('01:05'));
    });

    test('cited answer truncates long segment text', () {
      final longText = 'A' * 200;
      final sources = [
        createSource(segmentText: longText, relevanceScore: 0.9),
      ];
      final result = service.composeAnswer(
        query: 'test',
        scoredSources: sources,
      );
      expect(result.answerText, contains('...'));
    });
  });

  group('ComposedAnswer', () {
    test('isAnswered and isAbstained are mutually exclusive', () {
      final answered = service.composeAnswer(
        query: 'test',
        scoredSources: [
          createSource(segmentText: 'test text', relevanceScore: 0.9),
        ],
      );
      expect(answered.isAnswered, isTrue);
      expect(answered.isAbstained, isFalse);

      final abstained = service.composeAnswer(
        query: 'test',
        scoredSources: [
          createSource(segmentText: 'test text', relevanceScore: 0.01),
        ],
      );
      expect(abstained.isAbstained, isTrue);
      expect(abstained.isAnswered, isFalse);
    });
  });

  group('AskAnswerService with custom threshold', () {
    test('high threshold causes abstention more easily', () {
      const strictService = AskAnswerService(minConfidenceThreshold: 0.5);
      final sources = [
        createSource(segmentText: 'some text', relevanceScore: 0.3),
      ];
      final result = strictService.composeAnswer(
        query: 'test',
        scoredSources: sources,
      );
      expect(result.type, AskResultType.abstained);
    });

    test('zero threshold always answers if sources exist', () {
      const lenientService = AskAnswerService(minConfidenceThreshold: 0);
      final sources = [
        createSource(segmentText: 'some text', relevanceScore: 0.01),
      ];
      final result = lenientService.composeAnswer(
        query: 'test',
        scoredSources: sources,
      );
      expect(result.type, AskResultType.answered);
    });
  });
}
