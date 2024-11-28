import 'dart:convert';

import 'package:dota_heroes/app/config/env.dart';
import 'package:dota_heroes/app/core/session/session_state.dart';
import 'package:dota_heroes/app/core/session/user_data_manager.dart';
import 'package:dota_heroes/app/utils/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SessionCubit extends Cubit<SessionState> {
  final UserDataManager _userDataManager;

  SessionCubit({
    required UserDataManager userDataManager,
  })  : _userDataManager = userDataManager,
        super(const SessionState());

  Future<void> loadSession() async {
    final result = await _userDataManager.read(
      key: Env.keyFavoriteIds,
    );
    if (result != null) {
      emit(
        state.copyWith(
          favoriteIds: jsonDecode(result).cast<int>(),
        ),
      );
    }
    return;
  }

  void setFavorite(int id) async {
    List<int> favoriteIds = [];
    favoriteIds.addAll(state.favoriteIds);
    if (favoriteIds.contains(id)) {
      favoriteIds.remove(id);
    } else {
      favoriteIds.add(id);
    }

    try {
      await _userDataManager.write(
        key: Env.keyFavoriteIds,
        value: jsonEncode(favoriteIds),
      );
      emit(state.copyWith(favoriteIds: favoriteIds));
    } catch (error) {
      Logger.logError(error);
    }
  }
}
