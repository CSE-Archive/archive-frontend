import 'package:cse_archive/app/constants/sizes.dart';
import 'package:flutter/material.dart';

extension ArchiveResponsive on BuildContext {
  static const _tabletMinWidth = 768;
  static const _desktopMinWidth = 1024;
  static const _desktopXLMinWidth = 1600;
  static const _desktopFullHDMinWidth = 1920;

  ArchivePlatform get mobilePlatform => _Mobile(this);
  ArchivePlatform get tabletPlatform => _Tablet(this);
  ArchivePlatform get desktopPlatform => _Desktop(this);
  ArchivePlatform get desktopXLPlatform => _DesktopXL(this);
  ArchivePlatform get desktopFullHDPlatform => _DesktopFullHD(this);

  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;

  double get responsiveHorizontalPadding =>
      (screenWidth - platform.maxWidth > 0
          ? (screenWidth - platform.maxWidth) / 2
          : 0) +
      platform.margin;

  double get responsiveCardWidth =>
      ((platform.maxWidth - 2 * platform.margin) -
          (platform.cardsGridViewCrossAxisCount - 1) * kSizeDefault) /
      platform.cardsGridViewCrossAxisCount;

  bool get isMobile => screenWidth < _tabletMinWidth;
  bool get isTablet =>
      screenWidth >= _tabletMinWidth && screenWidth < _desktopMinWidth;
  bool get isMobileOrTablet => isMobile || isTablet;
  bool get isDesktop =>
      screenWidth >= _desktopMinWidth && screenWidth < _desktopXLMinWidth;
  bool get isDesktopXL =>
      screenWidth >= _desktopXLMinWidth && screenWidth < _desktopFullHDMinWidth;
  bool get isDesktopFullHD => screenWidth >= _desktopFullHDMinWidth;

  ArchivePlatform get platform {
    if (isMobile) return mobilePlatform;
    if (isTablet) return tabletPlatform;
    if (isDesktop) return desktopPlatform;
    if (isDesktopXL) return desktopXLPlatform;
    return desktopFullHDPlatform;
  }

  Widget responsiveBuilder({
    Widget? mobile,
    Widget? tablet,
    Widget? desktop,
    Widget? desktopXL,
    Widget? desktopFullHD,
  }) {
    mobile ??= const SizedBox.shrink();
    tablet ??= mobile;
    desktop ??= tablet;
    desktopXL ??= desktop;
    desktopFullHD ??= desktopXL;

    if (isMobile) return mobile;
    if (isTablet) return tablet;
    if (isDesktop) return desktop;
    if (isDesktopXL) return desktopXL;
    return desktopFullHD;
  }

  Widget platformBuilder({
    required Widget Function(ArchivePlatform platform) builder,
  }) =>
      builder(platform);
}

abstract class ArchivePlatform {
  final BuildContext context;

  ArchivePlatform(this.context);

  double get maxWidth;
  double get margin;
  int get cardsGridViewCrossAxisCount;
}

class _Mobile extends ArchivePlatform {
  _Mobile(super.context);

  @override
  double get maxWidth => context.screenWidth;

  @override
  double get margin => 16;

  @override
  int get cardsGridViewCrossAxisCount => 1;
}

class _Tablet extends ArchivePlatform {
  _Tablet(super.context);

  @override
  double get maxWidth => context.screenWidth;

  @override
  double get margin => 24;

  @override
  int get cardsGridViewCrossAxisCount => 2;
}

class _Desktop extends ArchivePlatform {
  _Desktop(super.context);

  @override
  double get maxWidth => 1024;

  @override
  double get margin => 32;

  @override
  int get cardsGridViewCrossAxisCount => 3;
}

class _DesktopXL extends ArchivePlatform {
  _DesktopXL(super.context);

  @override
  double get maxWidth => 1300;

  @override
  double get margin => 40;

  @override
  int get cardsGridViewCrossAxisCount => 4;
}

class _DesktopFullHD extends ArchivePlatform {
  _DesktopFullHD(super.context);

  @override
  double get maxWidth => 1450;

  @override
  double get margin => 48;

  @override
  int get cardsGridViewCrossAxisCount => 4;
}
