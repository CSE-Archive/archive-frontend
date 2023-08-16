import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/controllers/chart.dart';
import 'package:cse_archive/app/extensions/responsive.dart';
import 'package:cse_archive/app/routes/routes.dart';
import 'package:cse_archive/app/utils/course_cards_builder.dart';
import 'package:cse_archive/app/utils/en_to_fa_digits.dart';
import 'package:cse_archive/app/widgets/dialog.dart';
import 'package:cse_archive/app/widgets/web_page/web_page.dart';
import 'package:cse_archive/app/widgets/path.dart';
import 'package:cse_archive/app/widgets/header.dart';
import 'package:cse_archive/app/widgets/gap.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'loading.dart';

class ChartView extends StatelessWidget {
  const ChartView({super.key});

  static final semestersTitles = [
    ArchiveStrings.chartSemester1,
    ArchiveStrings.chartSemester2,
    ArchiveStrings.chartSemester3,
    ArchiveStrings.chartSemester4,
    ArchiveStrings.chartSemester5,
    ArchiveStrings.chartSemester6,
    ArchiveStrings.chartSemester7,
    ArchiveStrings.chartSemester8,
  ];

  @override
  Widget build(BuildContext context) {
    final chartController = Get.find<ChartController>();

    Widget getHelpDialog(BuildContext context) {
      final textStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.9),
            fontWeight: FontWeight.w300,
          );

      final titleStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w500,
          );

      return ArchiveDialog(
        title: ArchiveStrings.chartHelp,
        children: [
          SelectableText(
            ArchiveStrings.chartHelpPreRequisitesTitle,
            style: titleStyle,
          ),
          const Gap.vertical(kSizeDefault / 2),
          SelectableText(
            ArchiveStrings.chartHelpPreRequisitesDescription,
            style: textStyle,
          ),
          const Gap.vertical(kSizeDefault),
          SelectableText(
            ArchiveStrings.chartHelpCoRequisitesTitle,
            style: titleStyle,
          ),
          const Gap.vertical(kSizeDefault / 2),
          SelectableText(
            ArchiveStrings.chartHelpCoRequisitesDescription,
            style: textStyle,
          ),
        ],
      );
    }

    return ArchiveWebPage(
      applyPlatformConstraints: false,
      body: chartController.obx(
        (data) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerRight,
              constraints: BoxConstraints(maxWidth: context.platform.maxWidth),
              padding:
                  EdgeInsets.symmetric(horizontal: context.platform.margin),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ArchivePath(
                    labels: const [
                      ArchiveStrings.home,
                      ArchiveStrings.chart,
                    ],
                    routes: const [
                      ArchiveRoutes.home,
                      ArchiveRoutes.chart,
                    ],
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: getHelpDialog,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          ArchiveStrings.chartHelp,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        const Gap.horizontal(kSizeDefault / 2),
                        Icon(
                          Icons.help,
                          color: Theme.of(context).colorScheme.secondary,
                          size: kSizeDefault,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Gap.vertical(1.5 * kSizeDefault),
            ...data!.asMap().entries.map(
              (semester) {
                final index = semester.key;
                final courses = semester.value;

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      constraints:
                          BoxConstraints(maxWidth: context.platform.maxWidth),
                      padding: EdgeInsets.symmetric(
                        horizontal: context.platform.margin,
                      ),
                      child: ArchiveHeader(
                        title: enToFaDigits(
                          '${semestersTitles[index]} - ${courses.fold<int>(0, (a, b) => a + b.units)} ${ArchiveStrings.courseUnit}',
                        ),
                      ),
                    ),
                    courseCardsBuilder(
                      context: context,
                      courses: courses,
                      showTooltip: true,
                      infiniteWidth: true,
                    ),
                    if (index != data.length - 1)
                      const Gap.vertical(2 * kSizeDefault),
                  ],
                );
              },
            ),
          ],
        ),
        onLoading: const LoadingView(),
      ),
    );
  }
}
