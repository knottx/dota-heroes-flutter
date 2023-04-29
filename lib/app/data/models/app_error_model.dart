import 'package:dota_heroes/app/utils/codable.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_error_model.g.dart';

@JsonSerializable()
class AppError extends Equatable implements Exception {
  final String? message;

  @JsonKey(fromJson: Decodable.toNum)
  final num? statusCode;
  final String? apiRequestMethod;
  final String? apiPath;

  const AppError({
    this.message,
    this.statusCode,
    this.apiRequestMethod,
    this.apiPath,
  });

  @override
  List<Object?> get props => [
        message,
        statusCode,
        apiRequestMethod,
        apiPath,
      ];

  factory AppError.fromJson(Map<String, dynamic> json) =>
      _$AppErrorFromJson(json);

  Map<String, dynamic> toJson() => _$AppErrorToJson(this);

  AppError copyWith({
    num? statusCode,
    String? apiRequestMethod,
    String? apiPath,
  }) {
    return AppError(
      message: message,
      statusCode: statusCode ?? this.statusCode,
      apiRequestMethod: apiRequestMethod ?? this.apiRequestMethod,
      apiPath: apiPath ?? this.apiPath,
    );
  }
}
