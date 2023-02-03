import 'package:cse_archive/constants.dart';
import 'package:cse_archive/controllers/teachers/teachers_controller.dart';
import 'package:cse_archive/views/general/basic_web_page.dart';
import 'package:cse_archive/views/general/divider_builder.dart';
import 'package:cse_archive/views/general/expansion_radio_button_builder.dart';
import 'package:cse_archive/views/general/expansion_search_builder.dart';
import 'package:cse_archive/views/general/path_builder.dart';
import 'package:cse_archive/views/general/teacher_cards_builder.dart';
import 'package:cse_archive/views/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeachersView extends StatelessWidget {
  const TeachersView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<TeachersController>();
    controller.setParameters(Get.parameters as Map<String, String>);

    return basicWebPage(
      context: context,
      body: controller.obx(
        (teachers) => Column(
          children: [
            pathBuilder(
              context,
              roots: {
                'home'.tr: () => Get.toNamed('/'),
                'teachers'.tr: () => Get.toNamed('/teachers'),
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
                    child: Column(
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
                          title: 'teachersName'.tr,
                          selectedExpansionTile:
                              controller.selectedExpansionTile,
                          parameter: 'q',
                          oldParameters: Get.parameters as Map<String, String>,
                          onSelectMainRoute: '/teachers',
                          searchBarController: controller.searchBarController,
                        ),
                        dividerBuilder(context),
                        expansionRadioButtonBuilder(
                          key: 2,
                          context: context,
                          title: 'teachersDepartment'.tr,
                          options: controller.departmentOptions,
                          selectedOption: controller.selectedDepartment,
                          onSelectMainRoute: '/teachers',
                          oldParameters: Get.parameters as Map<String, String>,
                          parameter: 'department',
                          selectedExpansionTile:
                              controller.selectedExpansionTile,
                        ),
                        dividerBuilder(context),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 2 * kSizeDefault),
                Expanded(
                  child: SizedBox(
                    height:
                        MediaQuery.of(context).size.height - 9.5 * kSizeDefault,
                    child: SingleChildScrollView(
                      child: teacherCardsBuilder(
                        context: context,
                        teachers: teachers!,
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
