import 'package:cse_archive/app/constants/icons.dart';
import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/controllers/courses.dart';
import 'package:cse_archive/app/routes/routes.dart';
import 'package:cse_archive/app/utils/course_cards_builder.dart';
import 'package:cse_archive/app/utils/expansion_tile_radio_button.dart';
import 'package:cse_archive/app/utils/expansion_tile_search_bar.dart';
import 'package:cse_archive/app/widgets/dialog.dart';
import 'package:cse_archive/app/widgets/gap.dart';
import 'package:cse_archive/app/widgets/load_more_button.dart';
import 'package:cse_archive/app/widgets/path.dart';
import 'package:cse_archive/app/widgets/web_page/web_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'loading.dart';

class CoursesView extends GetView<CoursesController> {
  final Map<String, String> queryParameters;

  const CoursesView({
    super.key,
    required this.queryParameters,
  });

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (_) => ArchiveWebPage(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ArchivePath(
                  labels: const [
                    ArchiveStrings.home,
                    ArchiveStrings.courses,
                  ],
                  routes: const [
                    ArchiveRoutes.home,
                    ArchiveRoutes.courses,
                  ],
                ),
                const Spacer(),
                TextButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context) => _getFiltersDialog(
                      context,
                      controller: controller,
                      queryParameters: queryParameters,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        ArchiveStrings.filters,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      const Gap.horizontal(kSizeDefault / 2),
                      Icon(
                        ArchiveIcons.adjustmentsAlt,
                        color: Theme.of(context).colorScheme.secondary,
                        size: kSizeDefault,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Gap.vertical(1.5 * kSizeDefault),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(
                  () => courseCardsBuilder(
                    context: context,
                    courses: controller.courses,
                    infiniteWidth: false,
                  ),
                ),
                Obx(
                  () => controller.isThereMore.isTrue
                      ? Padding(
                          padding:
                              const EdgeInsets.only(top: 1.5 * kSizeDefault),
                          child: ArchiveLoadMoreButton(
                            isLoadingMore: controller.isLoadingMore,
                            onPressed: controller.loadMore,
                          ),
                        )
                      : Gap.zero,
                ),
              ],
            ),
          ],
        ),
      ),
      onLoading: const LoadingView(),
    );
  }
}

Widget _getFiltersDialog(
  BuildContext context, {
  required CoursesController controller,
  required Map<String, String> queryParameters,
}) {
  return ArchiveDialog(
    title: ArchiveStrings.filters,
    children: [
      expansionTileSearchBar(
        context: context,
        title: ArchiveStrings.coursesTitleFilter,
        queryParameters: queryParameters,
        queryParameter: CoursesController.searchQueryParameter,
        searchController: controller.searchController,
        effectiveRoute: ArchiveRoutes.courses,
      ),
      expansionTileRadioButton(
        context: context,
        title: ArchiveStrings.coursesTypeFilter,
        queryParameters: queryParameters,
        queryParameter: CoursesController.typeQueryParameter,
        options: CoursesController.typeQueryOptions,
        defaultOption: CoursesController.typeQueryDefault,
        selectedOption: controller.selectedType,
        effectiveRoute: ArchiveRoutes.courses,
      ),
      expansionTileRadioButton(
        context: context,
        title: ArchiveStrings.coursesUnitsFilter,
        queryParameters: queryParameters,
        queryParameter: CoursesController.unitsQueryParameter,
        options: CoursesController.unitsQueryOptions,
        defaultOption: CoursesController.unitsQueryDefault,
        selectedOption: controller.selectedUnits,
        effectiveRoute: ArchiveRoutes.courses,
      ),
    ],
  );
}
