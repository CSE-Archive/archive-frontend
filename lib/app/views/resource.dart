import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/controllers/resource.dart';
import 'package:cse_archive/app/extensions/color_scheme.dart';
import 'package:cse_archive/app/extensions/responsive.dart';
import 'package:cse_archive/app/extensions/text_theme.dart';
import 'package:cse_archive/app/routes/routes.dart';
import 'package:cse_archive/app/utils/course_cards_builder.dart';
import 'package:cse_archive/app/utils/en_to_fa_digits.dart';
import 'package:cse_archive/app/utils/professor_cards_builder.dart';
import 'package:cse_archive/app/widgets/gap.dart';
import 'package:cse_archive/app/widgets/header.dart';
import 'package:cse_archive/app/widgets/label.dart';
import 'package:cse_archive/app/widgets/path.dart';
import 'package:cse_archive/app/widgets/web_page/web_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/link.dart';

import 'loading.dart';

class ResourceView extends GetView<ResourceController> {
  final String uuid;

  const ResourceView({
    super.key,
    required this.uuid,
  });

  @override
  String? get tag => uuid;

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (_) {
        final resource = controller.resource!;

        final typeLabel = ArchiveLabel(
          title: ArchiveStrings.resourceType,
          value: resource.type.representation,
        );

        final title =
            '${resource.title ?? resource.type.representation} ${resource.classroom!.course.title}';

        final semester = enToFaDigits(
          '${resource.classroom!.semester} ${resource.classroom!.year}',
        );

        final titleAndSemester = Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectableText(
              title,
              style: context.headlineMedium.copyWith(
                color: context.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap.vertical(kSizeDefault / 4),
            SelectableText(
              semester,
              style: context.bodyLarge.copyWith(
                color: context.primaryColor,
              ),
            ),
          ],
        );

        final dataColumn = Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (resource.notes != null) ...[
              const Gap.vertical(2 * kSizeDefault),
              SelectableText(
                ArchiveStrings.resourceNotes,
                style: context.bodyLarge.copyWith(
                  color: context.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap.vertical(kSizeDefault / 2),
              SelectableText(
                resource.notes!,
                style: context.bodyLarge.copyWith(
                  color: context.primaryColor.withOpacity(0.8),
                ),
              ),
            ],
            if (resource.classroom!.tas.isNotEmpty) ...[
              const Gap.vertical(2 * kSizeDefault),
              SelectableText(
                ArchiveStrings.resourceTAs,
                style: context.bodyLarge.copyWith(
                  color: context.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap.vertical(kSizeDefault / 2),
              SelectableText(
                resource.classroom!.tas.join('\n'),
                style: context.bodyLarge.copyWith(
                  color: context.primaryColor.withOpacity(0.8),
                ),
              ),
            ],
          ],
        );

        return ArchiveWebPage(
          applyPlatformConstraints: false,
          onRefresh: controller.fetchData,
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
                    ArchiveStrings.resources,
                    '$title - $semester',
                  ],
                  routes: [
                    ArchiveRoutes.home,
                    ArchiveRoutes.resources,
                    '${ArchiveRoutes.resources}/${resource.uuid}'
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
                  width: double.infinity,
                  padding: const EdgeInsets.all(kSizeDefault),
                  decoration: BoxDecoration(
                    color: context.secondaryColor,
                    borderRadius: BorderRadius.circular(kSizeDefault),
                  ),
                  child: context.responsiveBuilder(
                    mobile: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        titleAndSemester,
                        const Gap.vertical(kSizeDefault),
                        typeLabel,
                        dataColumn,
                      ],
                    ),
                    desktop: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: titleAndSemester),
                            const Gap.horizontal(kSizeDefault),
                            typeLabel,
                          ],
                        ),
                        dataColumn,
                      ],
                    ),
                  ),
                ),
              ),
              if (resource.file != null) ...[
                const Gap.vertical(1.5 * kSizeDefault),
                Container(
                  alignment: Alignment.centerRight,
                  constraints:
                      BoxConstraints(maxWidth: context.platform.maxWidth),
                  padding:
                      EdgeInsets.symmetric(horizontal: context.platform.margin),
                  child: Link(
                    uri: resource.file,
                    target: LinkTarget.blank,
                    builder: (_, followLink) => ElevatedButton(
                      onPressed: followLink,
                      style: ButtonStyle(
                        padding: const MaterialStatePropertyAll(
                          EdgeInsets.symmetric(
                            horizontal: kSizeDefault,
                            vertical: kSizeDefault / 2,
                          ),
                        ),
                        textStyle: MaterialStatePropertyAll(
                          context.bodyLarge.copyWith(
                            color: context.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      child: const Text(ArchiveStrings.resourceDownload),
                    ),
                  ),
                ),
              ],
              const Gap.vertical(2 * kSizeDefault),
              Container(
                constraints:
                    BoxConstraints(maxWidth: context.platform.maxWidth),
                padding:
                    EdgeInsets.symmetric(horizontal: context.platform.margin),
                child: const ArchiveHeader(
                  title: ArchiveStrings.resourceRelatedCourse,
                ),
              ),
              courseCardsBuilder(
                context: context,
                courses: [resource.classroom!.course],
                infiniteWidth: true,
              ),
              if (resource.classroom!.professors.isNotEmpty) ...[
                const Gap.vertical(2 * kSizeDefault),
                Container(
                  constraints:
                      BoxConstraints(maxWidth: context.platform.maxWidth),
                  padding:
                      EdgeInsets.symmetric(horizontal: context.platform.margin),
                  child: const ArchiveHeader(
                    title: ArchiveStrings.resourceRelatedProfessors,
                  ),
                ),
                professorCardsBuilder(
                  context: context,
                  professors: resource.classroom!.professors,
                  infiniteWidth: true,
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
