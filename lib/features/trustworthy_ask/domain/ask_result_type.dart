enum AskResultType { answered, abstained, noSources }

extension AskResultTypeX on AskResultType {
  String get displayName => switch (this) {
    AskResultType.answered => 'Answered',
    AskResultType.abstained => 'Cannot answer',
    AskResultType.noSources => 'No sources found',
  };

  String get description => switch (this) {
    AskResultType.answered =>
      'An answer was synthesised from cited sources in your recordings.',
    AskResultType.abstained =>
      'The available evidence is insufficient to answer this question confidently.',
    AskResultType.noSources =>
      'No matching passages were found in the selected recordings.',
  };
}
