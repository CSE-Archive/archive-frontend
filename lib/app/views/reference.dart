import 'package:cse_archive/app/constants/icons.dart';
import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/controllers/reference.dart';
import 'package:cse_archive/app/extensions/color_scheme.dart';
import 'package:cse_archive/app/extensions/responsive.dart';
import 'package:cse_archive/app/extensions/text_theme.dart';
import 'package:cse_archive/app/routes/routes.dart';
import 'package:cse_archive/app/utils/course_cards_builder.dart';
import 'package:cse_archive/app/utils/reference_cards_builder.dart';
import 'package:cse_archive/app/widgets/gap.dart';
import 'package:cse_archive/app/widgets/card.dart';
import 'package:cse_archive/app/widgets/header.dart';
import 'package:cse_archive/app/widgets/label.dart';
import 'package:cse_archive/app/widgets/path.dart';
import 'package:cse_archive/app/widgets/web_page/web_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/link.dart';

import 'loading.dart';

class ReferenceView extends GetView<ReferenceController> {
  final String uuid;

  const ReferenceView({
    super.key,
    required this.uuid,
  });

  @override
  String? get tag => uuid;

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (_) {
        final reference = controller.reference!;

        final image = ArchiveCard(
          onPressed: null,
          width: 17 * kSizeDefault,
          height: 20 * kSizeDefault,
          child: (reference.image != null)
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(kSizeDefault / 2),
                  child: Image.network(
                    reference.image.toString(),
                    fit: BoxFit.cover,
                  ),
                )
              : DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kSizeDefault / 2),
                    border: Border.all(
                      width: 4,
                      color: context.primaryColor,
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      ArchiveIcons.photoOff,
                      size: 5 * kSizeDefault,
                      color: context.primaryColor,
                    ),
                  ),
                ),
        );

        final typeLabel = ArchiveLabel(
          title: ArchiveStrings.referenceType,
          value: reference.type.representation,
        );

        final title = SelectableText(
          reference.title,
          style: context.headlineMedium.copyWith(
            color: context.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        );

        final dataColumn = Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (reference.notes != null) ...[
              const Gap.vertical(2 * kSizeDefault),
              SelectableText(
                ArchiveStrings.referenceNotes,
                style: context.bodyLarge.copyWith(
                  color: context.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap.vertical(kSizeDefault / 2),
              SelectableText(
                reference.notes!,
                style: context.bodyLarge.copyWith(
                  color: context.primaryColor.withOpacity(0.8),
                ),
              ),
            ],
            if (reference.writers.isNotEmpty) ...[
              const Gap.vertical(2 * kSizeDefault),
              SelectableText(
                ArchiveStrings.referenceAuthors,
                style: context.bodyLarge.copyWith(
                  color: context.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap.vertical(kSizeDefault / 2),
              SelectableText(
                reference.writers.join('\n'),
                style: context.bodyLarge.copyWith(
                  color: context.primaryColor.withOpacity(0.8),
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
                    ArchiveStrings.references,
                    reference.title
                  ],
                  routes: [
                    ArchiveRoutes.home,
                    ArchiveRoutes.references,
                    '${ArchiveRoutes.references}/${reference.uuid}'
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
                        Align(
                          alignment: Alignment.center,
                          child: image,
                        ),
                        const Gap.vertical(kSizeDefault),
                        title,
                        const Gap.vertical(kSizeDefault),
                        typeLabel,
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
                                  Expanded(child: title),
                                  const Gap.horizontal(kSizeDefault),
                                  typeLabel,
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
              if (reference.file != null) ...[
                const Gap.vertical(1.5 * kSizeDefault),
                Container(
                  alignment: Alignment.centerRight,
                  constraints:
                      BoxConstraints(maxWidth: context.platform.maxWidth),
                  padding:
                      EdgeInsets.symmetric(horizontal: context.platform.margin),
                  child: Link(
                    uri: reference.file,
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
                      child: const Text(ArchiveStrings.referenceDownload),
                    ),
                  ),
                ),
              ],
              if (reference.courses.isNotEmpty) ...[
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
                  courses: reference.courses,
                  infiniteWidth: true,
                ),
              ],
              if (reference.relatedReferences.isNotEmpty) ...[
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
                  references: reference.relatedReferences,
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
