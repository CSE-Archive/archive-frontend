import 'package:flutter/widgets.dart';

class _ArchiveIconData extends IconData {
  const _ArchiveIconData(
    int codePoint, {
    bool matchTextDirection = false,
  }) : super(
          codePoint,
          fontFamily: 'icons',
          matchTextDirection: matchTextDirection,
        );
}

/// SVGs are from https://tabler-icons.io ,
/// Font file generated with https://icomoon.io/

class ArchiveIcons {
  ArchiveIcons._();

  static const IconData adjustmentsAlt = _ArchiveIconData(0xe900);
  static const IconData brandGithub = _ArchiveIconData(0xe901);
  static const IconData brandTelegram = _ArchiveIconData(0xe902);
  static const IconData chevronDown = _ArchiveIconData(0xe903);
  static const IconData chevronRight = _ArchiveIconData(
    0xe904,
    matchTextDirection: true,
  );
  static const IconData chevronUp = _ArchiveIconData(0xe905);
  static const IconData helpSquare = _ArchiveIconData(0xe906);
  static const IconData menu = _ArchiveIconData(0xe90b);
  static const IconData moonStarsFilled = _ArchiveIconData(0xe907);
  static const IconData photoOff = _ArchiveIconData(0xe908);
  static const IconData sunFilled = _ArchiveIconData(0xe909);
  static const IconData x = _ArchiveIconData(0xe90a);
}
