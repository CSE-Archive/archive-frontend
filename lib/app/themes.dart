import 'package:flutter/material.dart';

import 'constants/colors.dart';
import 'constants/sizes.dart';

class ArchiveThemes {
  ArchiveThemes._();

  static const appbarHeight = 4 * kSizeDefault;

  static final dark = _basicThemeData(
    brightness: Brightness.dark,
    primaryColor: ArchiveColors.primaryDark,
    secondaryColor: ArchiveColors.primaryLight,
  );

  static final light = _basicThemeData(
    brightness: Brightness.light,
    primaryColor: ArchiveColors.primaryLight,
    secondaryColor: ArchiveColors.primaryDark,
  );
}

ThemeData _basicThemeData({
  required Brightness brightness,
  required MaterialColor primaryColor,
  required MaterialColor secondaryColor,
}) {
  const fontFamily = 'peyda';

  /// All sizes are based on Material 3 typography (https://m3.material.io/styles/typography/type-scale-tokens)
  final textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 57,
      height: 64 / 57,
      fontWeight: FontWeight.w400,
      color: secondaryColor,
      fontFamily: fontFamily,
    ),
    displayMedium: TextStyle(
      fontSize: 45,
      height: 52 / 45,
      fontWeight: FontWeight.w400,
      color: secondaryColor,
      fontFamily: fontFamily,
    ),
    displaySmall: TextStyle(
      fontSize: 36,
      height: 44 / 36,
      fontWeight: FontWeight.w400,
      color: secondaryColor,
      fontFamily: fontFamily,
    ),
    headlineLarge: TextStyle(
      fontSize: 32,
      height: 40 / 32,
      fontWeight: FontWeight.w400,
      color: secondaryColor,
      fontFamily: fontFamily,
    ),
    headlineMedium: TextStyle(
      fontSize: 28,
      height: 36 / 28,
      fontWeight: FontWeight.w400,
      color: secondaryColor,
      fontFamily: fontFamily,
    ),
    headlineSmall: TextStyle(
      fontSize: 24,
      height: 32 / 24,
      fontWeight: FontWeight.w400,
      color: secondaryColor,
      fontFamily: fontFamily,
    ),
    titleLarge: TextStyle(
      fontSize: 22,
      height: 28 / 22,
      fontWeight: FontWeight.w400,
      color: secondaryColor,
      fontFamily: fontFamily,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      height: 24 / 16,
      fontWeight: FontWeight.w500,
      color: secondaryColor,
      fontFamily: fontFamily,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      height: 20 / 14,
      fontWeight: FontWeight.w500,
      color: secondaryColor,
      fontFamily: fontFamily,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      height: 20 / 14,
      fontWeight: FontWeight.w500,
      color: secondaryColor,
      fontFamily: fontFamily,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      height: 16 / 12,
      fontWeight: FontWeight.w500,
      color: secondaryColor,
      fontFamily: fontFamily,
    ),
    labelSmall: TextStyle(
      fontSize: 11,
      height: 16 / 11,
      fontWeight: FontWeight.w500,
      color: secondaryColor,
      fontFamily: fontFamily,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      height: 24 / 16,
      fontWeight: FontWeight.w400,
      color: secondaryColor,
      fontFamily: fontFamily,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      height: 20 / 14,
      fontWeight: FontWeight.w400,
      color: secondaryColor,
      fontFamily: fontFamily,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      height: 16 / 12,
      fontWeight: FontWeight.w400,
      color: secondaryColor,
      fontFamily: fontFamily,
    ),
  );

  return ThemeData(
    textTheme: textTheme,
    scaffoldBackgroundColor: primaryColor,
    unselectedWidgetColor: secondaryColor,
    splashFactory: NoSplash.splashFactory,
    splashColor: Colors.transparent,
    hoverColor: Colors.transparent,
    highlightColor: Colors.transparent,
    dividerColor: Colors.transparent,
    colorScheme: ColorScheme(
      brightness: brightness,
      primary: primaryColor,
      onPrimary: secondaryColor,
      secondary: secondaryColor,
      onSecondary: primaryColor,
      tertiary: primaryColor.shade600,
      onTertiary: primaryColor.shade800,
      background: secondaryColor,
      onBackground: primaryColor,
      error: ArchiveColors.error,
      onError: primaryColor,
      surface: primaryColor,
      onSurface: secondaryColor,
      shadow: ArchiveColors.primaryDark.shade900,
    ),
    radioTheme: const RadioThemeData(splashRadius: 1),
    listTileTheme: const ListTileThemeData(
      dense: true,
      minLeadingWidth: 0,
      horizontalTitleGap: kSizeDefault / 2,
    ),
    expansionTileTheme: ExpansionTileThemeData(
      tilePadding: const EdgeInsets.symmetric(horizontal: kSizeDefault),
      childrenPadding: EdgeInsets.zero,
      iconColor: secondaryColor,
      collapsedIconColor: secondaryColor,
      backgroundColor: primaryColor,
      collapsedBackgroundColor: primaryColor,
      textColor: secondaryColor,
      collapsedTextColor: secondaryColor,
      collapsedShape: RoundedRectangleBorder(
        side: BorderSide(
          width: 1,
          color: secondaryColor.withOpacity(0.1),
          strokeAlign: BorderSide.strokeAlignCenter,
        ),
      ),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kSizeDefault),
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: secondaryColor,
      selectionColor: ArchiveColors.info.withOpacity(0.2),
      selectionHandleColor: primaryColor.withOpacity(0),
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      filled: true,
      fillColor: secondaryColor.withOpacity(0.1),
      hoverColor: secondaryColor.withOpacity(0.05),
      border: InputBorder.none,
      hintStyle: textTheme.titleMedium!.copyWith(
        color: secondaryColor.withOpacity(0.8),
        fontWeight: FontWeight.w300,
      ),
      prefixIconColor: secondaryColor,
      suffixIconColor: secondaryColor,
      contentPadding: const EdgeInsets.symmetric(
        vertical: kSizeDefault / 1.3,
        horizontal: kSizeDefault,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.hovered)) {
              return primaryColor;
            }
            return secondaryColor;
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.hovered)) {
              return primaryColor;
            }
            return secondaryColor;
          },
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.hovered)) {
              return secondaryColor.withOpacity(0.8);
            }
            return primaryColor;
          },
        ),
        side: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.hovered)) {
              return BorderSide.none;
            }
            return BorderSide(color: secondaryColor);
          },
        ),
        textStyle: MaterialStatePropertyAll(textTheme.bodyMedium),
        surfaceTintColor: const MaterialStatePropertyAll(Colors.transparent),
        shadowColor: const MaterialStatePropertyAll(Colors.transparent),
        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
        minimumSize: const MaterialStatePropertyAll(Size.zero),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.all(4 / 5 * kSizeDefault),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        shape: const MaterialStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStatePropertyAll(primaryColor),
        foregroundColor: MaterialStatePropertyAll(primaryColor),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.hovered)) {
              return secondaryColor.withOpacity(0.8);
            }
            return secondaryColor;
          },
        ),
        textStyle: MaterialStatePropertyAll(textTheme.bodyMedium),
        surfaceTintColor: const MaterialStatePropertyAll(Colors.transparent),
        shadowColor: const MaterialStatePropertyAll(Colors.transparent),
        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
        minimumSize: const MaterialStatePropertyAll(Size.zero),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.all(4 / 5 * kSizeDefault),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        shape: const MaterialStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStatePropertyAll(textTheme.bodyMedium),
        foregroundColor: MaterialStatePropertyAll(secondaryColor),
        shadowColor: const MaterialStatePropertyAll(Colors.transparent),
        surfaceTintColor: const MaterialStatePropertyAll(Colors.transparent),
        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
        minimumSize: const MaterialStatePropertyAll(Size.zero),
        padding: const MaterialStatePropertyAll(EdgeInsets.zero),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    ),
    tooltipTheme: TooltipThemeData(
      preferBelow: true,
      margin: const EdgeInsets.all(kSizeDefault),
      padding: const EdgeInsets.all(kSizeDefault / 2),
      textStyle: textTheme.bodyMedium!.copyWith(color: primaryColor),
      decoration: BoxDecoration(
        color: secondaryColor.withOpacity(0.8),
        borderRadius: BorderRadius.circular(kSizeDefault / 2),
      ),
    ),
  );
}
