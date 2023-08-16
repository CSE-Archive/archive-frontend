import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/controllers/professors.dart';
import 'package:cse_archive/app/extensions/responsive.dart';
import 'package:cse_archive/app/routes/routes.dart';
import 'package:cse_archive/app/themes.dart';
import 'package:cse_archive/app/utils/expansion_tile_radio_button.dart';
import 'package:cse_archive/app/utils/expansion_tile_search_bar.dart';
import 'package:cse_archive/app/utils/professor_cards_builder.dart';
import 'package:cse_archive/app/widgets/dialog.dart';
import 'package:cse_archive/app/widgets/web_page/web_page.dart';
import 'package:cse_archive/app/widgets/path.dart';
import 'package:cse_archive/app/widgets/gap.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'loading.dart';

class ProfessorsView extends StatelessWidget {
  final Map<String, String> parameters;

  const ProfessorsView({
    super.key,
    required this.parameters,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Change

    final controller = Get.find<ProfessorsController>();
    controller.setParameters(parameters);

    Widget getFiltersDialog(BuildContext context) {
      return ArchiveDialog(
        title: ArchiveStrings.filters,
        children: [
          expansionTileSearchBar(
            context: context,
            title: ArchiveStrings.professorsName,
            parameter: 'q',
            oldParameters: parameters,
            onSelectMainRoute: '/professors',
            searchBarController: controller.searchBarController,
          ),
          expansionTileRadioButton(
            context: context,
            title: ArchiveStrings.professorsDepartment,
            options: controller.departmentOptions,
            selectedOption: controller.selectedDepartment,
            onSelectMainRoute: '/professors',
            oldParameters: parameters,
            parameter: 'department',
          ),
        ],
      );
    }

    return ArchiveWebPage(
      body: controller.obx(
        (professors) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ArchivePath(
                  labels: const [
                    ArchiveStrings.home,
                    ArchiveStrings.professors,
                  ],
                  routes: const [
                    ArchiveRoutes.home,
                    ArchiveRoutes.professors,
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
              child: professorCardsBuilder(
                context: context,
                professors: professors!,
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
