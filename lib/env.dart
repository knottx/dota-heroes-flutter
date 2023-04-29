import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: 'env.properties')
abstract class Env {
  // Key
  @EnviedField(
    obfuscate: true,
    varName: 'key.uuid',
  )
  static final String keyUuid = _Env.keyUuid;

  @EnviedField(
    obfuscate: true,
    varName: 'key.appPassphrase',
  )
  static final String keyAppPassphrase = _Env.keyAppPassphrase;

  @EnviedField(
    obfuscate: true,
    varName: 'key.favoriteIds',
  )
  static final String keyFavoriteIds = _Env.keyFavoriteIds;
}
