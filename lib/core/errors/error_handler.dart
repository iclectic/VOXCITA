import 'package:flutter/foundation.dart';
import 'package:voxcita/core/errors/app_error.dart';

final class ErrorHandler {
  const ErrorHandler();

  void handleError(Object error, StackTrace stackTrace) {
    if (error is AppError) {
      debugPrint('VoxCita error: ${error.message}');
      if (error.cause != null) {
        debugPrint('Caused by: ${error.cause}');
      }
    } else {
      debugPrint('Unexpected error: $error');
    }
    debugPrint(stackTrace.toString());
  }
}
