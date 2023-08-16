import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/controllers/home/reference_cards_controller.dart';
import 'package:cse_archive/app/controllers/home/resource_cards_controller.dart';
import 'package:cse_archive/app/extensions/responsive.dart';
import 'package:cse_archive/app/routes/routes.dart';
import 'package:cse_archive/app/utils/reference_cards_builder.dart';
import 'package:cse_archive/app/utils/resource_cards_builder.dart';
import 'package:cse_archive/app/widgets/gap.dart';
import 'package:cse_archive/app/widgets/header.dart';
import 'package:cse_archive/app/widgets/web_page/web_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final resourceCardsController = Get.find<ResourceCardsController>();
    final referenceCardsController = Get.find<ReferenceCardsController>();

    return ArchiveWebPage(
      applyPlatformConstraints: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: context.platform.maxWidth),
            padding: EdgeInsets.symmetric(horizontal: context.platform.margin),
            child: ArchiveHeader(
              title: ArchiveStrings.homeNewResources,
              seeAllOnPressed: () => context.go(ArchiveRoutes.resources),
            ),
          ),
          resourceCardsBuilder(
            context: context,
            resources: resourceCardsController.resources,
            infiniteWidth: true,
          ),
          const Gap.vertical(2 * kSizeDefault),
          Container(
            constraints: BoxConstraints(maxWidth: context.platform.maxWidth),
            padding: EdgeInsets.symmetric(horizontal: context.platform.margin),
            child: ArchiveHeader(
              title: ArchiveStrings.homeNewReferences,
              seeAllOnPressed: () => context.go(ArchiveRoutes.references),
            ),
          ),
          referenceCardsBuilder(
            context: context,
            references: referenceCardsController.references,
            infiniteWidth: true,
          ),
        ],
      ),
    );
  }
}
