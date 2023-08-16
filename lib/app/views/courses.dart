import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/controllers/courses.dart';
import 'package:cse_archive/app/extensions/responsive.dart';
import 'package:cse_archive/app/routes/routes.dart';
import 'package:cse_archive/app/themes.dart';
import 'package:cse_archive/app/utils/course_cards_builder.dart';
import 'package:cse_archive/app/utils/expansion_tile_radio_button.dart';
import 'package:cse_archive/app/utils/expansion_tile_search_bar.dart';
import 'package:cse_archive/app/widgets/dialog.dart';
import 'package:cse_archive/app/widgets/gap.dart';
import 'package:cse_archive/app/widgets/path.dart';
import 'package:cse_archive/app/widgets/web_page/web_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'loading.dart';

class CoursesView extends StatelessWidget {
  final Map<String, String> parameters;

  const CoursesView({
    super.key,
    required this.parameters,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Change

    final controller = Get.find<CoursesController>();
    controller.setParameters(parameters);

    Widget getFiltersDialog(BuildContext context) {
      return ArchiveDialog(
        title: ArchiveStrings.filters,
        children: [
          expansionTileSearchBar(
            context: context,
            title: ArchiveStrings.coursesTitle,
            parameter: 'q',
            oldParameters: parameters,
            onSelectMainRoute: '/courses',
            searchBarController: controller.searchBarController,
          ),
          expansionTileRadioButton(
            context: context,
            title: ArchiveStrings.coursesType,
            options: controller.typeOptions,
            selectedOption: controller.selectedType,
            onSelectMainRoute: '/courses',
            oldParameters: parameters,
            parameter: 'type',
          ),
          expansionTileRadioButton(
            context: context,
            title: ArchiveStrings.coursesUnits,
            options: controller.unitsOptions,
            selectedOption: controller.selectedUnits,
            onSelectMainRoute: '/courses',
            oldParameters: parameters,
            parameter: 'units',
          ),
        ],
      );
    }

    return ArchiveWebPage(
      body: controller.obx(
        (courses) => Column(
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
                    builder: getFiltersDialog,
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
                        Icons.filter_alt_rounded,
                        color: Theme.of(context).colorScheme.secondary,
                        size: kSizeDefault,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Gap.vertical(1.5 * kSizeDefault),
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: context.maxHeight -
                    (ArchiveThemes.appbarHeight + 7 * kSizeDefault),
              ),
              child: courseCardsBuilder(
                context: context,
                courses: courses!,
                infiniteWidth: false,
              ),
            ),
          ],
        ),
        onLoading: const LoadingView(),
      ),
    );
  }
}
