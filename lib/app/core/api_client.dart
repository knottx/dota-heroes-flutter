import 'package:dio/dio.dart';
import 'package:dota_heroes/app/constants/app_constants.dart';
import 'package:dota_heroes/app/core/curl_logger.dart';
import 'package:dota_heroes/app/core/handle_exceptions.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class APIClient {
  static APIClient get instance => _instance;
  static late final APIClient _instance;
  static bool _isInitialized = false;

  final Dio _dio = Dio();

  APIClient._() {
    _dio
      ..options.baseUrl = AppConstants.baseUrl
      ..options.connectTimeout = const Duration(seconds: 15)
      ..options.receiveTimeout = const Duration(seconds: 15)
      ..options.contentType = Headers.jsonContentType
      ..options.responseType = ResponseType.json
      ..interceptors.addAll(
        [
          InterceptorsWrapper(
            onRequest: (options, handler) {
              if (kDebugMode) {
                CurlLogger.log(options);
              }

              return handler.next(options);
            },
          ),
          if (kDebugMode)
            PrettyDioLogger(
              request: true,
              requestHeader: true,
              requestBody: true,
              responseHeader: false,
              responseBody: true,
              error: true,
              compact: true,
            ),
        ],
      );
  }

  static Future<APIClient> initialize() async {
    if (_isInitialized) {
      return _instance;
    }

    _instance = APIClient._();

    _isInitialized = true;
    return _instance;
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return response;
    } catch (error) {
      throw HandleExceptions.handleError(
        error: error,
        apiRequestMethod: 'GET',
        apiPath: path,
      );
    }
  }

  Future<Response> post(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return response;
    } catch (error) {
      throw HandleExceptions.handleError(
        error: error,
        apiRequestMethod: 'POST',
        apiPath: path,
      );
    }
  }

  Future<Response> put(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return response;
    } catch (error) {
      throw HandleExceptions.handleError(
        error: error,
        apiRequestMethod: 'PUT',
        apiPath: path,
      );
    }
  }

  Future<Response> delete(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final Response response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return response;
    } catch (error) {
      throw HandleExceptions.handleError(
        error: error,
        apiRequestMethod: 'DELETE',
        apiPath: path,
      );
    }
  }
}
