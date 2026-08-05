import 'package:voxcita/features/trustworthy_ask/domain/ask_result_type.dart';

class ScoredSource {
  ScoredSource({
    required this.noteId,
    required this.noteTitle,
    required this.segmentId,
    required this.segmentText,
    required this.startMs,
    required this.endMs,
    required this.relevanceScore,
  });

  final String noteId;
  final String noteTitle;
  final String segmentId;
  final String segmentText;
  final int startMs;
  final int endMs;
  final double relevanceScore;
}

class ComposedAnswer {
  const ComposedAnswer({
    required this.type,
    required this.answerText,
    required this.sources,
    required this.confidence,
    required this.abstentionReason,
  });

  final AskResultType type;
  final String answerText;
  final List<ScoredSource> sources;
  final double confidence;
  final String? abstentionReason;

  bool get isAnswered => type == AskResultType.answered;
  bool get isAbstained => type == AskResultType.abstained;
}

class AskAnswerService {
  const AskAnswerService({
    this.minConfidenceThreshold = 0.15,
    this.minSourcesForAnswer = 1,
    this.maxSourcesInAnswer = 5,
  });

  final double minConfidenceThreshold;
  final int minSourcesForAnswer;
  final int maxSourcesInAnswer;

  ComposedAnswer composeAnswer({
    required String query,
    required List<ScoredSource> scoredSources,
  }) {
    if (scoredSources.isEmpty) {
      return ComposedAnswer(
        type: AskResultType.noSources,
        answerText:
            'No matching passages were found in the selected recordings for '
            '"$query".',
        sources: [],
        confidence: 0,
        abstentionReason: null,
      );
    }

    final sorted = List<ScoredSource>.from(scoredSources)
      ..sort((a, b) => b.relevanceScore.compareTo(a.relevanceScore));
    final topSources = sorted.take(maxSourcesInAnswer).toList();

    final avgScore =
        topSources.fold<double>(0, (sum, s) => sum + s.relevanceScore) /
        topSources.length;

    if (avgScore < minConfidenceThreshold ||
        topSources.length < minSourcesForAnswer) {
      return ComposedAnswer(
        type: AskResultType.abstained,
        answerText:
            'I found ${scoredSources.length} potentially relevant passage'
            '${scoredSources.length > 1 ? 's' : ''}, but the evidence is not '
            'strong enough to provide a confident answer to "$query".',
        sources: topSources,
        confidence: avgScore,
        abstentionReason:
            'Average relevance score ($avgScore.toStringAsFixed(2)) below '
            'threshold ($minConfidenceThreshold).',
      );
    }

    final citedAnswer = _synthesizeCitedAnswer(query, topSources);

    return ComposedAnswer(
      type: AskResultType.answered,
      answerText: citedAnswer,
      sources: topSources,
      confidence: avgScore,
      abstentionReason: null,
    );
  }

  String _synthesizeCitedAnswer(String query, List<ScoredSource> sources) {
    final buffer = StringBuffer();

    buffer.write('Based on ${sources.length} source');
    buffer.write(sources.length > 1 ? 's' : '');
    buffer.write(' from your recordings, here is what was found related to ');
    buffer.write('"$query":\n\n');

    for (var i = 0; i < sources.length; i++) {
      final source = sources[i];
      final citation = '[${i + 1}]';
      final excerpt = _truncate(source.segmentText, 120);
      buffer.write('$citation "$excerpt" — ${source.noteTitle} ');
      buffer.write('(${_formatTimestamp(source.startMs)})');
      if (i < sources.length - 1) buffer.write('\n\n');
    }

    return buffer.toString();
  }

  double scoreRelevance({required String query, required String segmentText}) {
    final queryLower = query.toLowerCase().trim();
    final textLower = segmentText.toLowerCase();

    if (queryLower.isEmpty || textLower.isEmpty) return 0;

    final queryTokens = queryLower.split(RegExp(r'\s+'));
    final textTokens = textLower.split(RegExp(r'\s+'));

    final textTokenSet = textTokens.toSet();
    final matchedTokens = queryTokens
        .where((t) => textTokenSet.contains(t))
        .length;
    final tokenCoverage = matchedTokens / queryTokens.length;

    if (tokenCoverage == 0) return 0;

    final containsPhrase = textLower.contains(queryLower);
    final phraseBonus = containsPhrase ? 0.25 : 0;

    final queryWordCount = queryTokens.length;
    final lengthFactor = queryWordCount > 0
        ? (1 / (1 + queryWordCount * 0.1))
        : 0;

    final score = (tokenCoverage * 0.6) + phraseBonus + (lengthFactor * 0.15);
    return score.clamp(0, 1);
  }

  String _truncate(String text, int maxLen) {
    if (text.length <= maxLen) return text;
    return '${text.substring(0, maxLen)}...';
  }

  String _formatTimestamp(int ms) {
    final totalSeconds = ms ~/ 1000;
    final minutes = totalSeconds ~/ 60;
    final seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
