enum RecordingSessionStatus {
  created,
  recording,
  paused,
  stopped,
  completed,
  cancelled,
  failed;

  static RecordingSessionStatus fromString(String value) {
    return RecordingSessionStatus.values.firstWhere(
      (e) => e.name == value,
      orElse: () => RecordingSessionStatus.created,
    );
  }
}
