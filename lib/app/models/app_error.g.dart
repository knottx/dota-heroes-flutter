// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppError _$AppErrorFromJson(Map<String, dynamic> json) => AppError(
      message: json['message'] as String?,
      statusCode: Decodable.toNum(json['statusCode']),
      apiRequestMethod: json['apiRequestMethod'] as String?,
      apiPath: json['apiPath'] as String?,
    );
