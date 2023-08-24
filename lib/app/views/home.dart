import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/controllers/home.dart';
import 'package:cse_archive/app/extensions/responsive.dart';
import 'package:cse_archive/app/routes/routes.dart';
import 'package:cse_archive/app/utils/recording_cards_builder.dart';
import 'package:cse_archive/app/utils/reference_cards_builder.dart';
import 'package:cse_archive/app/utils/resource_cards_builder.dart';
import 'package:cse_archive/app/widgets/gap.dart';
import 'package:cse_archive/app/widgets/header.dart';
import 'package:cse_archive/app/widgets/web_page/web_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'loading.dart';

// TODO: Add recordings cards
class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (_) => ArchiveWebPage(
        applyPlatformConstraints: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: context.platform.maxWidth),
              padding:
                  EdgeInsets.symmetric(horizontal: context.platform.margin),
              child: ArchiveHeader(
                title: ArchiveStrings.homeLatestResources,
                seeAllOnPressed: () => context.go(ArchiveRoutes.resources),
              ),
            ),
            resourceCardsBuilder(
              context: context,
              resources: controller.resources,
              infiniteWidth: true,
            ),
            const Gap.vertical(2 * kSizeDefault),
            Container(
              constraints: BoxConstraints(maxWidth: context.platform.maxWidth),
              padding:
                  EdgeInsets.symmetric(horizontal: context.platform.margin),
              child: ArchiveHeader(
                title: ArchiveStrings.homeLatestRecordings,
                seeAllOnPressed: () => context.go(ArchiveRoutes.recordings),
              ),
            ),
            recordingCardsBuilder(
              context: context,
              recordings: controller.recordings,
              infiniteWidth: true,
            ),
            const Gap.vertical(2 * kSizeDefault),
            Container(
              constraints: BoxConstraints(maxWidth: context.platform.maxWidth),
              padding:
                  EdgeInsets.symmetric(horizontal: context.platform.margin),
              child: ArchiveHeader(
                title: ArchiveStrings.homeLatestReferences,
                seeAllOnPressed: () => context.go(ArchiveRoutes.references),
              ),
            ),
            referenceCardsBuilder(
              context: context,
              references: controller.references,
              infiniteWidth: true,
            ),
          ],
        ),
      ),
      onLoading: const LoadingView(),
    );
  }
}
