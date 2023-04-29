import 'package:dio/dio.dart';
import 'package:dota_heroes/app/data/models/app_error_model.dart';

class HandleExceptions {
  HandleExceptions._();

  static AppError handleError({
    required Object error,
    String? apiRequestMethod,
    String? apiPath,
  }) {
    if (error is DioException) {
      return _fromDioException(
        dioException: error,
        apiRequestMethod: apiRequestMethod,
        apiPath: apiPath,
      );
    } else if (error is AppError) {
      return error;
    } else {
      return AppError(
        message: error.toString(),
        apiRequestMethod: apiRequestMethod,
        apiPath: apiPath,
      );
    }
  }

  static AppError _fromDioException({
    required DioException dioException,
    required String? apiRequestMethod,
    required String? apiPath,
  }) {
    final response = dioException.response;
    final statusCode = response?.statusCode;
    String message = dioException.type.message;
    switch (dioException.type) {
      case DioExceptionType.badResponse:
        return _handleDioExceptionResponse(
          response: response,
          apiRequestMethod: apiRequestMethod,
          apiPath: apiPath,
        );

      case DioExceptionType.unknown:
        if (dioException.message?.contains('SocketException') ?? false) {
          message = 'No Internet';
        }

      default:
        break;
    }

    return AppError(
      statusCode: statusCode,
      message: message,
      apiRequestMethod: apiRequestMethod,
      apiPath: apiPath,
    );
  }

  static AppError _handleDioExceptionResponse({
    required Response<dynamic>? response,
    required String? apiRequestMethod,
    required String? apiPath,
  }) {
    final statusCode = response?.statusCode;
    String message = 'Oops something went wrong';
    final data = response?.data;

    if (statusCode != null && statusCode >= 400) {
      if (data is Map<String, dynamic> && data['error'] != null) {
        try {
          final appError = AppError.fromJson(data['error']);
          return appError.copyWith(
            statusCode: statusCode,
            apiRequestMethod: apiRequestMethod,
            apiPath: apiPath,
          );
        } catch (error) {
          message = error.toString();
        }
      }
    }

    return AppError(
      statusCode: statusCode,
      message: message,
      apiRequestMethod: apiRequestMethod,
      apiPath: apiPath,
    );
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
        return 'Unexpected error occurred';
    }
  }
}
