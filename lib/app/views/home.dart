import 'package:cse_archive/app/constants.dart';
import 'package:cse_archive/app/controllers/home/reference_cards_controller.dart';
import 'package:cse_archive/app/controllers/home/resource_cards_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'general/basic_web_page.dart';
import 'general/reference_cards_builder.dart';
import 'general/resource_cards_builder.dart';
import 'general/title_heading.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final resourceCardsController = Get.find<ResourceCardsController>();
    final referenceCardsController = Get.find<ReferenceCardsController>();

    return basicWebPage(
      context: context,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 1.5 * kSizeDefault),
          TitleHeading(
            title: 'newResources'.tr,
            seeAllOnPressed: () => Get.toNamed('/resources'),
          ),
          resourceCardsBuilder(
            context: context,
            resources: resourceCardsController.resources,
          ),
          const SizedBox(height: 2 * kSizeDefault),
          TitleHeading(
            title: 'newReferences'.tr,
            seeAllOnPressed: () => Get.toNamed('/references'),
          ),
          referenceCardsBuilder(
            context: context,
            references: referenceCardsController.references,
          ),
        ],
      ),
    );
  }
}
