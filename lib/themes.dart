import 'package:cse_archive/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomThemes {
  static final darkTheme = ThemeData(
    textTheme: GoogleFonts.vazirmatnTextTheme(),
    scaffoldBackgroundColor: kColorPrimary,
    unselectedWidgetColor: kColorPrimary,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: kColorPrimary,
      secondary: kColorSecondary,
      background: kColorSecondary,
      error: Colors.red,
      surface: kColorSecondary,
      onPrimary: kColorPrimary,
      onSecondary: kColorSecondary,
      onBackground: kColorSecondary,
      onError: Colors.red,
      onSurface: kColorPrimary,
    ),
  );

  static final lightTheme = ThemeData(
    textTheme: GoogleFonts.vazirmatnTextTheme(),
    scaffoldBackgroundColor: kColorSecondary,
    unselectedWidgetColor: kColorSecondary,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: kColorSecondary,
      secondary: kColorPrimary,
      background: kColorPrimary,
      error: Colors.red,
      surface: kColorPrimary,
      onPrimary: kColorSecondary,
      onSecondary: kColorPrimary,
      onBackground: kColorPrimary,
      onError: Colors.red,
      onSurface: kColorSecondary,
    ),
  );
}
