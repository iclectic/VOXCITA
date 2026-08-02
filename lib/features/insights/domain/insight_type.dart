enum InsightType {
  summary,
  decision,
  action,
  question,
  idea;

  static InsightType fromString(String value) {
    return InsightType.values.firstWhere(
      (e) => e.name == value,
      orElse: () => InsightType.summary,
    );
  }
}
