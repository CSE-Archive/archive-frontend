import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/controllers/reference.dart';
import 'package:cse_archive/app/extensions/responsive.dart';
import 'package:cse_archive/app/routes/routes.dart';
import 'package:cse_archive/app/utils/course_cards_builder.dart';
import 'package:cse_archive/app/utils/reference_cards_builder.dart';
import 'package:cse_archive/app/widgets/gap.dart';
import 'package:cse_archive/app/widgets/card.dart';
import 'package:cse_archive/app/widgets/path.dart';
import 'package:cse_archive/app/widgets/web_page/web_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/header.dart';
import 'loading.dart';

class ReferenceView extends StatelessWidget {
  final String id;

  const ReferenceView({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Change

    final controller = Get.put(
      ReferenceController(referenceId: int.parse(id)),
      tag: id,
    );

    return ArchiveWebPage(
      applyPlatformConstraints: false,
      body: controller.obx(
        (_) => Column(
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
                  ArchiveStrings.references,
                  controller.reference.title
                ],
                routes: [
                  ArchiveRoutes.home,
                  ArchiveRoutes.references,
                  '${ArchiveRoutes.references}/${controller.reference.uuid}'
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
                          // TODO: Decide this
                          // SelectableText(
                          //   ArchiveStrings.referenceTitle,
                          //   style: Theme.of(context)
                          //       .textTheme
                          //       .titleMedium!
                          //       .copyWith(
                          //         color: Theme.of(context).colorScheme.primary,
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          // ),
                          SelectableText(
                            controller.reference.title,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const Gap.vertical(2 * kSizeDefault),
                          SelectableText(
                            ArchiveStrings.referenceAuthors,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          SelectableText(
                            controller.reference.authors.join('\n'),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.8),
                                ),
                          ),
                          // TODO: Add download buttons
                        ],
                      ),
                    ),
                    const Gap.horizontal(kSizeDefault),
                    ArchiveCard(
                      onPressed: null,
                      width: 17 * kSizeDefault,
                      height: 22 * kSizeDefault,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(kSizeDefault / 2),
                        child: (controller.reference.image != null)
                            ? Image.network(
                                controller.reference.image.toString(),
                                fit: BoxFit.cover,
                              )
                            : Placeholder(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (controller.reference.courses.isNotEmpty) ...[
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
                courses: controller.reference.courses,
                infiniteWidth: true,
              ),
            ],
            if (controller.reference.relatedReferences.isNotEmpty) ...[
              const Gap.vertical(2 * kSizeDefault),
              Container(
                constraints:
                    BoxConstraints(maxWidth: context.platform.maxWidth),
                padding:
                    EdgeInsets.symmetric(horizontal: context.platform.margin),
                child: const ArchiveHeader(
                  title: ArchiveStrings.referenceRelatedReferences,
                ),
              ),
              referenceCardsBuilder(
                context: context,
                references: controller.reference.relatedReferences,
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
