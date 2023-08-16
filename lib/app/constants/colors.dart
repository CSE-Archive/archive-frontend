import 'package:flutter/material.dart';

class ArchiveColors {
  ArchiveColors._();

  /// All shades generated with https://maketintsandshades.com/#394955
  static const primaryLight = MaterialColor(
    0xFFEBEDEE,
    {
      500: Color(0xFFEBEDEE),
      600: Color(0xFFD7DBDD),
      700: Color(0xFFB0B6BB),
      800: Color(0xFF889299),
      900: Color(0xFF616D77),
    },
  );

  /// All shades generated with https://maketintsandshades.com/#394955
  static const primaryDark = MaterialColor(
    0xFF394955,
    {
      500: Color(0xFF394955),
      600: Color(0xFF2E3A44),
      700: Color(0xFF222C33),
      800: Color(0xFF171D22),
      900: Color(0xFF0B0F11),
    },
  );

  static const success = MaterialColor(
    0xFF00C897,
    {
      100: Color(0xFFC1FFEF),
      200: Color(0xFF83FFE0),
      500: Color(0xFF00C897),
      900: Color(0xFF00281E),
    },
  );

  static const warning = MaterialColor(
    0xFFFFC73A,
    {
      100: Color(0xFFFFF4D7),
      200: Color(0xFFFFE8AF),
      500: Color(0xFFFFC73A),
      900: Color(0xFF3E2D00),
    },
  );

  static const info = MaterialColor(
    0xFF00A2F6,
    {
      100: Color(0xFFCAECFF),
      200: Color(0xFF95DAFF),
      500: Color(0xFF00A2F6),
      900: Color(0xFF002031),
    },
  );

  static const error = MaterialColor(
    0xFFFF5656,
    {
      100: Color(0xFFFFEBEB),
      200: Color(0xFFFFD6D6),
      500: Color(0xFFFF5656),
      900: Color(0xFF440000),
    },
  );
}
