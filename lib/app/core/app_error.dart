import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class AppError extends Equatable implements Exception {
  final String? message;
  final int? statusCode;
  final String? debugMessage;

  const AppError({
    this.message,
    this.statusCode,
    this.debugMessage,
  });

  @override
  List<Object?> get props => [
        message,
        statusCode,
        debugMessage,
      ];

  @override
  String toString() {
    return [
      message,
      debugMessage,
    ].nonNulls.where((e) => e.isNotEmpty).join('\n');
  }

  static AppError fromError(Object error) {
    if (error is AppError) {
      return error;
    }

    if (error is DioException) {
      return _fromDioException(error);
    }

    return AppError(
      message: error.toString(),
    );
  }

  static AppError _fromDioException(DioException error) {
    String? message = error.message;

    switch (error.type) {
      case DioExceptionType.badResponse:
        final data = error.response?.data;
        if (data != null && data is Map<String, dynamic>) {
          final dataMessage = data['message'];
          if (dataMessage != null) {
            message = dataMessage;
          }
        }
        break;

      case DioExceptionType.unknown:
        if (message?.contains('SocketException') ?? false) {
          message = 'No Internet';
        }
        break;
      default:
        break;
    }

    final requestOptions = error.requestOptions;
    final statusCode = error.response?.statusCode;
    final method = requestOptions.method;
    final uri = requestOptions.uri;

    final debugMessage = [
      statusCode,
      method,
      uri.toString(),
    ].nonNulls.join(' ');

    return AppError(
      message: message,
      statusCode: statusCode,
      debugMessage: debugMessage,
    );
  }
}
