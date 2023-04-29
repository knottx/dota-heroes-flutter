import 'dart:convert';

import 'package:dota_heroes/app/managers/session/session_state.dart';
import 'package:dota_heroes/app/managers/user_data_manager.dart';
import 'package:dota_heroes/app/utils/logger.dart';
import 'package:dota_heroes/env.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SessionCubit extends Cubit<SessionState> {
  static late final SessionCubit instance;
  static bool _isInitialized = false;

  final UserDataManager _userDataManager;

  SessionCubit._({
    required UserDataManager userDataManager,
  })  : _userDataManager = userDataManager,
        super(const SessionState());

  static Future<void> initialize(
    UserDataManager userDataManager,
  ) async {
    if (_isInitialized) return;

    instance = SessionCubit._(
      userDataManager: userDataManager,
    );

    await instance._loadSession();

    _isInitialized = true;
    return;
  }

  Future<void> _loadSession() async {
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
