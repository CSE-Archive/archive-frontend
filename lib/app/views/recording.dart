import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/controllers/recording.dart';
import 'package:cse_archive/app/extensions/color_scheme.dart';
import 'package:cse_archive/app/extensions/responsive.dart';
import 'package:cse_archive/app/extensions/text_theme.dart';
import 'package:cse_archive/app/routes/routes.dart';
import 'package:cse_archive/app/utils/course_cards_builder.dart';
import 'package:cse_archive/app/utils/en_to_fa_digits.dart';
import 'package:cse_archive/app/utils/professor_cards_builder.dart';
import 'package:cse_archive/app/widgets/gap.dart';
import 'package:cse_archive/app/widgets/header.dart';
import 'package:cse_archive/app/widgets/path.dart';
import 'package:cse_archive/app/widgets/web_page/web_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/link.dart';

import 'loading.dart';

class RecordingView extends GetView<RecordingController> {
  final String uuid;

  const RecordingView({
    super.key,
    required this.uuid,
  });

  @override
  String? get tag => uuid;

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (_) {
        final recording = controller.recording!;

        final title =
            '${ArchiveStrings.recordingPreTitle} ${recording.classroom.course.title}';

        final semester = enToFaDigits(
          '${recording.classroom.semester} ${recording.classroom.year}',
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
            if (recording.notes != null) ...[
              const Gap.vertical(2 * kSizeDefault),
              SelectableText(
                ArchiveStrings.recordingNotes,
                style: context.bodyLarge.copyWith(
                  color: context.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap.vertical(kSizeDefault / 2),
              SelectableText(
                recording.notes!,
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
                    ArchiveStrings.recordings,
                    '${recording.classroom.course.title} - $semester',
                  ],
                  routes: [
                    ArchiveRoutes.home,
                    ArchiveRoutes.recordings,
                    '${ArchiveRoutes.recordings}/${recording.uuid}'
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      titleAndSemester,
                      dataColumn,
                    ],
                  ),
                ),
              ),
              if (recording.links.isNotEmpty) ...[
                const Gap.vertical(1.5 * kSizeDefault),
                Container(
                  alignment: Alignment.centerRight,
                  constraints:
                      BoxConstraints(maxWidth: context.platform.maxWidth),
                  padding:
                      EdgeInsets.symmetric(horizontal: context.platform.margin),
                  child: Wrap(
                    spacing: kSizeDefault,
                    runSpacing: kSizeDefault,
                    children: recording.links
                        .map(
                          (link) => Link(
                            uri: link.uri,
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
                              child: Text(link.title),
                            ),
                          ),
                        )
                        .toList(),
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
                  title: ArchiveStrings.recordingRelatedCourse,
                ),
              ),
              courseCardsBuilder(
                context: context,
                courses: [recording.classroom.course],
                infiniteWidth: true,
              ),
              if (recording.classroom.professors.isNotEmpty) ...[
                const Gap.vertical(2 * kSizeDefault),
                Container(
                  constraints:
                      BoxConstraints(maxWidth: context.platform.maxWidth),
                  padding:
                      EdgeInsets.symmetric(horizontal: context.platform.margin),
                  child: const ArchiveHeader(
                    title: ArchiveStrings.recordingRelatedProfessors,
                  ),
                ),
                professorCardsBuilder(
                  context: context,
                  professors: recording.classroom.professors,
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
