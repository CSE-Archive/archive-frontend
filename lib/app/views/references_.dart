import 'package:cse_archive/app/constants.dart';
import 'package:cse_archive/app/controllers/references.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'general/basic_web_page.dart';
import 'general/divider_builder.dart';
import 'general/expansion_search_builder.dart';
import 'general/path_builder.dart';
import 'general/reference_cards_builder.dart';
import 'loading.dart';

class ReferencesView extends StatelessWidget {
  const ReferencesView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ReferencesController>();
    controller.setParameters(Get.parameters as Map<String, String>);

    return basicWebPage(
      context: context,
      body: controller.obx(
        (references) => Column(
          children: [
            pathBuilder(
              context,
              roots: {
                'home'.tr: () => Get.toNamed('/'),
                'references'.tr: () => Get.toNamed('/references'),
              },
            ),
            const SizedBox(height: kSizeDefault),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 18 * kSizeDefault,
                    maxWidth: 18 * kSizeDefault,
                    minHeight:
                        MediaQuery.of(context).size.height - 9.5 * kSizeDefault,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(kSizeDefault),
                    ),
                    padding: const EdgeInsets.all(kSizeDefault),
                    child: Obx(
                      () => Column(
                        key: ValueKey(controller.selectedExpansionTile.value),
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'filters'.tr,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 2 * kSizeDefault),
                          expansionSearchBuilder(
                            key: 1,
                            context: context,
                            title: 'referencesTitleAuthor'.tr,
                            selectedExpansionTile:
                                controller.selectedExpansionTile,
                            parameter: 'q',
                            oldParameters:
                                Get.parameters as Map<String, String>,
                            onSelectMainRoute: '/references',
                            searchBarController: controller.searchBarController,
                          ),
                          dividerBuilder(context),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 2 * kSizeDefault),
                Expanded(
                  child: SizedBox(
                    height:
                        MediaQuery.of(context).size.height - 9.5 * kSizeDefault,
                    child: SingleChildScrollView(
                      child: referenceCardsBuilder(
                        context: context,
                        references: references!,
                        wrap: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        onLoading: const LoadingView(),
      ),
    );
  }
}
