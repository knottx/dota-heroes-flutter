class Decodable {
  Decodable._();

  static num? toNum(dynamic input) {
    if (input is num) {
      return input;
    } else if (input is String) {
      return num.tryParse(input);
    } else {
      return null;
    }
  }
}
