// test/core/result_test.dart

import 'package:dota_heroes/app/core/app_error.dart';
import 'package:dota_heroes/app/core/result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Result<T>', () {
    test('Result.success returns success and calls success callback with data',
        () {
      final result = Result<int>.success(42);

      expect(result.isSuccess, isTrue);
      expect(result.isFailure, isFalse);

      var callbackCalled = false;
      var callbackData = 0;
      result.when(
        success: (data) {
          callbackCalled = true;
          callbackData = data;
        },
        failure: (error) {
          fail('Failure callback should not be called in a success result');
        },
      );

      expect(callbackCalled, isTrue);
      expect(callbackData, equals(42));
    });

    test('Result.failure returns failure and calls failure callback with error',
        () {
      final exception = Exception('Test error');
      final result = Result<int>.failure(exception);

      expect(result.isSuccess, isFalse);
      expect(result.isFailure, isTrue);

      var callbackCalled = false;
      AppError? receivedError;
      result.when(
        success: (data) {
          fail('Success callback should not be called in a failure result');
        },
        failure: (error) {
          callbackCalled = true;
          receivedError = error;
        },
      );

      expect(callbackCalled, isTrue);
      expect(receivedError, isNotNull);
      expect(receivedError.toString(), contains('Test error'));
    });
  });

  group('ResultVoid', () {
    test('ResultVoid.success returns success and calls success callback', () {
      final result = ResultVoid.success();

      expect(result.isSuccess, isTrue);
      expect(result.isFailure, isFalse);

      var callbackCalled = false;
      result.when(
        success: () {
          callbackCalled = true;
        },
        failure: (error) {
          fail('Failure callback should not be called in a success result');
        },
      );

      expect(callbackCalled, isTrue);
    });

    test(
        'ResultVoid.failure returns failure and calls failure callback with error',
        () {
      final exception = Exception('Void error');
      final result = ResultVoid.failure(exception);

      expect(result.isSuccess, isFalse);
      expect(result.isFailure, isTrue);

      var callbackCalled = false;
      AppError? receivedError;
      result.when(
        success: () {
          fail('Success callback should not be called in a failure result');
        },
        failure: (error) {
          callbackCalled = true;
          receivedError = error;
        },
      );

      expect(callbackCalled, isTrue);
      expect(receivedError, isNotNull);
      expect(receivedError.toString(), contains('Void error'));
    });
  });
}
