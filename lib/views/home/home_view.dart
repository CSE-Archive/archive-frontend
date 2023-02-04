import 'package:cse_archive/constants.dart';
import 'package:cse_archive/controllers/home/reference_cards_controller.dart';
import 'package:cse_archive/controllers/home/resource_cards_controller.dart';
import 'package:cse_archive/views/general/basic_web_page.dart';
import 'package:cse_archive/views/general/reference_cards_builder.dart';
import 'package:cse_archive/views/general/resource_cards_builder.dart';
import 'package:cse_archive/views/general/title_heading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var resourceCardsController = Get.find<ResourceCardsController>();
    var referenceCardsController = Get.find<ReferenceCardsController>();

    return basicWebPage(
      context: context,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 1.5 * kSizeDefault),
          TitleHeading(
            title: 'newResources'.tr,
            seeAllOnPressed: (() {}),
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
