import 'package:dota_heroes/app/constants/app_constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SessionManager {
  static final SessionManager shared = Get.find();

  final GetStorage _getStorage;

  SessionManager(this._getStorage);

  final RxList<int> favoriteIds = RxList();

  void loadSession() {
    final result = _getStorage.read(AppConstants.keyFavoriteIds);
    if (result is List) {
      favoriteIds.value = result.whereType<int>().toList();
    }
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
