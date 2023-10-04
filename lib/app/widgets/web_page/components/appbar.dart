import 'package:cse_archive/app/constants/assets.dart';
import 'package:cse_archive/app/constants/icons.dart';
import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/controllers/general.dart';
import 'package:cse_archive/app/controllers/search.dart';
import 'package:cse_archive/app/extensions/color_scheme.dart';
import 'package:cse_archive/app/extensions/responsive.dart';
import 'package:cse_archive/app/extensions/text_theme.dart';
import 'package:cse_archive/app/routes/routes.dart';
import 'package:cse_archive/app/services/pages_tracker.dart';
import 'package:cse_archive/app/services/theme_mode.dart';
import 'package:cse_archive/app/themes.dart';
import 'package:cse_archive/app/utils/search_bar.dart';
import 'package:cse_archive/app/utils/show_support_dialog.dart';
import 'package:cse_archive/app/widgets/gap.dart';
import 'package:cse_archive/app/widgets/icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/link.dart';

import 'appbar_text_button.dart';

class ArchiveSliverAppbar extends StatelessWidget {
  const ArchiveSliverAppbar({super.key});

  static Widget _supportButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Get.find<GeneralController>().closeDrawer();
        showSupportDialog(context: context);
      },
      child: const Text(ArchiveStrings.appbarSupport),
    );
  }

  static Widget _searchBox({required BuildContext context}) {
    final generalController = Get.find<GeneralController>();

    return searchBar(
      context: context,
      controller: generalController.appbarSearchController,
      controllerEmpty: generalController.appbarSearchControllerEmpty,
      primaryColor: context.secondaryColor,
      secondaryColor: context.primaryColor,
      onSubmitted: (query) {
        if (query.trim().isEmpty) return;

        context.go(
          Uri(
            path: ArchiveRoutes.search,
            queryParameters: {
              SearchViewController.searchQueryParameter: query.trim(),
            },
          ).toString(),
        );
      },
    );
  }

  static const _coursesButton = AppbarTextButton(
    label: ArchiveStrings.appbarCourses,
    route: ArchiveRoutes.courses,
    page: ArchivePage.courses,
  );

  static const _referencesButton = AppbarTextButton(
    label: ArchiveStrings.appbarReferences,
    route: ArchiveRoutes.references,
    page: ArchivePage.references,
  );

  static const _professorsButton = AppbarTextButton(
    label: ArchiveStrings.appbarProfessors,
    route: ArchiveRoutes.professors,
    page: ArchivePage.professors,
  );

  static const _chartButton = AppbarTextButton(
    label: ArchiveStrings.appbarChart,
    route: ArchiveRoutes.chart,
    page: ArchivePage.chart,
  );

  static Drawer drawer(BuildContext context) {
    return Drawer(
      shadowColor: context.shadowColor.withOpacity(0.5),
      backgroundColor: context.primaryColor,
      child: Padding(
        padding: EdgeInsets.all(context.platform.margin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _searchBox(context: context),
            const Gap.vertical(1.5 * kSizeDefault),
            _coursesButton,
            const Gap.vertical(kSizeDefault),
            _referencesButton,
            const Gap.vertical(kSizeDefault),
            _professorsButton,
            const Gap.vertical(kSizeDefault),
            _chartButton,
            const Gap.vertical(1.5 * kSizeDefault),
            _supportButton(context),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final generalController = Get.find<GeneralController>();

    final logo = Link(
      uri: Uri(path: ArchiveRoutes.home),
      builder: (_, followLink) => GestureDetector(
        onTap: followLink,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (context.isMobileOrTablet) ...[
                Transform.translate(
                  offset: const Offset(0, 4),
                  child: Text(
                    ArchiveStrings.footerTitleDesktop,
                    textAlign: TextAlign.left,
                    style: context.bodyLarge.copyWith(
                      fontWeight: FontWeight.w600,
                      height: 1,
                    ),
                  ),
                ),
                const Gap.horizontal(kSizeDefault / 2),
              ],
              SvgPicture.asset(
                ArchiveAssets.svg.logo,
                width: 2 * kSizeDefault,
                height: 2 * kSizeDefault,
                colorFilter: ColorFilter.mode(
                  context.secondaryColor,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    final themeSwitchButton = ArchiveIconButton(
      icon: ThemeModeService.to.isDarkMode(context)
          ? ArchiveIcons.sunFilled
          : ArchiveIcons.moonStarsFilled,
      onPressed: () => ThemeModeService.to.toggle(context),
      size: 1.7 * kSizeDefault,
      color: context.secondaryColor,
    );

    return SliverAppBar(
      elevation: 8,
      floating: true,
      forceElevated: true,
      automaticallyImplyLeading: false,
      leadingWidth: context.responsiveHorizontalPadding +
          (context.isMobileOrTablet ? 150 : 2.1 * kSizeDefault),
      backgroundColor: context.tertiaryColor,
      toolbarHeight: ArchiveThemes.appbarHeight(context),
      shadowColor: context.shadowColor.withOpacity(0.7),
      leading: Padding(
        padding: EdgeInsets.only(right: context.responsiveHorizontalPadding),
        child: context.responsiveBuilder(
          mobile: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ArchiveIconButton(
                icon: ArchiveIcons.menu,
                onPressed: generalController.openDrawer,
              ),
              const Gap.horizontal(kSizeDefault / 2),
              themeSwitchButton,
            ],
          ),
          desktop: logo,
        ),
      ),
      title: context.isMobileOrTablet
          ? null
          : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 15 * kSizeDefault,
                  child: _searchBox(context: context),
                ),
                const Gap.horizontal(kSizeDefault),
                _coursesButton,
                const Gap.horizontal(kSizeDefault),
                _referencesButton,
                const Gap.horizontal(kSizeDefault),
                _professorsButton,
                const Gap.horizontal(kSizeDefault),
                _chartButton,
              ],
            ),
      actions: [
        context.responsiveBuilder(
          mobile: logo,
          desktop: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              themeSwitchButton,
              const Gap.horizontal(kSizeDefault),
              Center(child: _supportButton(context)),
            ],
          ),
        ),
        Gap.horizontal(context.responsiveHorizontalPadding),
      ],
    );
  }
}
