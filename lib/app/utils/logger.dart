import 'dart:developer' as dev;

import 'package:dota_heroes/app/core/app_error.dart';
import 'package:flutter/foundation.dart';

enum Logger {
  debug,
  error,
  firebase;

  static void logError(Object? error) {
    if (!kDebugMode) {
      return;
    }

    String? errorMessage;

    if (error is AppError) {
      errorMessage = error.message;
    }

    errorMessage ??= error.toString();

    dev.log(
      errorMessage,
      name: 'LOG-ERROR',
    );
  }

  void log(String message) {
    if (!kDebugMode) {
      return;
    }

    dev.log(
      message,
      name: 'LOG-${name.toUpperCase()}',
    );
  }
}
