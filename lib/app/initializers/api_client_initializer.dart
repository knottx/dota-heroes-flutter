import 'package:dio/dio.dart';
import 'package:dota_heroes/common/app_constants.dart';
import 'package:dota_heroes/common/curl_logger.dart';
import 'package:dota_heroes/data/core/api_client_impl.dart';
import 'package:dota_heroes/domain/core/api_client.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

ApiClient initializeApiClient() {
  final dio = Dio(
    BaseOptions(
      baseUrl: AppConstants.baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
    ),
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        if (kDebugMode) {
          CurlLogger.log(options);
        }

        return handler.next(options);
      },
    ),
  );

  if (kDebugMode) {
    dio.interceptors.add(
      PrettyDioLogger(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        error: true,
        compact: true,
      ),
    );
  }

  return ApiClientImpl(dio);
}
