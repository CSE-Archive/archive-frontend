import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/controllers/recordings.dart';
import 'package:cse_archive/app/routes/routes.dart';
import 'package:cse_archive/app/utils/recording_cards_builder.dart';
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

class RecordingsView extends GetView<RecordingsController> {
  const RecordingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (_) => ArchiveWebPage(
        onRefresh: controller.fetchData,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ArchivePath(
              labels: const [
                ArchiveStrings.home,
                ArchiveStrings.recordings,
              ],
              routes: const [
                ArchiveRoutes.home,
                ArchiveRoutes.recordings,
              ],
            ),
            const Gap.vertical(1.5 * kSizeDefault),
            controller.recordings.isEmpty
                ? Center(
                    child: ArchiveError(
                      type: ArchiveErrorType.notFound,
                      title: ArchiveStrings.filtersNotFoundTitle,
                      description: ArchiveStrings.filtersNotFoundDescription,
                      button: OutlinedButton(
                        onPressed: () => context.go(ArchiveRoutes.recordings),
                        child: const Text(ArchiveStrings.filtersNotFoundButton),
                      ),
                    ),
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Obx(
                        () => recordingCardsBuilder(
                          context: context,
                          recordings: controller.recordings,
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
