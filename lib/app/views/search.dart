import 'package:cse_archive/app/constants.dart';
import 'package:cse_archive/app/controllers/search.dart';
import 'package:cse_archive/app/models/course.dart';
import 'package:cse_archive/app/models/reference.dart';
import 'package:cse_archive/app/models/teacher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'general/basic_web_page.dart';
import 'general/course_cards_builder.dart';
import 'general/helpers.dart';
import 'general/reference_cards_builder.dart';
import 'general/teacher_cards_builder.dart';
import 'general/title_heading.dart';
import 'loading.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final query = Get.parameters['q'] ?? '';

    final controller = Get.put(SearchVController(query));
    controller.setParameters({'q': query});

    return basicWebPage(
      context: context,
      body: controller.obx(
        (results) => (results!['courses']!.isEmpty &&
                results['references']!.isEmpty &&
                results['teachers']!.isEmpty)
            ? Column(
                children: [
                  notFoundSVGBuilder(context),
                  Text(
                    '404'.tr,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 1.5 * kSizeDefault),
                  // if (results!['resources']!.isNotEmpty)
                  //   TitleHeading(
                  //     title: 'resources'.tr,
                  //     seeAllOnPressed: () => Get.toNamed(
                  //       Uri(
                  //         path: '/resources',
                  //         queryParameters: {'q': query},
                  //       ).toString(),
                  //     ),
                  //   ),
                  // if (results['resources']!.isNotEmpty)
                  //   resourceCardsBuilder(
                  //     resources: results['resources'] as List<ResourceModel>,
                  //   ),
                  // if (results['resources']!.isNotEmpty)
                  //   const SizedBox(height: 2 * kSizeDefault),
                  if (results['courses']!.isNotEmpty)
                    TitleHeading(
                      title: 'courses'.tr,
                      seeAllOnPressed: () => Get.toNamed(
                        Uri(
                          path: '/courses',
                          queryParameters: {'q': query},
                        ).toString(),
                      ),
                    ),
                  if (results['courses']!.isNotEmpty)
                    courseCardsBuilder(
                      context: context,
                      courses: results['courses'] as List<CourseModel>,
                    ),
                  if (results['courses']!.isNotEmpty)
                    const SizedBox(height: 2 * kSizeDefault),
                  if (results['references']!.isNotEmpty)
                    TitleHeading(
                      title: 'references'.tr,
                      seeAllOnPressed: () => Get.toNamed(
                        Uri(
                          path: '/references',
                          queryParameters: {'q': query},
                        ).toString(),
                      ),
                    ),
                  if (results['references']!.isNotEmpty)
                    referenceCardsBuilder(
                      context: context,
                      references: results['references'] as List<ReferenceModel>,
                    ),
                  if (results['references']!.isNotEmpty)
                    const SizedBox(height: 2 * kSizeDefault),
                  if (results['teachers']!.isNotEmpty)
                    TitleHeading(
                      title: 'teachers'.tr,
                      seeAllOnPressed: () => Get.toNamed(
                        Uri(
                          path: '/teachers',
                          queryParameters: {'q': query},
                        ).toString(),
                      ),
                    ),
                  if (results['teachers']!.isNotEmpty)
                    teacherCardsBuilder(
                      context: context,
                      teachers: results['teachers'] as List<TeacherModel>,
                    ),
                  if (results['teachers']!.isNotEmpty)
                    const SizedBox(height: 2 * kSizeDefault),
                ],
              ),
        onLoading: const LoadingView(),
      ),
    );
  }
}
