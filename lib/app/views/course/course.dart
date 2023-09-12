import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/controllers/course.dart';
import 'package:cse_archive/app/extensions/responsive.dart';
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

class CourseView extends GetView<CourseController> {
  final String uuid;

  const CourseView({
    super.key,
    required this.uuid,
  });

  @override
  String? get tag => uuid;

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (_) {
        const preRequisiteValue = 1;
        const coRequisiteValue = 2;
        const requisiteForValue = 3;

        final activeRequisite = (controller.course!.preRequisites.isNotEmpty
                ? preRequisiteValue
                : controller.course!.coRequisites.isNotEmpty
                    ? coRequisiteValue
                    : requisiteForValue)
            .obs;

        final unitsLabel = ArchiveLabel(
          title: ArchiveStrings.courseUnits,
          value: enToFaDigits(
            controller.course!.units.representation,
          ),
        );

        final typeLabel = ArchiveLabel(
          title: ArchiveStrings.courseType,
          value: controller.course!.type.representation,
        );

        final titleColumn = Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectableText(
              controller.course!.title,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            if (controller.course!.titleEn != null) ...[
              const Gap.vertical(kSizeDefault / 4),
              SelectableText(
                controller.course!.titleEn!,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ],
          ],
        );

        return ArchiveWebPage(
          applyPlatformConstraints: false,
          body: Column(
            mainAxisSize: MainAxisSize.min,
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
                    controller.course!.title,
                  ],
                  routes: [
                    ArchiveRoutes.home,
                    ArchiveRoutes.courses,
                    '${ArchiveRoutes.courses}/${controller.course!.uuid}',
                  ],
                ),
              ),
              const Gap.vertical(1.5 * kSizeDefault),
              Container(
                width: double.infinity,
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
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      context.responsiveBuilder(
                        mobile: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            titleColumn,
                            const Gap.vertical(kSizeDefault),
                            Wrap(
                              alignment: WrapAlignment.start,
                              spacing: kSizeDefault,
                              runSpacing: kSizeDefault,
                              children: [
                                unitsLabel,
                                typeLabel,
                              ],
                            ),
                          ],
                        ),
                        desktop: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: titleColumn),
                            const Gap.horizontal(kSizeDefault),
                            unitsLabel,
                            const Gap.horizontal(kSizeDefault),
                            typeLabel,
                          ],
                        ),
                      ),
                      if (controller.course!.description != null) ...[
                        const Gap.vertical(kSizeDefault),
                        SelectableText(
                          controller.course!.description!,
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
              if (controller.course!.preRequisites.isNotEmpty ||
                  controller.course!.coRequisites.isNotEmpty ||
                  controller.course!.requisiteFor.isNotEmpty) ...[
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
                            if (controller
                                .course!.preRequisites.isNotEmpty) ...[
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
                            if (controller.course!.coRequisites.isNotEmpty) ...[
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
                            if (controller.course!.requisiteFor.isNotEmpty) ...[
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
                          courses: controller.course!.preRequisites,
                          infiniteWidth: true,
                        )
                      : activeRequisite.value == coRequisiteValue
                          ? courseCardsBuilder(
                              context: context,
                              courses: controller.course!.coRequisites,
                              infiniteWidth: true,
                            )
                          : courseCardsBuilder(
                              context: context,
                              courses: controller.course!.requisiteFor,
                              infiniteWidth: true,
                            ),
                ),
              ],
              if (controller.course!.references.isNotEmpty) ...[
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
                  references: controller.course!.references,
                  infiniteWidth: true,
                ),
              ],
              if (controller.course!.professors.isNotEmpty) ...[
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
                  professors: controller.course!.professors,
                  infiniteWidth: true,
                ),
              ],
              if (controller.course!.classrooms.isNotEmpty &&
                  controller.course!.classrooms.any(
                    (classroom) => classroom.resources.isNotEmpty,
                  )) ...[
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
                    children: controller.course!.classrooms
                        .map(
                          (classroom) => classroom.resources.isEmpty
                              ? Gap.zero
                              : CourseExpansionTile(
                                  resources: classroom.resources,
                                  year: classroom.year,
                                  semester: classroom.semester,
                                  professors: classroom.professors,
                                  tas: classroom.tas,
                                ),
                        )
                        .toList(),
                  ),
                ),
              ],
              if (controller.course!.classrooms.isNotEmpty &&
                  controller.course!.classrooms.any(
                    (classroom) => classroom.recordings != null,
                  )) ...[
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
                    children: controller.course!.classrooms
                        .map(
                          (classroom) => classroom.recordings == null
                              ? Gap.zero
                              : CourseExpansionTile(
                                  recordings: classroom.recordings,
                                  year: classroom.year,
                                  semester: classroom.semester,
                                  professors: classroom.professors,
                                ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ],
          ),
        );
      },
      onLoading: const LoadingView(),
    );
  }
}
