import 'package:cse_archive/constants.dart';
import 'package:cse_archive/controllers/resources/resources_controller.dart';
import 'package:cse_archive/views/general/basic_web_page.dart';
import 'package:cse_archive/views/general/path_builder.dart';
import 'package:cse_archive/views/general/resource_cards_builder.dart';
import 'package:cse_archive/views/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResourcesView extends StatelessWidget {
  const ResourcesView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ResourcesController>();

    return basicWebPage(
      context: context,
      body: controller.obx(
        (resources) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            pathBuilder(
              context,
              roots: {
                'home'.tr: () => Get.toNamed('/'),
                'resources'.tr: () => Get.toNamed('/resources'),
              },
            ),
            const SizedBox(height: kSizeDefault),
            SizedBox(
              height: MediaQuery.of(context).size.height - 9.5 * kSizeDefault,
              child: SingleChildScrollView(
                child: resourceCardsBuilder(
                  context: context,
                  resources: resources!,
                  wrap: true,
                ),
              ),
            ),
          ],
        ),
        onLoading: const LoadingView(),
      ),
    );
  }
}
