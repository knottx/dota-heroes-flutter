import 'package:dota_heroes/presentation/style/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  AppTextStyle._();

  static TextStyle get _base => const TextStyle();

  /// Thin
  static TextStyle w100(double fontSize) => _base.copyWith(
        fontWeight: FontWeight.w100,
        fontSize: fontSize,
      );

  /// ExtraLight
  static TextStyle w200(double fontSize) => _base.copyWith(
        fontWeight: FontWeight.w200,
        fontSize: fontSize,
      );

  /// Light
  static TextStyle w300(double fontSize) => _base.copyWith(
        fontWeight: FontWeight.w300,
        fontSize: fontSize,
      );

  /// Regular
  static TextStyle w400(double fontSize) => _base.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: fontSize,
      );

  /// Medium
  static TextStyle w500(double fontSize) => _base.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
      );

  /// SemiBold
  static TextStyle w600(double fontSize) => _base.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: fontSize,
      );

  /// Bold
  static TextStyle w700(double fontSize) => _base.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: fontSize,
      );

  /// ExtraBold
  static TextStyle w800(double fontSize) => _base.copyWith(
        fontWeight: FontWeight.w800,
        fontSize: fontSize,
      );

  /// Black
  static TextStyle w900(double fontSize) => _base.copyWith(
        fontWeight: FontWeight.w900,
        fontSize: fontSize,
      );
}

extension TextStyleExtension on TextStyle {
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);

  TextStyle get colorBlack => copyWith(color: Colors.black);
  TextStyle get colorWhite => copyWith(color: Colors.white);

  TextStyle get colorPrimaryText => copyWith(color: AppColors.primary);
  TextStyle get colorSecondaryText => copyWith(color: AppColors.secondary);
  TextStyle get colorTertiaryText => copyWith(color: AppColors.tertiary);

  TextStyle get underline => copyWith(
        decoration: TextDecoration.underline,
        decorationColor: color,
      );

  TextStyle get lineThrough => copyWith(
        decoration: TextDecoration.lineThrough,
        decorationColor: color,
      );
}
