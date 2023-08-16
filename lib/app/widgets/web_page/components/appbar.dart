import 'package:cse_archive/app/constants/assets.dart';
import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/controllers/search_text_field.dart';
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

SliverAppBar appbar({required BuildContext context}) {
  const logoWidth = 2 * kSizeDefault;

  final searchBarController = Get.put(
    SearchTextFieldController(),
    tag: 'appbar',
    permanent: true,
  );

  final searchBox = searchBar(
    onInit: () {
      if (PageTrackerService.to.activePage != ArchivePage.search) {
        searchBarController.textController.clear();
        searchBarController.showClearButton(false);
      }
    },
    context: context,
    searchBarController: searchBarController,
    primaryColor: Theme.of(context).colorScheme.secondary,
    secondaryColor: Theme.of(context).colorScheme.primary,
    onSubmitted: (query) => context.go(
      Uri(
        path: ArchiveRoutes.search,
        queryParameters: {'q': query},
      ).toString(),
    ),
  );

  return SliverAppBar(
    floating: true,
    forceElevated: true,
    elevation: 8,
    toolbarHeight: ArchiveThemes.appbarHeight,
    leadingWidth: context.responsiveHorizontalPadding + logoWidth,
    backgroundColor: Theme.of(context).colorScheme.tertiary,
    shadowColor: Theme.of(context).colorScheme.shadow.withOpacity(0.7),
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
                  Theme.of(context).colorScheme.secondary,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        context.responsiveBuilder(
          mobile: Expanded(child: searchBox),
          desktop: SizedBox(
            width: 15 * kSizeDefault,
            child: searchBox,
          ),
        ),
        const Gap.horizontal(kSizeDefault),
        if (!context.isMobileOrTablet)
          const Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppbarTextButton(
                label: ArchiveStrings.appbarCourses,
                route: ArchiveRoutes.courses,
                page: ArchivePage.courses,
              ),
              Gap.horizontal(kSizeDefault),
              AppbarTextButton(
                label: ArchiveStrings.appbarReferences,
                route: ArchiveRoutes.references,
                page: ArchivePage.references,
              ),
              Gap.horizontal(kSizeDefault),
              AppbarTextButton(
                label: ArchiveStrings.appbarProfessors,
                route: ArchiveRoutes.professors,
                page: ArchivePage.professors,
              ),
              Gap.horizontal(kSizeDefault),
              AppbarTextButton(
                label: ArchiveStrings.appbarChart,
                route: ArchiveRoutes.chart,
                page: ArchivePage.chart,
              ),
            ],
          ),
      ],
    ),
    actions: [
      if (!context.isMobileOrTablet) ...[
        ArchiveIconButton(
          icon: ThemeModeService.to.isDarkMode(context)
              ? Icons.light_mode
              : Icons.dark_mode,
          onPressed: () => ThemeModeService.to.toggle(context),
          size: 1.7 * kSizeDefault,
          color: Theme.of(context).colorScheme.secondary,
        ),
        const Gap.horizontal(kSizeDefault),
        Center(
          child: ElevatedButton(
            onPressed: () => showSupportDialog(context: context),
            child: const Text(ArchiveStrings.appbarSupport),
          ),
        ),
      ],
      Gap.horizontal(context.responsiveHorizontalPadding),
    ],
  );
}
