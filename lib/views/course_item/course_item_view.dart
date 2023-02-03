import 'package:cse_archive/constants.dart';
import 'package:cse_archive/controllers/course_item/course_item_controller.dart';
import 'package:cse_archive/models/general.dart';
import 'package:cse_archive/views/general/basic_web_page.dart';
import 'package:cse_archive/views/general/course_cards_builder.dart';
import 'package:cse_archive/views/general/expansiontile_builder.dart';
import 'package:cse_archive/views/general/helpers.dart';
import 'package:cse_archive/views/general/path_builder.dart';
import 'package:cse_archive/views/general/reference_cards_builder.dart';
import 'package:cse_archive/views/general/title_heading.dart';
import 'package:cse_archive/views/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseItemView extends StatelessWidget {
  const CourseItemView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final id = Get.parameters["id"];
    final controller = Get.put(
      CourseItemController(courseId: int.parse(id!)),
      tag: id,
    );

    return basicWebPage(
      context: context,
      body: controller.obx(
        (data) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            pathBuilder(
              context,
              roots: {
                'home'.tr: () => Get.toNamed('/'),
                'courses'.tr: () => Get.toNamed('/courses'),
                data!.name: () =>
                    Get.toNamed('/courses/${data.id}/${data.slug}'),
              },
            ),
            const SizedBox(height: kSizeDefault),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(kSizeDefault),
              ),
              padding: const EdgeInsets.all(kSizeDefault),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withOpacity(0.8),
                                  ),
                            ),
                            Text(
                              data.nameEn,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(kSizeDefault / 2),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(kSizeDefault / 2),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'courseItemUnits'.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                            ),
                            const SizedBox(width: kSizeDefault / 2),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: kSizeDefault / 2,
                                vertical: kSizeDefault / 4,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                borderRadius:
                                    BorderRadius.circular(kSizeDefault / 4),
                              ),
                              child: Text(
                                replaceEnWithFaDigits(data.units.toString()),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: kSizeDefault / 2),
                      Container(
                        padding: const EdgeInsets.all(kSizeDefault / 2),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(kSizeDefault / 2),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'courseItemType'.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                            ),
                            const SizedBox(width: kSizeDefault / 2),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: kSizeDefault / 2,
                                vertical: kSizeDefault / 4,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                borderRadius:
                                    BorderRadius.circular(kSizeDefault / 4),
                              ),
                              child: Text(
                                courseTypeToString(data.type),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (data.description.isNotEmpty)
                    const SizedBox(height: kSizeDefault),
                  if (data.description.isNotEmpty)
                    Text(
                      data.description,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.8),
                          ),
                    ),
                ],
              ),
            ),
            if (data.requisites.entries
                    .where((pair) => pair.value == RequisiteType.pre)
                    .isNotEmpty ||
                data.requisites.entries
                    .where((pair) => pair.value == RequisiteType.co)
                    .isNotEmpty ||
                data.requisiteFor.isNotEmpty)
              const SizedBox(height: 2 * kSizeDefault),
            if (data.requisites.entries
                    .where((pair) => pair.value == RequisiteType.pre)
                    .isNotEmpty ||
                data.requisites.entries
                    .where((pair) => pair.value == RequisiteType.co)
                    .isNotEmpty ||
                data.requisiteFor.isNotEmpty)
              DefaultTabController(
                animationDuration: Duration.zero,
                length: (data.requisites.entries
                            .where((pair) => pair.value == RequisiteType.pre)
                            .isNotEmpty
                        ? 1
                        : 0) +
                    (data.requisites.entries
                            .where((pair) => pair.value == RequisiteType.co)
                            .isNotEmpty
                        ? 1
                        : 0) +
                    (data.requisiteFor.isNotEmpty ? 1 : 0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        TabBar(
                          padding: EdgeInsets.zero,
                          isScrollable: true,
                          indicatorWeight: 0.1,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorColor: Colors.transparent,
                          indicatorPadding: EdgeInsets.zero,
                          labelPadding: const EdgeInsets.symmetric(
                            horizontal: kSizeDefault / 2,
                          ),
                          labelColor: Theme.of(context).colorScheme.secondary,
                          labelStyle:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                          unselectedLabelColor: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.4),
                          unselectedLabelStyle:
                              Theme.of(context).textTheme.titleLarge,
                          tabs: [
                            if (data.requisites.entries
                                .where(
                                    (pair) => pair.value == RequisiteType.pre)
                                .isNotEmpty)
                              Tab(text: 'courseItemPrerequisites'.tr),
                            if (data.requisites.entries
                                .where((pair) => pair.value == RequisiteType.co)
                                .isNotEmpty)
                              Tab(text: 'courseItemCorequisites'.tr),
                            if (data.requisiteFor.isNotEmpty)
                              Tab(text: 'courseItemRequisiteFor'.tr),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            width: double.infinity,
                            color: Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(0.5),
                            margin:
                                const EdgeInsets.only(right: kSizeDefault / 2),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: kSizeCourseCardHeight,
                      child: TabBarView(
                        children: [
                          if (data.requisites.entries
                              .where((pair) => pair.value == RequisiteType.pre)
                              .isNotEmpty)
                            courseCardsBuilder(
                              context: context,
                              courses: data.requisites.entries
                                  .where(
                                      (pair) => pair.value == RequisiteType.pre)
                                  .toList()
                                  .map((pair) => pair.key)
                                  .toList(),
                            ),
                          if (data.requisites.entries
                              .where((pair) => pair.value == RequisiteType.co)
                              .isNotEmpty)
                            courseCardsBuilder(
                              context: context,
                              courses: data.requisites.entries
                                  .where(
                                      (pair) => pair.value == RequisiteType.co)
                                  .toList()
                                  .map((pair) => pair.key)
                                  .toList(),
                            ),
                          if (data.requisiteFor.isNotEmpty)
                            courseCardsBuilder(
                              context: context,
                              courses: data.requisiteFor,
                              // icon: Center(
                              //   child: RichText(
                              //     text: TextSpan(
                              //       children: [
                              //         TextSpan(
                              //           text: 'A → ',
                              //           style: Theme.of(context)
                              //               .textTheme
                              //               .titleMedium!
                              //               .copyWith(
                              //                 color: Theme.of(context)
                              //                     .colorScheme
                              //                     .secondary
                              //                     .withOpacity(0.4),
                              //               ),
                              //         ),
                              //         TextSpan(
                              //           text: 'B',
                              //           style: Theme.of(context)
                              //               .textTheme
                              //               .titleMedium!
                              //               .copyWith(
                              //                 color: Theme.of(context)
                              //                     .colorScheme
                              //                     .secondary,
                              //               ),
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            if (data.references.isNotEmpty)
              const SizedBox(height: 2 * kSizeDefault),
            if (data.references.isNotEmpty)
              TitleHeading(title: 'courseItemRefernces'.tr),
            if (data.references.isNotEmpty)
              referenceCardsBuilder(
                context: context,
                references: data.references,
              ),
            if (data.resources.isNotEmpty)
              const SizedBox(height: 2 * kSizeDefault),
            if (data.resources.isNotEmpty)
              TitleHeading(title: 'courseItemResources'.tr),
            if (data.resources.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(
                  top: kSizeDefault,
                  left: kSizeDefault / 2,
                  right: kSizeDefault / 2,
                ),
                child: Column(
                  children: data.resources.map(
                    (e) {
                      List<String> files = e['files'];
                      return expansionTileBuilder(
                        context: context,
                        title: e['semester'],
                        subtitle: e['teacher'],
                        downloadables: files,
                        tas: e['tas'],
                      );
                    },
                  ).toList(),
                ),
              ),
            if (data.records.isNotEmpty)
              const SizedBox(height: 3 * kSizeDefault),
            if (data.records.isNotEmpty)
              TitleHeading(title: 'courseItemRecords'.tr),
            if (data.records.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(
                  top: kSizeDefault,
                  left: kSizeDefault / 2,
                  right: kSizeDefault / 2,
                ),
                child: Column(
                  children: data.records.map(
                    (e) {
                      List<String> files = e['files'];
                      return expansionTileBuilder(
                        context: context,
                        title: e['semester'],
                        subtitle: e['teacher'],
                        downloadables: files,
                      );
                    },
                  ).toList(),
                ),
              ),
          ],
        ),
        onLoading: const LoadingView(),
      ),
    );
  }
}
