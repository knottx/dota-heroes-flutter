// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppError _$AppErrorFromJson(Map<String, dynamic> json) => AppError(
      message: json['message'] as String?,
      statusCode: Decodable.toNum(json['statusCode']),
      apiRequestMethod: json['apiRequestMethod'] as String?,
      apiPath: json['apiPath'] as String?,
    );

Map<String, dynamic> _$AppErrorToJson(AppError instance) => <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'apiRequestMethod': instance.apiRequestMethod,
      'apiPath': instance.apiPath,
    };
