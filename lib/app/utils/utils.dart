import 'package:uuid/uuid.dart';

class Utils {
  static String uuid() {
    return const Uuid().v4();
  }
}
