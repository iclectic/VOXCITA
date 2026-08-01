sealed class AppError implements Exception {
  const AppError(this.message, {this.cause});

  final String message;
  final Object? cause;

  @override
  String toString() => message;
}

final class RecordingError extends AppError {
  const RecordingError(super.message, {super.cause});
}

final class StorageError extends AppError {
  const StorageError(super.message, {super.cause});
}

final class DatabaseError extends AppError {
  const DatabaseError(super.message, {super.cause});
}

final class ValidationError extends AppError {
  const ValidationError(super.message, {super.cause});
}

final class PermissionError extends AppError {
  const PermissionError(super.message, {super.cause});
}

final class TranscriptionError extends AppError {
  const TranscriptionError(super.message, {super.cause});
}

final class InsightError extends AppError {
  const InsightError(super.message, {super.cause});
}

final class ArchiveError extends AppError {
  const ArchiveError(super.message, {super.cause});
}
