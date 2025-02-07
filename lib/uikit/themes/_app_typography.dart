import 'package:flutter/material.dart';

class AppTypography {
  String get fontFamily => "SF UI Display";

  TextStyle get title30Bold => TextStyle(
      fontSize: 30.0,
      height: 1.46,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600);

  TextStyle get title3024Bold => TextStyle(
      fontSize: 24.0,
      height: 1.5,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700);

  TextStyle get title20Bold => TextStyle(
      fontSize: 20.0,
      height: 1.6,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700);

  TextStyle get headline16Bold => TextStyle(
      fontSize: 16.0,
      height: 1.5,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700);

  TextStyle get headline16Semibold => TextStyle(
      fontSize: 16.0,
      height: 1.5,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700);

  TextStyle get body14Semibold => TextStyle(
      fontSize: 14.0,
      height: 1.7,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600);

  TextStyle get body14Medium => TextStyle(
      fontSize: 14.0,
      height: 1.7,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500);

  TextStyle get caption12Bold => TextStyle(
      fontSize: 12.0,
      height: 1.333,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700);
  TextStyle get caption12Medium => TextStyle(
      fontSize: 12,
      height: 1.333,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500);
}
