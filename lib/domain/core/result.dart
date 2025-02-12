import 'package:dota_heroes/app/core/app_error.dart';

class Result<T> {
  final T? data;
  final Object? error;

  Result.success(this.data) : error = null;
  Result.failure(this.error) : data = null;

  bool get isSuccess => error == null;
  bool get isFailure => error != null;

  void when({
    required void Function(T data) success,
    required void Function(AppError error) failure,
  }) {
    if (error != null) {
      failure(AppError.fromError(error!));
    } else {
      success(data as T);
    }
  }
}

class ResultVoid {
  final Object? error;

  ResultVoid.success() : error = null;
  ResultVoid.failure(this.error);

  bool get isSuccess => error == null;
  bool get isFailure => error != null;

  void when({
    required void Function() success,
    required void Function(AppError error) failure,
  }) {
    if (error != null) {
      failure(AppError.fromError(error!));
    } else {
      success();
    }
  }
}
