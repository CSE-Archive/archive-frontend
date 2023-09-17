import 'package:flutter/material.dart';

extension ArchiveColorTheme on BuildContext {
  Color get primaryColor => Theme.of(this).colorScheme.primary;
  Color get secondaryColor => Theme.of(this).colorScheme.secondary;
  Color get tertiaryColor => Theme.of(this).colorScheme.tertiary;
  Color get onTertiaryColor => Theme.of(this).colorScheme.onTertiary;
  Color get shadowColor => Theme.of(this).colorScheme.shadow;
}
