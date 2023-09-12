import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/controllers/professor.dart';
import 'package:cse_archive/app/extensions/responsive.dart';
import 'package:cse_archive/app/routes/routes.dart';
import 'package:cse_archive/app/utils/course_cards_builder.dart';
import 'package:cse_archive/app/widgets/card.dart';
import 'package:cse_archive/app/widgets/label.dart';
import 'package:cse_archive/app/widgets/web_page/web_page.dart';
import 'package:cse_archive/app/widgets/path.dart';
import 'package:cse_archive/app/widgets/header.dart';
import 'package:cse_archive/app/widgets/gap.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/link.dart';

import 'loading.dart';

class ProfessorView extends GetView<ProfessorController> {
  final String uuid;

  const ProfessorView({
    super.key,
    required this.uuid,
  });

  @override
  String? get tag => uuid;

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (_) {
        final departmentLabel = ArchiveLabel(
          title: ArchiveStrings.professorDepartment,
          value: controller.professor!.department.representation,
        );

        final image = ArchiveCard(
          width: 17 * kSizeDefault,
          height: 17 * kSizeDefault,
          onPressed: null,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(kSizeDefault / 2),
            child: (controller.professor!.image != null)
                ? Image.network(
                    controller.professor!.image.toString(),
                    fit: BoxFit.cover,
                  )
                : Placeholder(
                    color: Theme.of(context).colorScheme.primary,
                  ),
          ),
        );

        final nameColumn = Align(
          alignment: Alignment.centerRight,
          child: SelectionArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (controller.professor!.honorific != null)
                  Text(
                    controller.professor!.honorific!,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                Text(
                  controller.professor!.fullName,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
        );

        final dataColumn = Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (controller.professor!.about != null) ...[
              const Gap.vertical(kSizeDefault / 2),
              SelectableText(
                controller.professor!.about!,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.8),
                    ),
              ),
            ],
            if (controller.professor!.emails.isNotEmpty) ...[
              const Gap.vertical(2 * kSizeDefault),
              SelectableText(
                ArchiveStrings.professorEmails,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Gap.vertical(kSizeDefault / 2),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: controller.professor!.emails
                    .map(
                      (email) => Link(
                        uri: Uri(
                          scheme: 'mailto',
                          path: email,
                        ),
                        builder: (_, followLink) => TextButton(
                          onPressed: followLink,
                          child: Text(
                            email,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withOpacity(0.8),
                                      decoration: TextDecoration.underline,
                                      decorationColor:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
            if (controller.professor!.links.isNotEmpty) ...[
              const Gap.vertical(2 * kSizeDefault),
              SelectableText(
                ArchiveStrings.professorRelatedLinks,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Gap.vertical(kSizeDefault / 2),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: controller.professor!.links
                    .map(
                      (link) => Link(
                        uri: link.uri,
                        target: LinkTarget.blank,
                        builder: (_, followLink) => TextButton(
                          onPressed: followLink,
                          child: Text(
                            link.title,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withOpacity(0.8),
                                      decoration: TextDecoration.underline,
                                      decorationColor:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
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
                    ArchiveStrings.professors,
                    controller.professor!.fullName,
                  ],
                  routes: [
                    ArchiveRoutes.home,
                    ArchiveRoutes.professors,
                    '${ArchiveRoutes.professors}/${controller.professor!.uuid}',
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
                  child: context.responsiveBuilder(
                    mobile: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: image,
                        ),
                        const Gap.vertical(kSizeDefault),
                        nameColumn,
                        const Gap.vertical(kSizeDefault),
                        departmentLabel,
                        dataColumn,
                      ],
                    ),
                    desktop: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(child: nameColumn),
                                  const Gap.horizontal(kSizeDefault),
                                  departmentLabel,
                                ],
                              ),
                              dataColumn,
                            ],
                          ),
                        ),
                        const Gap.horizontal(kSizeDefault),
                        image,
                      ],
                    ),
                  ),
                ),
              ),
              if (controller.professor!.courses.isNotEmpty) ...[
                const Gap.vertical(2 * kSizeDefault),
                Container(
                  constraints:
                      BoxConstraints(maxWidth: context.platform.maxWidth),
                  padding:
                      EdgeInsets.symmetric(horizontal: context.platform.margin),
                  child: const ArchiveHeader(
                    title: ArchiveStrings.referenceRelatedCourses,
                  ),
                ),
                courseCardsBuilder(
                  context: context,
                  courses: controller.professor!.courses,
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
