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
      secondary: kColorSecondery,
      background: kColorSecondery,
      error: Colors.red,
      surface: kColorSecondery,
      onPrimary: kColorPrimary,
      onSecondary: kColorSecondery,
      onBackground: kColorSecondery,
      onError: Colors.red,
      onSurface: kColorPrimary,
    ),
  );

  static final lightTheme = ThemeData(
    textTheme: GoogleFonts.vazirmatnTextTheme(),
    scaffoldBackgroundColor: kColorSecondery,
    unselectedWidgetColor: kColorPrimary,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: kColorSecondery,
      secondary: kColorPrimary,
      background: kColorPrimary,
      error: Colors.red,
      surface: kColorPrimary,
      onPrimary: kColorSecondery,
      onSecondary: kColorPrimary,
      onBackground: kColorPrimary,
      onError: Colors.red,
      onSurface: kColorSecondery,
    ),
  );
}
