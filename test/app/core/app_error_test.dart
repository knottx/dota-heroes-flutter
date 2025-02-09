import 'package:dio/dio.dart';
import 'package:dota_heroes/app/core/app_error.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppError.fromError', () {
    test('should return the same AppError if passed an AppError', () {
      const originalError = AppError(
        message: 'Original error',
        statusCode: 400,
        debugMessage: 'Debug info',
      );

      final result = AppError.fromError(originalError);

      expect(result, originalError);
    });

    test(
        'should return an AppError with the response message for DioExceptionType.badResponse',
        () {
      final requestOptions = RequestOptions(
        path: 'https://example.com/test',
        method: 'GET',
      );

      final response = Response(
        requestOptions: requestOptions,
        statusCode: 404,
        data: {'message': 'Not Found'},
      );

      final dioError = DioException(
        requestOptions: requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
        message: 'Some default message',
      );

      final appError = AppError.fromError(dioError);

      expect(appError.message, equals('Not Found'));

      expect(appError.debugMessage, equals('404 GET https://example.com/test'));
    });

    test(
        'should return an AppError with message "No Internet" for DioExceptionType.unknown with SocketException',
        () {
      final requestOptions = RequestOptions(
        path: 'https://example.com/test',
        method: 'GET',
      );

      final dioError = DioException(
        requestOptions: requestOptions,
        type: DioExceptionType.unknown,
        message: 'SocketException: connection failed',
      );

      final appError = AppError.fromError(dioError);

      expect(appError.message, equals('No Internet'));

      expect(
        appError.debugMessage,
        equals('GET https://example.com/test'),
      );
    });

    test(
        'should return an AppError with message from error.toString() for non-Dio errors',
        () {
      final genericError = Exception('Some error occurred');

      final appError = AppError.fromError(genericError);

      expect(appError.message, equals(genericError.toString()));
    });
  });

  group('AppError.toString', () {
    test('should join non-null, non-empty message and debugMessage', () {
      const error = AppError(
        message: 'Error occurred',
        debugMessage: 'Debug details',
      );

      final stringResult = error.toString();

      expect(stringResult, equals('Error occurred\nDebug details'));
    });

    test('should skip null or empty strings in toString output', () {
      const error = AppError(
        message: '',
        debugMessage: 'Only debug info',
      );

      final stringResult = error.toString();

      expect(stringResult, equals('Only debug info'));
    });
  });
}
