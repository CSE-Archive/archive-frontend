import 'package:cse_archive/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomThemes {
  static final darkTheme = ThemeData(
    textTheme: GoogleFonts.vazirmatnTextTheme(),
    scaffoldBackgroundColor: kColorPrimary,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: kColorPrimary,
      secondary: Colors.white,
      background: Colors.white,
      error: Colors.red,
      surface: Colors.white,
      onPrimary: kColorPrimary,
      onSecondary: Colors.white,
      onBackground: Colors.white,
      onError: Colors.red,
      onSurface: kColorPrimary,
    ),
  );

  static final lightTheme = ThemeData(
    textTheme: GoogleFonts.vazirmatnTextTheme(),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Colors.white,
      secondary: kColorPrimary,
      background: kColorPrimary,
      error: Colors.red,
      surface: kColorPrimary,
      onPrimary: Colors.white,
      onSecondary: kColorPrimary,
      onBackground: kColorPrimary,
      onError: Colors.red,
      onSurface: Colors.white,
    ),
  );
}
