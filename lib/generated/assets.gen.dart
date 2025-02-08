/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/background.jpg
  AssetGenImage get background =>
      const AssetGenImage('assets/images/background.jpg');

  /// File path: assets/images/dota2_logo.png
  AssetGenImage get dota2Logo =>
      const AssetGenImage('assets/images/dota2_logo.png');

  /// File path: assets/images/dota2_logo_color.png
  AssetGenImage get dota2LogoColor =>
      const AssetGenImage('assets/images/dota2_logo_color.png');

  /// File path: assets/images/hero_agility.png
  AssetGenImage get heroAgility =>
      const AssetGenImage('assets/images/hero_agility.png');

  /// File path: assets/images/hero_intelligence.png
  AssetGenImage get heroIntelligence =>
      const AssetGenImage('assets/images/hero_intelligence.png');

  /// File path: assets/images/hero_strength.png
  AssetGenImage get heroStrength =>
      const AssetGenImage('assets/images/hero_strength.png');

  /// File path: assets/images/hero_universal.png
  AssetGenImage get heroUniversal =>
      const AssetGenImage('assets/images/hero_universal.png');

  /// File path: assets/images/icon_armor.png
  AssetGenImage get iconArmor =>
      const AssetGenImage('assets/images/icon_armor.png');

  /// File path: assets/images/icon_attack_range.png
  AssetGenImage get iconAttackRange =>
      const AssetGenImage('assets/images/icon_attack_range.png');

  /// File path: assets/images/icon_attack_rate.png
  AssetGenImage get iconAttackRate =>
      const AssetGenImage('assets/images/icon_attack_rate.png');

  /// File path: assets/images/icon_damage.png
  AssetGenImage get iconDamage =>
      const AssetGenImage('assets/images/icon_damage.png');

  /// File path: assets/images/icon_magic_resist.png
  AssetGenImage get iconMagicResist =>
      const AssetGenImage('assets/images/icon_magic_resist.png');

  /// File path: assets/images/icon_movement_speed.png
  AssetGenImage get iconMovementSpeed =>
      const AssetGenImage('assets/images/icon_movement_speed.png');

  /// File path: assets/images/icon_projectile_speed.png
  AssetGenImage get iconProjectileSpeed =>
      const AssetGenImage('assets/images/icon_projectile_speed.png');

  /// File path: assets/images/icon_turn_rate.png
  AssetGenImage get iconTurnRate =>
      const AssetGenImage('assets/images/icon_turn_rate.png');

  /// File path: assets/images/icon_vision.png
  AssetGenImage get iconVision =>
      const AssetGenImage('assets/images/icon_vision.png');

  /// File path: assets/images/melee.svg
  SvgGenImage get melee => const SvgGenImage('assets/images/melee.svg');

  /// File path: assets/images/ranged.svg
  SvgGenImage get ranged => const SvgGenImage('assets/images/ranged.svg');

  /// List of all assets
  List<dynamic> get values => [
    background,
    dota2Logo,
    dota2LogoColor,
    heroAgility,
    heroIntelligence,
    heroStrength,
    heroUniversal,
    iconArmor,
    iconAttackRange,
    iconAttackRate,
    iconDamage,
    iconMagicResist,
    iconMovementSpeed,
    iconProjectileSpeed,
    iconTurnRate,
    iconVision,
    melee,
    ranged,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
