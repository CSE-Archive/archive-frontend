import 'package:cse_archive/constants.dart';
import 'package:cse_archive/controllers/courses/courses_controller.dart';
import 'package:cse_archive/views/general/basic_web_page.dart';
import 'package:cse_archive/views/general/course_cards_builder.dart';
import 'package:cse_archive/views/general/divider_builder.dart';
import 'package:cse_archive/views/general/expansion_radio_button_builder.dart';
import 'package:cse_archive/views/general/expansion_search_builder.dart';
import 'package:cse_archive/views/general/path_builder.dart';
import 'package:cse_archive/views/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoursesView extends StatelessWidget {
  const CoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CoursesController>();
    controller.setParameters(Get.parameters as Map<String, String>);

    return basicWebPage(
      context: context,
      body: controller.obx(
        (courses) => Column(
          children: [
            pathBuilder(
              context,
              roots: {
                'home'.tr: () => Get.toNamed('/'),
                'courses'.tr: () => Get.toNamed('/courses'),
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
                            title: 'coursesTitle'.tr,
                            selectedExpansionTile:
                                controller.selectedExpansionTile,
                            parameter: 'q',
                            oldParameters:
                                Get.parameters as Map<String, String>,
                            onSelectMainRoute: '/courses',
                            searchBarController: controller.searchBarController,
                          ),
                          dividerBuilder(context),
                          expansionRadioButtonBuilder(
                            key: 2,
                            context: context,
                            title: 'coursesType'.tr,
                            options: controller.typeOptions,
                            selectedOption: controller.selectedType,
                            onSelectMainRoute: '/courses',
                            oldParameters:
                                Get.parameters as Map<String, String>,
                            parameter: 'type',
                            selectedExpansionTile:
                                controller.selectedExpansionTile,
                          ),
                          dividerBuilder(context),
                          expansionRadioButtonBuilder(
                            key: 3,
                            context: context,
                            title: 'coursesUnits'.tr,
                            options: controller.unitsOptions,
                            selectedOption: controller.selectedUnits,
                            onSelectMainRoute: '/courses',
                            oldParameters:
                                Get.parameters as Map<String, String>,
                            parameter: 'units',
                            selectedExpansionTile:
                                controller.selectedExpansionTile,
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
                      child: courseCardsBuilder(
                        context: context,
                        courses: courses!,
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
