import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/controllers/course.dart';
import 'package:cse_archive/app/extensions/color_scheme.dart';
import 'package:cse_archive/app/extensions/responsive.dart';
import 'package:cse_archive/app/extensions/text_theme.dart';
import 'package:cse_archive/app/routes/routes.dart';
import 'package:cse_archive/app/utils/en_to_fa_digits.dart';
import 'package:cse_archive/app/utils/professor_cards_builder.dart';
import 'package:cse_archive/app/utils/reference_cards_builder.dart';
import 'package:cse_archive/app/views/course/components/relations_tab_bar.dart';
import 'package:cse_archive/app/widgets/label.dart';
import 'package:cse_archive/app/widgets/path.dart';
import 'package:cse_archive/app/widgets/header.dart';
import 'package:cse_archive/app/views/loading.dart';
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
        final course = controller.course!;

        final unitsLabel = ArchiveLabel(
          title: ArchiveStrings.courseUnits,
          value: enToFaDigits(course.units.representation),
        );

        final typeLabel = ArchiveLabel(
          title: ArchiveStrings.courseType,
          value: course.type.representation,
        );

        final titleColumn = Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectableText(
              course.title,
              style: context.headlineMedium.copyWith(
                fontWeight: FontWeight.bold,
                color: context.primaryColor,
              ),
            ),
            if (course.titleEn != null) ...[
              const Gap.vertical(kSizeDefault / 4),
              SelectableText(
                course.titleEn!,
                style: context.bodyLarge.copyWith(
                  color: context.primaryColor,
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
                    course.title,
                  ],
                  routes: [
                    ArchiveRoutes.home,
                    ArchiveRoutes.courses,
                    '${ArchiveRoutes.courses}/${course.uuid}',
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
                    color: context.secondaryColor,
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
                      if (course.description != null) ...[
                        const Gap.vertical(kSizeDefault),
                        SelectableText(
                          course.description!,
                          style: context.bodyMedium.copyWith(
                            color: context.primaryColor.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              if (course.preRequisites.isNotEmpty ||
                  course.coRequisites.isNotEmpty ||
                  course.incompatibles.isNotEmpty ||
                  course.requisiteFor.isNotEmpty) ...[
                const Gap.vertical(2 * kSizeDefault),
                RelationsTabBar(
                  labels: [
                    if (course.preRequisites.isNotEmpty)
                      ArchiveStrings.coursePreRequisites,
                    if (course.coRequisites.isNotEmpty)
                      ArchiveStrings.courseCoRequisites,
                    if (course.incompatibles.isNotEmpty)
                      ArchiveStrings.courseIncompatibles,
                    if (course.requisiteFor.isNotEmpty)
                      ArchiveStrings.courseRequisiteFor,
                  ],
                  listOfCourses: [
                    if (course.preRequisites.isNotEmpty) course.preRequisites,
                    if (course.coRequisites.isNotEmpty) course.coRequisites,
                    if (course.incompatibles.isNotEmpty) course.incompatibles,
                    if (course.requisiteFor.isNotEmpty) course.requisiteFor,
                  ],
                ),
              ],
              if (course.references.isNotEmpty) ...[
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
                  references: course.references,
                  infiniteWidth: true,
                ),
              ],
              if (course.professors.isNotEmpty) ...[
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
                  professors: course.professors,
                  infiniteWidth: true,
                ),
              ],
              if (course.classrooms.isNotEmpty &&
                  course.classrooms.any(
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
                    children: course.classrooms
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
              if (course.classrooms.isNotEmpty &&
                  course.classrooms.any(
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
                    children: course.classrooms
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
