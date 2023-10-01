import 'package:cse_archive/app/constants/icons.dart';
import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/controllers/resources.dart';
import 'package:cse_archive/app/extensions/color_scheme.dart';
import 'package:cse_archive/app/extensions/text_theme.dart';
import 'package:cse_archive/app/routes/routes.dart';
import 'package:cse_archive/app/utils/expansion_tile_radio_button.dart';
import 'package:cse_archive/app/utils/resource_cards_builder.dart';
import 'package:cse_archive/app/widgets/dialog.dart';
import 'package:cse_archive/app/widgets/error.dart';
import 'package:cse_archive/app/widgets/gap.dart';
import 'package:cse_archive/app/widgets/load_more_button.dart';
import 'package:cse_archive/app/widgets/path.dart';
import 'package:cse_archive/app/widgets/web_page/web_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'error.dart';
import 'loading.dart';

class ResourcesView extends GetView<ResourcesController> {
  final Map<String, String> queryParameters;

  const ResourcesView({
    super.key,
    required this.queryParameters,
  });

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (_) => ArchiveWebPage(
        onRefresh: controller.fetchData,
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
                    ArchiveStrings.resources,
                  ],
                  routes: const [
                    ArchiveRoutes.home,
                    ArchiveRoutes.resources,
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
                        style: context.bodyMedium.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Gap.horizontal(kSizeDefault / 2),
                      Icon(
                        ArchiveIcons.adjustmentsAlt,
                        color: context.secondaryColor,
                        size: kSizeDefault,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Gap.vertical(1.5 * kSizeDefault),
            controller.resources.isEmpty
                ? Center(
                    child: ArchiveError(
                      type: ArchiveErrorType.notFound,
                      title: ArchiveStrings.filtersNotFoundTitle,
                      description: ArchiveStrings.filtersNotFoundDescription,
                      button: OutlinedButton(
                        onPressed: () => context.go(ArchiveRoutes.resources),
                        child: const Text(ArchiveStrings.filtersNotFoundButton),
                      ),
                    ),
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Obx(
                        () => resourceCardsBuilder(
                          context: context,
                          resources: controller.resources,
                          infiniteWidth: false,
                        ),
                      ),
                      Obx(
                        () => controller.isThereMore.isTrue
                            ? Padding(
                                padding: const EdgeInsets.only(
                                  top: 1.5 * kSizeDefault,
                                ),
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
      onError: (_) => ErrorView(retryButtonOnPressed: controller.fetchData),
    );
  }
}

Widget _getFiltersDialog(
  BuildContext context, {
  required ResourcesController controller,
  required Map<String, String> queryParameters,
}) {
  return ArchiveDialog(
    title: ArchiveStrings.filters,
    children: [
      expansionTileRadioButton(
        context: context,
        title: ArchiveStrings.resourcesTypeFilter,
        queryParameters: queryParameters,
        queryParameter: ResourcesController.typeQueryParameter,
        options: ResourcesController.typeQueryOptions,
        defaultOption: ResourcesController.typeQueryDefault,
        selectedOption: controller.selectedType,
        effectiveRoute: ArchiveRoutes.resources,
      ),
    ],
  );
}
