import 'package:dota_heroes/app/models/app_error.dart';

class Codable {
  Codable._();

  static num? decodeNum(dynamic input) {
    if (input is num) {
      return input;
    } else if (input is String) {
      return num.tryParse(input);
    } else {
      return null;
    }
  }

  static T decode<T>(
    T Function(Map<String, dynamic>) fromJson,
    Map<String, dynamic> json,
  ) {
    try {
      return fromJson(json);
    } catch (error) {
      throw AppError(message: '$T: $error');
    }
  }
}
