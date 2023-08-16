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

class ProfessorView extends StatelessWidget {
  final String id;

  const ProfessorView({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Change

    final controller = Get.put(
      ProfessorController(professorId: int.parse(id)),
      tag: id,
    );

    return ArchiveWebPage(
      applyPlatformConstraints: false,
      body: controller.obx(
        (data) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerRight,
              constraints: BoxConstraints(maxWidth: context.platform.maxWidth),
              padding:
                  EdgeInsets.symmetric(horizontal: context.platform.margin),
              child: ArchivePath(
                labels: [
                  ArchiveStrings.home,
                  ArchiveStrings.professors,
                  data!.fullName,
                ],
                routes: [
                  ArchiveRoutes.home,
                  ArchiveRoutes.professors,
                  '${ArchiveRoutes.professors}/${data.id}',
                ],
              ),
            ),
            const Gap.vertical(1.5 * kSizeDefault),
            Container(
              constraints: BoxConstraints(maxWidth: context.platform.maxWidth),
              padding:
                  EdgeInsets.symmetric(horizontal: context.platform.margin),
              child: Container(
                padding: const EdgeInsets.all(kSizeDefault),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(kSizeDefault),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: SelectionArea(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data.honorific,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                              ),
                                        ),
                                        Text(
                                          data.fullName,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              ArchiveLabel(
                                title: ArchiveStrings.professorDepartment,
                                value: data.department,
                              ),
                            ],
                          ),
                          if (data.description?.isNotEmpty ?? false) ...[
                            const Gap.vertical(kSizeDefault / 2),
                            SelectableText(
                              data.description!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withOpacity(0.8),
                                  ),
                            ),
                          ],
                          if (data.emails.isNotEmpty) ...[
                            const Gap.vertical(2 * kSizeDefault),
                            SelectableText(
                              ArchiveStrings.professorEmails,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: data.emails
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
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary
                                                    .withOpacity(0.8),
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor:
                                                    Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                              ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                          if (data.relatedLinks.isNotEmpty) ...[
                            const Gap.vertical(2 * kSizeDefault),
                            SelectableText(
                              ArchiveStrings.professorRelatedLinks,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: data.relatedLinks
                                  .map(
                                    (relatedLink) => Link(
                                      uri: Uri.parse(relatedLink),
                                      target: LinkTarget.blank,
                                      builder: (_, followLink) => TextButton(
                                        onPressed: followLink,
                                        child: Text(
                                          relatedLink,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary
                                                    .withOpacity(0.8),
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor:
                                                    Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                              ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ],
                      ),
                    ),
                    const Gap.horizontal(kSizeDefault),
                    ArchiveCard(
                      width: 17 * kSizeDefault,
                      height: 17 * kSizeDefault,
                      onPressed: null,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(kSizeDefault / 2),
                        child: Image.asset(
                          data.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (data.courses.isNotEmpty) ...[
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
                courses: data.courses,
                infiniteWidth: true,
              ),
            ],
          ],
        ),
        onLoading: const LoadingView(),
      ),
    );
  }
}
