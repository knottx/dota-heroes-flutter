import 'package:dio/dio.dart';
import 'package:dota_heroes/app/data/models/app_error_model.dart';

class HandleExceptions {
  static AppError handleError({
    required dynamic error,
    required String? apiPath,
  }) {
    if (error is DioError) {
      return _fromDioError(
        dioError: error,
        apiPath: apiPath,
      );
    } else {
      return AppError(
        message: error.toString(),
        apiPath: apiPath,
      );
    }
  }

  static AppError _fromDioError({
    required DioError dioError,
    required String? apiPath,
  }) {
    final response = dioError.response;
    final statusCode = response?.statusCode;
    switch (dioError.type) {
      case DioErrorType.badResponse:
        return _handleDioErrorResponse(
          response: response,
          apiPath: apiPath,
          dioErrorType: dioError.type,
        );

      case DioErrorType.unknown:
        if (dioError.message?.contains('SocketException') ?? false) {
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
          message: dioError.type.message,
          apiPath: apiPath,
        );
    }
  }

  static AppError _handleDioErrorResponse({
    required Response<dynamic>? response,
    required String? apiPath,
    required DioErrorType dioErrorType,
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

extension _DioErrorTypeExtension on DioErrorType {
  String get message {
    switch (this) {
      case DioErrorType.connectionTimeout:
        return 'Connection timeout with API server';
      case DioErrorType.sendTimeout:
        return 'Send timeout in connection with API server';
      case DioErrorType.receiveTimeout:
        return 'Receive timeout in connection with API server';
      case DioErrorType.badCertificate:
        return 'Bad Certificate';
      case DioErrorType.badResponse:
        return 'Bad Response';
      case DioErrorType.cancel:
        return 'Request to API server was cancelled';
      case DioErrorType.connectionError:
        return 'Connection Error';
      case DioErrorType.unknown:
        return 'Unknown';
    }
  }
}
