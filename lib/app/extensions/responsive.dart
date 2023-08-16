import 'package:flutter/material.dart';

abstract class ArchivePlatform {
  final BuildContext context;

  ArchivePlatform(this.context);

  double get maxWidth;
  double get margin;
}

const _tabletMinWidth = 768;
const _desktopMinWidth = 1024;
const _desktopXLMinWidth = 1600;
const _desktopFullHDMinWidth = 1920;

extension ArchiveResponsive on BuildContext {
  ArchivePlatform get mobilePlatform => _Mobile(this);
  ArchivePlatform get tabletPlatform => _Tablet(this);
  ArchivePlatform get desktopPlatform => _Desktop(this);
  ArchivePlatform get desktopXLPlatform => _DesktopXL(this);
  ArchivePlatform get desktopFullHDPlatform => _DesktopFullHD(this);

  double get maxWidth => MediaQuery.sizeOf(this).width;
  double get maxHeight => MediaQuery.sizeOf(this).height;

  double get responsiveHorizontalPadding =>
      (maxWidth - platform.maxWidth > 0
          ? (maxWidth - platform.maxWidth) / 2
          : 0) +
      platform.margin;

  bool get isMobile => maxWidth < _tabletMinWidth;
  bool get isTablet =>
      maxWidth >= _tabletMinWidth && maxWidth < _desktopMinWidth;
  bool get isMobileOrTablet => isMobile || isTablet;
  bool get isDesktop =>
      maxWidth >= _desktopMinWidth && maxWidth < _desktopXLMinWidth;
  bool get isDesktopXL =>
      maxWidth >= _desktopXLMinWidth && maxWidth < _desktopFullHDMinWidth;
  bool get isDesktopFullHD => maxWidth >= _desktopFullHDMinWidth;

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

class _Mobile extends ArchivePlatform {
  _Mobile(super.context);

  @override
  double get maxWidth => context.maxWidth;

  @override
  double get margin => 16;
}

class _Tablet extends ArchivePlatform {
  _Tablet(super.context);

  @override
  double get maxWidth => context.maxWidth;

  @override
  double get margin => 24;
}

class _Desktop extends ArchivePlatform {
  _Desktop(super.context);

  @override
  double get maxWidth => 1110;

  @override
  double get margin => 32;
}

class _DesktopXL extends ArchivePlatform {
  _DesktopXL(super.context);

  @override
  double get maxWidth => 1200;

  @override
  double get margin => 40;
}

class _DesktopFullHD extends ArchivePlatform {
  _DesktopFullHD(super.context);

  @override
  double get maxWidth => 1360;

  @override
  double get margin => 48;
}
