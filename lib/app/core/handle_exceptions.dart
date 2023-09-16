import 'package:dio/dio.dart';
import 'package:dota_heroes/app/data/models/app_error_model.dart';

class HandleExceptions {
  static AppError handleError({
    required dynamic error,
    required String? apiPath,
  }) {
    if (error is DioException) {
      return _fromDioException(
        dioException: error,
        apiPath: apiPath,
      );
    } else {
      return AppError(
        message: error.toString(),
        apiPath: apiPath,
      );
    }
  }

  static AppError _fromDioException({
    required DioException dioException,
    required String? apiPath,
  }) {
    final response = dioException.response;
    final statusCode = response?.statusCode;
    switch (dioException.type) {
      case DioExceptionType.badResponse:
        return _handleDioExceptionResponse(
          response: response,
          apiPath: apiPath,
          dioErrorType: dioException.type,
        );

      case DioExceptionType.unknown:
        if (dioException.message?.contains('SocketException') ?? false) {
          return AppError(
            statusCode: statusCode,
            message: 'No Internet',
            apiPath: apiPath,
          );
        } else {
          return AppError(
            statusCode: statusCode,
            message: 'Unexpected error occurred',
            apiPath: apiPath,
          );
        }
      default:
        return AppError(
          statusCode: statusCode,
          message: dioException.type.message,
          apiPath: apiPath,
        );
    }
  }

  static AppError _handleDioExceptionResponse({
    required Response<dynamic>? response,
    required String? apiPath,
    required DioExceptionType dioErrorType,
  }) {
    final statusCode = response?.statusCode;
    final data = response?.data;
    if (data is Map<String, dynamic>) {
      final appError = AppError.fromJson(data)..statusCode = statusCode;
      return appError;
    } else {
      return AppError(
        statusCode: statusCode,
        message: 'Something went wrong',
      );
    }
  }
}

extension _DioExceptionTypeExtension on DioExceptionType {
  String get message {
    switch (this) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout with API server';
      case DioExceptionType.sendTimeout:
        return 'Send timeout in connection with API server';
      case DioExceptionType.receiveTimeout:
        return 'Receive timeout in connection with API server';
      case DioExceptionType.badCertificate:
        return 'Bad Certificate';
      case DioExceptionType.badResponse:
        return 'Bad Response';
      case DioExceptionType.cancel:
        return 'Request to API server was cancelled';
      case DioExceptionType.connectionError:
        return 'Connection Error';
      case DioExceptionType.unknown:
        return 'Unknown';
    }
  }
}
