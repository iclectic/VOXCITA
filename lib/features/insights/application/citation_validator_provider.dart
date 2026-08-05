import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voxcita/features/insights/domain/citation_validator.dart';

final citationValidatorProvider = Provider<CitationValidator>((ref) {
  return const CitationValidator();
});
