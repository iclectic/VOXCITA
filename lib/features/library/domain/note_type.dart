enum NoteType {
  text,
  voice;

  static NoteType fromString(String value) {
    return NoteType.values.firstWhere(
      (e) => e.name == value,
      orElse: () => NoteType.text,
    );
  }
}
