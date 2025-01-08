import 'package:dota_heroes/app/core/session/session_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionCubit extends Cubit<SessionState> {
  final SharedPreferences _sharedPrefs;

  final _keyFavoriteIds = 'keyFavoriteIds';

  SessionCubit(this._sharedPrefs) : super(const SessionState());

  void loadSession() {
    final stringList = _sharedPrefs.getStringList(_keyFavoriteIds);
    if (stringList != null) {
      emit(
        state.copyWith(
          favoriteIds: stringList.map((e) => int.parse(e)).toSet(),
        ),
      );
    }
    return;
  }

  void setFavorite(int id) async {
    Set<int> favoriteIds = Set.from(state.favoriteIds);
    if (favoriteIds.contains(id)) {
      favoriteIds.remove(id);
    } else {
      favoriteIds.add(id);
    }

    await _sharedPrefs.setStringList(
      _keyFavoriteIds,
      favoriteIds.map((e) => e.toString()).toList(),
    );
  }
}
