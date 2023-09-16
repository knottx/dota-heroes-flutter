import 'package:dota_heroes/app/constants/app_constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SessionManager {
  static final SessionManager shared = Get.find();

  final GetStorage _getStorage = GetStorage();

  SessionManager();

  final RxList<int> favoriteIds = RxList();

  Future<void> loadSession() async {
    final result = _getStorage.read(AppConstants.keyFavoriteIds);
    if (result is List) {
      favoriteIds.value = result.whereType<int>().toList();
    }
    return;
  }

  void setFavorite(int id) {
    if (favoriteIds.contains(id)) {
      favoriteIds.remove(id);
    } else {
      favoriteIds.add(id);
    }
    _getStorage.write(
      AppConstants.keyFavoriteIds,
      favoriteIds.value,
    );
  }
}
