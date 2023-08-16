import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/controllers/course.dart';
import 'package:cse_archive/app/extensions/responsive.dart';
import 'package:cse_archive/app/models/course.dart';
import 'package:cse_archive/app/routes/routes.dart';
import 'package:cse_archive/app/utils/course_cards_builder.dart';
import 'package:cse_archive/app/utils/en_to_fa_digits.dart';
import 'package:cse_archive/app/utils/professor_cards_builder.dart';
import 'package:cse_archive/app/utils/reference_cards_builder.dart';
import 'package:cse_archive/app/widgets/label.dart';
import 'package:cse_archive/app/widgets/path.dart';
import 'package:cse_archive/app/widgets/header.dart';
import 'package:cse_archive/app/views/loading.dart';
import 'package:cse_archive/app/widgets/divider.dart';
import 'package:cse_archive/app/widgets/gap.dart';
import 'package:cse_archive/app/widgets/web_page/web_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/expansion_tile.dart';

class CourseView extends StatelessWidget {
  const CourseView({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    // TODO: Change

    final controller = Get.put(
      CourseController(courseId: int.parse(id)),
      tag: id,
    );

    return ArchiveWebPage(
      applyPlatformConstraints: false,
      body: controller.obx(
        (data) {
          const preRequisiteValue = 1;
          const coRequisiteValue = 2;
          const requisiteForValue = 3;

          final hasPreRequisite = data!.requisites.entries
              .where((pair) => pair.value == RequisiteType.pre)
              .isNotEmpty;

          final hasCoRequisite = data.requisites.entries
              .where((pair) => pair.value == RequisiteType.co)
              .isNotEmpty;

          final hasRequisiteFor = data.requisiteFor.isNotEmpty;

          final activeRequisite = (hasPreRequisite
                  ? preRequisiteValue
                  : hasCoRequisite
                      ? coRequisiteValue
                      : requisiteForValue)
              .obs;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerRight,
                constraints:
                    BoxConstraints(maxWidth: context.platform.maxWidth),
                padding:
                    EdgeInsets.symmetric(horizontal: context.platform.margin),
                child: ArchivePath(
                  labels: [
                    ArchiveStrings.home,
                    ArchiveStrings.courses,
                    data.name,
                  ],
                  routes: [
                    ArchiveRoutes.home,
                    ArchiveRoutes.courses,
                    '${ArchiveRoutes.courses}/${data.id}',
                  ],
                ),
              ),
              const Gap.vertical(1.5 * kSizeDefault),
              Container(
                constraints:
                    BoxConstraints(maxWidth: context.platform.maxWidth),
                padding:
                    EdgeInsets.symmetric(horizontal: context.platform.margin),
                child: Container(
                  padding: const EdgeInsets.all(kSizeDefault),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(kSizeDefault),
                  ),
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
                                SelectableText(
                                  data.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                ),
                                SelectableText(
                                  data.nameEn!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          ArchiveLabel(
                            title: ArchiveStrings.courseUnits,
                            value: enToFaDigits(data.units.toString()),
                          ),
                          const Gap.horizontal(kSizeDefault),
                          ArchiveLabel(
                            title: ArchiveStrings.courseType,
                            value: data.type.toString(),
                          ),
                        ],
                      ),
                      if (data.description?.isNotEmpty ?? false) ...[
                        const Gap.vertical(kSizeDefault),
                        SelectableText(
                          data.description!,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withOpacity(0.8),
                                  ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              if (hasPreRequisite || hasCoRequisite || hasRequisiteFor) ...[
                const Gap.vertical(2 * kSizeDefault),
                Container(
                  constraints:
                      BoxConstraints(maxWidth: context.platform.maxWidth),
                  padding:
                      EdgeInsets.symmetric(horizontal: context.platform.margin),
                  child: Row(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (hasPreRequisite) ...[
                              TextButton(
                                onPressed: () =>
                                    activeRequisite.value = preRequisiteValue,
                                child: Obx(
                                  () => AnimatedDefaultTextStyle(
                                    duration: 100.milliseconds,
                                    style: ArchiveHeader.textStyle(context)
                                        .copyWith(
                                      color: activeRequisite.value ==
                                              preRequisiteValue
                                          ? null
                                          : Theme.of(context)
                                              .colorScheme
                                              .secondary
                                              .withOpacity(0.5),
                                      fontWeight: activeRequisite.value ==
                                              preRequisiteValue
                                          ? null
                                          : FontWeight.w400,
                                    ),
                                    child: const Text(
                                      ArchiveStrings.coursePreRequisites,
                                    ),
                                  ),
                                ),
                              ),
                              const Gap.horizontal(kSizeDefault),
                            ],
                            if (hasCoRequisite) ...[
                              TextButton(
                                onPressed: () =>
                                    activeRequisite.value = coRequisiteValue,
                                child: Obx(
                                  () => AnimatedDefaultTextStyle(
                                    duration: 100.milliseconds,
                                    style: ArchiveHeader.textStyle(context)
                                        .copyWith(
                                      color: activeRequisite.value ==
                                              coRequisiteValue
                                          ? null
                                          : Theme.of(context)
                                              .colorScheme
                                              .secondary
                                              .withOpacity(0.5),
                                      fontWeight: activeRequisite.value ==
                                              coRequisiteValue
                                          ? null
                                          : FontWeight.w400,
                                    ),
                                    child: const Text(
                                      ArchiveStrings.courseCoRequisites,
                                    ),
                                  ),
                                ),
                              ),
                              const Gap.horizontal(kSizeDefault),
                            ],
                            if (hasRequisiteFor) ...[
                              TextButton(
                                onPressed: () =>
                                    activeRequisite.value = requisiteForValue,
                                child: Obx(
                                  () => AnimatedDefaultTextStyle(
                                    duration: 100.milliseconds,
                                    style: ArchiveHeader.textStyle(context)
                                        .copyWith(
                                      color: activeRequisite.value ==
                                              requisiteForValue
                                          ? null
                                          : Theme.of(context)
                                              .colorScheme
                                              .secondary
                                              .withOpacity(0.5),
                                      fontWeight: activeRequisite.value ==
                                              requisiteForValue
                                          ? null
                                          : FontWeight.w400,
                                    ),
                                    child: const Text(
                                      ArchiveStrings.courseRequisiteFor,
                                    ),
                                  ),
                                ),
                              ),
                              const Gap.horizontal(kSizeDefault),
                            ],
                          ],
                        ),
                      ),
                      Expanded(
                        child: ArchiveDivider(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap.vertical(ArchiveHeader.bottomPadding),
                Obx(
                  () => activeRequisite.value == preRequisiteValue
                      ? courseCardsBuilder(
                          context: context,
                          infiniteWidth: true,
                          courses: data.requisites.entries
                              .where((pair) => pair.value == RequisiteType.pre)
                              .toList()
                              .map((pair) => pair.key)
                              .toList(),
                        )
                      : activeRequisite.value == coRequisiteValue
                          ? courseCardsBuilder(
                              context: context,
                              infiniteWidth: true,
                              courses: data.requisites.entries
                                  .where(
                                      (pair) => pair.value == RequisiteType.co)
                                  .toList()
                                  .map((pair) => pair.key)
                                  .toList(),
                            )
                          : courseCardsBuilder(
                              context: context,
                              courses: data.requisiteFor,
                              infiniteWidth: true,
                            ),
                ),
              ],
              if (data.references.isNotEmpty) ...[
                const Gap.vertical(2 * kSizeDefault),
                Container(
                  constraints:
                      BoxConstraints(maxWidth: context.platform.maxWidth),
                  padding:
                      EdgeInsets.symmetric(horizontal: context.platform.margin),
                  child: const ArchiveHeader(
                    title: ArchiveStrings.courseReferences,
                  ),
                ),
                referenceCardsBuilder(
                  context: context,
                  references: data.references,
                  infiniteWidth: true,
                ),
              ],
              if (data.professors.isNotEmpty) ...[
                const Gap.vertical(2 * kSizeDefault),
                Container(
                  constraints:
                      BoxConstraints(maxWidth: context.platform.maxWidth),
                  padding:
                      EdgeInsets.symmetric(horizontal: context.platform.margin),
                  child: const ArchiveHeader(
                    title: ArchiveStrings.courseProfessors,
                  ),
                ),
                professorCardsBuilder(
                  context: context,
                  professors: data.professors,
                  infiniteWidth: true,
                ),
              ],
              if (data.resources.isNotEmpty) ...[
                const Gap.vertical(2 * kSizeDefault),
                Container(
                  constraints:
                      BoxConstraints(maxWidth: context.platform.maxWidth),
                  padding:
                      EdgeInsets.symmetric(horizontal: context.platform.margin),
                  child: const ArchiveHeader(
                    title: ArchiveStrings.courseResources,
                  ),
                ),
                Container(
                  constraints:
                      BoxConstraints(maxWidth: context.platform.maxWidth),
                  padding:
                      EdgeInsets.symmetric(horizontal: context.platform.margin),
                  child: Column(
                    children: data.resources.map(
                      (e) {
                        List<String> files = e['files'];

                        return CourseExpansionTile(
                          title: e['semester'],
                          subtitle: e['professor'],
                          downloadables: files,
                          tas: e['tas'],
                        );
                      },
                    ).toList(),
                  ),
                ),
              ],
              if (data.records.isNotEmpty) ...[
                const Gap.vertical(2 * kSizeDefault),
                Container(
                  constraints:
                      BoxConstraints(maxWidth: context.platform.maxWidth),
                  padding:
                      EdgeInsets.symmetric(horizontal: context.platform.margin),
                  child:
                      const ArchiveHeader(title: ArchiveStrings.courseRecords),
                ),
                Container(
                  constraints:
                      BoxConstraints(maxWidth: context.platform.maxWidth),
                  padding:
                      EdgeInsets.symmetric(horizontal: context.platform.margin),
                  child: Column(
                    children: data.records.map(
                      (e) {
                        List<String> files = e['files'];

                        return CourseExpansionTile(
                          title: e['semester'],
                          subtitle: e['professor'],
                          downloadables: files,
                        );
                      },
                    ).toList(),
                  ),
                ),
              ],
            ],
          );
        },
        onLoading: const LoadingView(),
      ),
    );
  }
}
