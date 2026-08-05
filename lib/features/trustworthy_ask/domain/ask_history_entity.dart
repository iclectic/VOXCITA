import 'package:voxcita/features/trustworthy_ask/domain/ask_result_type.dart';

class AskHistoryEntity {
  AskHistoryEntity({
    required this.id,
    required this.query,
    required this.resultType,
    required this.answerText,
    required this.confidence,
    required this.sourceNoteIds,
    required this.createdAt,
    this.abstentionReason,
  });

  final String id;
  final String query;
  final AskResultType resultType;
  final String answerText;
  final double confidence;
  final List<String> sourceNoteIds;
  final DateTime createdAt;
  final String? abstentionReason;

  bool get isAnswered => resultType == AskResultType.answered;
  bool get isAbstained => resultType == AskResultType.abstained;
}
