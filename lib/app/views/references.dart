import 'package:cse_archive/app/constants/icons.dart';
import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/controllers/references.dart';
import 'package:cse_archive/app/extensions/color_scheme.dart';
import 'package:cse_archive/app/extensions/text_theme.dart';
import 'package:cse_archive/app/routes/routes.dart';
import 'package:cse_archive/app/utils/expansion_tile_radio_button.dart';
import 'package:cse_archive/app/utils/expansion_tile_search_box.dart';
import 'package:cse_archive/app/utils/reference_cards_builder.dart';
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

class ReferencesView extends GetView<ReferencesController> {
  final Map<String, String> queryParameters;

  const ReferencesView({
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
                    ArchiveStrings.references,
                  ],
                  routes: const [
                    ArchiveRoutes.home,
                    ArchiveRoutes.references,
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
            controller.references.isEmpty
                ? Center(
                    child: ArchiveError(
                      type: ArchiveErrorType.notFound,
                      title: ArchiveStrings.filtersNotFoundTitle,
                      description: ArchiveStrings.filtersNotFoundDescription,
                      button: OutlinedButton(
                        onPressed: () => context.go(ArchiveRoutes.references),
                        child: const Text(ArchiveStrings.filtersNotFoundButton),
                      ),
                    ),
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Obx(
                        () => referenceCardsBuilder(
                          context: context,
                          references: controller.references,
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
  required ReferencesController controller,
  required Map<String, String> queryParameters,
}) {
  return ArchiveDialog(
    title: ArchiveStrings.filters,
    children: [
      expansionTileSearchBox(
        context: context,
        title: ArchiveStrings.referencesTitleAuthorFilter,
        queryParameters: queryParameters,
        queryParameter: ReferencesController.searchQueryParameter,
        searchController: controller.searchController,
        searchControllerEmpty: controller.searchControllerEmpty,
        effectiveRoute: ArchiveRoutes.references,
      ),
      expansionTileRadioButton(
        context: context,
        title: ArchiveStrings.referencesTypeFilter,
        queryParameters: queryParameters,
        queryParameter: ReferencesController.typeQueryParameter,
        options: ReferencesController.typeQueryOptions,
        defaultOption: ReferencesController.typeQueryDefault,
        selectedOption: controller.selectedType,
        effectiveRoute: ArchiveRoutes.references,
      ),
    ],
  );
}
