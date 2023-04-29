import 'dart:convert';

import 'package:aes256/aes256.dart';
import 'package:dota_heroes/app/config/env.dart';
import 'package:dota_heroes/app/utils/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class UserDataManager {
  static late final UserDataManager instance;
  static bool _isInitialized = false;

  final String uuid;
  final FlutterSecureStorage _secureStorage;

  UserDataManager._(
    this.uuid,
    this._secureStorage,
  );

  static Future<void> initialize() async {
    if (_isInitialized) return;

    final keyUuid = Env.keyUuid;
    final sharedPrefs = await SharedPreferences.getInstance();
    const secureStorage = FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
      iOptions: IOSOptions(
        synchronizable: false,
      ),
    );
    final uuid = sharedPrefs.getString(keyUuid);
    if (uuid != null) {
      Logger.debug.log('UUID: $uuid');
      _isInitialized = true;
      instance = UserDataManager._(
        uuid,
        secureStorage,
      );
      _isInitialized = true;
      return;
    } else {
      try {
        final newUuid = const Uuid().v4();
        Logger.debug.log('UUID: $newUuid');
        await secureStorage.deleteAll();
        await sharedPrefs.setString(keyUuid, newUuid);
        instance = UserDataManager._(
          newUuid,
          secureStorage,
        );
        _isInitialized = true;
        return;
      } catch (error) {
        if (kDebugMode) {
          print(error);
        }
        rethrow;
      }
    }
  }

  String _keyWithUuid(String key) {
    return [
      key,
      uuid,
    ].join('_');
  }

  Future<String> appPassphrase() async {
    final keyAppPassphrase = Env.keyAppPassphrase;
    String? passphrase = await _read(
      key: _keyWithUuid(keyAppPassphrase),
    );

    if (passphrase != null) {
      return passphrase;
    } else {
      final newPassphrase = const Uuid().v4();
      try {
        await _write(
          key: _keyWithUuid(keyAppPassphrase),
          value: newPassphrase,
        );
        return newPassphrase;
      } catch (error) {
        if (kDebugMode) {
          print(error);
        }
        return newPassphrase;
      }
    }
  }

  Future<String?> read({
    required String key,
  }) async {
    final keyWithUuid = _keyWithUuid(key);
    final result = await _read(
      key: keyWithUuid,
    );

    if (result != null) {
      try {
        final passphrase = await appPassphrase();
        final decrypted = await Aes256.decrypt(
          result,
          passphrase,
        ).onError((error, stackTrace) => null);
        return decrypted;
      } catch (error) {
        if (kDebugMode) {
          print(error);
        }
        return null;
      }
    } else {
      return null;
    }
  }

  Future<bool?> readBool({
    required String key,
  }) async {
    final result = await read(key: key);
    return (result != null) ? bool.tryParse(result) : null;
  }

  Future<int?> readInt({
    required String key,
  }) async {
    final result = await read(key: key);
    return (result != null) ? int.tryParse(result) : null;
  }

  Future<Map<String, dynamic>?> readJson({
    required String key,
  }) async {
    try {
      final result = await read(key: key);
      return (result != null) ? jsonDecode(result) : null;
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      return null;
    }
  }

  Future<void> write({
    required String key,
    required String? value,
  }) async {
    final keyWithUuid = _keyWithUuid(key);
    if (value != null) {
      final passphrase = await appPassphrase();
      final encrypted = await Aes256.encrypt(
        value,
        passphrase,
      );
      return _write(
        key: keyWithUuid,
        value: encrypted,
      );
    } else {
      return _write(
        key: keyWithUuid,
        value: value,
      );
    }
  }

  Future<void> writeBool({
    required String key,
    required bool? value,
  }) async {
    return write(
      key: key,
      value: value?.toString(),
    );
  }

  Future<void> writeInt({
    required String key,
    required int? value,
  }) async {
    return write(
      key: key,
      value: value?.toString(),
    );
  }

  Future<void> writeJson({
    required String key,
    required Map<String, dynamic>? value,
  }) async {
    return write(
      key: key,
      value: (value != null) ? jsonEncode(value) : null,
    );
  }

  Future<String?> _read({
    required String key,
  }) async {
    try {
      final result = await _secureStorage.read(
        key: key,
      );
      return result;
    } catch (error) {
      Logger.logError(error);
      return null;
    }
  }

  Future<void> _write({
    required String key,
    required String? value,
  }) async {
    try {
      await _secureStorage.write(
        key: key,
        value: value,
      );
      return;
    } catch (error) {
      Logger.logError(error);
      return;
    }
  }

  Future<void> delete({
    required String key,
  }) async {
    try {
      await _secureStorage.delete(
        key: _keyWithUuid(key),
      );
      return;
    } catch (error) {
      Logger.logError(error);
      return;
    }
  }
}
