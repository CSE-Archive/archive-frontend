import 'package:cse_archive/app/constants/icons.dart';
import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/controllers/professor.dart';
import 'package:cse_archive/app/extensions/color_scheme.dart';
import 'package:cse_archive/app/extensions/responsive.dart';
import 'package:cse_archive/app/extensions/text_theme.dart';
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
import 'package:image_network/image_network.dart';
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
        const imageSize = 17 * kSizeDefault;

        final imageBorderRadius = BorderRadius.circular(kSizeDefault / 2);

        final noImage = DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: imageBorderRadius,
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
        );

        final image = ArchiveCard(
          width: imageSize,
          height: imageSize,
          onPressed: null,
          child: (controller.professor!.image != null)
              ? ImageNetwork(
                  duration: 0,
                  width: imageSize,
                  height: imageSize,
                  borderRadius: imageBorderRadius,
                  image: controller.professor!.image.toString(),
                  onError: noImage,
                  onLoading:
                      CircularProgressIndicator(color: context.primaryColor),
                )
              : noImage,
        );

        final departmentLabel = ArchiveLabel(
          title: ArchiveStrings.professorDepartment,
          value: controller.professor!.department.representation,
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
                    style: context.bodyLarge.copyWith(
                      color: context.primaryColor,
                    ),
                  ),
                Text(
                  controller.professor!.fullName,
                  style: context.headlineMedium.copyWith(
                    color: context.primaryColor,
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
                style: context.bodyMedium.copyWith(
                  color: context.primaryColor.withOpacity(0.8),
                ),
              ),
            ],
            if (controller.professor!.emails.isNotEmpty) ...[
              const Gap.vertical(2 * kSizeDefault),
              SelectableText(
                controller.professor!.emails.length > 1
                    ? ArchiveStrings.professorEmailPlural
                    : ArchiveStrings.professorEmail,
                style: context.bodyLarge.copyWith(
                  color: context.primaryColor,
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
                            style: context.bodyLarge.copyWith(
                              color: context.primaryColor.withOpacity(0.8),
                              decoration: TextDecoration.underline,
                              decorationColor: context.primaryColor,
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
                controller.professor!.links.length > 1
                    ? ArchiveStrings.professorRelatedLinkPlural
                    : ArchiveStrings.professorRelatedLink,
                style: context.bodyLarge.copyWith(
                  color: context.primaryColor,
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
                            style: context.bodyLarge.copyWith(
                              color: context.primaryColor.withOpacity(0.8),
                              decoration: TextDecoration.underline,
                              decorationColor: context.primaryColor,
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
                  child: ArchiveHeader(
                    title: controller.professor!.courses.length > 1
                        ? ArchiveStrings.professorRelatedCoursePlural
                        : ArchiveStrings.professorRelatedCourse,
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
