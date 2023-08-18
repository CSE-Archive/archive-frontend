import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/controllers/resources.dart';
import 'package:cse_archive/app/routes/routes.dart';
import 'package:cse_archive/app/utils/resource_cards_builder.dart';
import 'package:cse_archive/app/widgets/gap.dart';
import 'package:cse_archive/app/widgets/path.dart';
import 'package:cse_archive/app/widgets/web_page/web_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'loading.dart';

class ResourcesView extends GetView<ResourcesController> {
  const ResourcesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ArchiveWebPage(
      body: controller.obx(
        (_) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            const Gap.vertical(1.5 * kSizeDefault),
            SizedBox(
              height: MediaQuery.of(context).size.height - 9.5 * kSizeDefault,
              child: SingleChildScrollView(
                child: resourceCardsBuilder(
                  context: context,
                  resources: controller.resources,
                  infiniteWidth: false,
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
