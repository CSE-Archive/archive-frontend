import 'package:cse_archive/app/constants/assets.dart';
import 'package:cse_archive/app/constants/icons.dart';
import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/controllers/general.dart';
import 'package:cse_archive/app/controllers/search.dart';
import 'package:cse_archive/app/extensions/color_scheme.dart';
import 'package:cse_archive/app/extensions/responsive.dart';
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
        GeneralController.closeDrawer();
        showSupportDialog(context: context);
      },
      child: const Text(ArchiveStrings.appbarSupport),
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

  static Widget _themeSwitchButton(BuildContext context) {
    return ArchiveIconButton(
      icon: ThemeModeService.to.isDarkMode(context)
          ? ArchiveIcons.sunFilled
          : ArchiveIcons.moonStarsFilled,
      onPressed: () => ThemeModeService.to.toggle(context),
      size: context.isMobileOrTablet ? 2.5 * kSizeDefault : 1.7 * kSizeDefault,
      color: context.secondaryColor,
    );
  }

  static Drawer drawer(BuildContext context) {
    return Drawer(
      width: 4 / 5 * context.screenWidth,
      backgroundColor: context.primaryColor,
      shadowColor: context.shadowColor.withOpacity(0.8),
      child: Padding(
        padding: EdgeInsets.all(context.platform.margin),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
            _themeSwitchButton(context),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const logoWidth = 2 * kSizeDefault;

    final generalController = Get.find<GeneralController>();

    final searchBox = searchBar(
      onInit: () {
        if (PageTrackerService.to.activePage != ArchivePage.search) {
          generalController.appbarSearchController.clear();
        }
      },
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

    return SliverAppBar(
      floating: true,
      forceElevated: true,
      elevation: 8,
      toolbarHeight: ArchiveThemes.appbarHeight(context),
      leadingWidth: context.responsiveHorizontalPadding + logoWidth,
      backgroundColor: context.tertiaryColor,
      shadowColor: context.shadowColor.withOpacity(0.7),
      leading: Padding(
        padding: EdgeInsets.only(right: context.responsiveHorizontalPadding),
        child: Center(
          child: Link(
            uri: Uri(path: ArchiveRoutes.home),
            builder: (_, followLink) => GestureDetector(
              onTap: followLink,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: SvgPicture.asset(
                  ArchiveAssets.svg.logo,
                  width: logoWidth,
                  height: logoWidth,
                  colorFilter: ColorFilter.mode(
                    context.secondaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      title: context.isMobileOrTablet
          ? searchBox
          : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 15 * kSizeDefault,
                  child: searchBox,
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
          mobile: const SizedBox.square(
            dimension: 2 * kSizeDefault,
            child: Center(
              child: ArchiveIconButton(
                icon: ArchiveIcons.menu,
                onPressed: GeneralController.openDrawer,
              ),
            ),
          ),
          desktop: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _themeSwitchButton(context),
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

// SliverAppBar sliverAppbar({required BuildContext context}) {

// }
