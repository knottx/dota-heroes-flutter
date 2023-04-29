class AppError implements Exception {
  String? message;

  int? statusCode;
  String? apiPath;

  AppError({
    this.message,
    this.statusCode,
    this.apiPath,
  });

  AppError.fromJson(Map<String, dynamic> json) {
    message = json['error'];
  }
}
