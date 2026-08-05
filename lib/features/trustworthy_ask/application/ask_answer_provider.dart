import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voxcita/features/trustworthy_ask/domain/ask_answer_service.dart';

final askAnswerServiceProvider = Provider<AskAnswerService>((ref) {
  return const AskAnswerService();
});
