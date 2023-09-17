import 'package:cse_archive/app/constants/icons.dart';
import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/controllers/chart.dart';
import 'package:cse_archive/app/extensions/color_scheme.dart';
import 'package:cse_archive/app/extensions/responsive.dart';
import 'package:cse_archive/app/extensions/text_theme.dart';
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

import 'error.dart';
import 'loading.dart';

class ChartView extends GetView<ChartController> {
  const ChartView({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (_) => ArchiveWebPage(
        applyPlatformConstraints: false,
        body: Column(
          mainAxisSize: MainAxisSize.min,
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
                      builder: _getHelpDialog,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          ArchiveStrings.chartHelp,
                          style: context.bodyMedium.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Gap.horizontal(kSizeDefault / 2),
                        Icon(
                          ArchiveIcons.helpSquare,
                          color: context.secondaryColor,
                          size: kSizeDefault,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Gap.vertical(1.5 * kSizeDefault),
            ...controller.listOfChartNodes.indexed.map(
              (indexedPair) {
                final (index, chartNodes) = indexedPair;

                final semesterUnitsSum = chartNodes.fold<int>(
                  0,
                  (sum, chartNode) =>
                      sum +
                      (chartNode.course?.units.toJson() ??
                          chartNode.courseUnits!.toJson()!),
                );

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
                          '${ArchiveStrings.chartSemesters[index]} - $semesterUnitsSum ${ArchiveStrings.courseUnit}',
                        ),
                      ),
                    ),
                    courseCardsBuilder(
                      context: context,
                      chartNodes: chartNodes,
                      infiniteWidth: true,
                    ),
                    if (index != (controller.listOfChartNodes.length - 1))
                      const Gap.vertical(kSizeDefault),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      onLoading: const LoadingView(),
      onError: (_) => ErrorView(retryButtonOnPressed: controller.fetchData),
    );
  }
}

Widget _getHelpDialog(BuildContext context) {
  final textStyle = context.bodyMedium.copyWith(
    color: context.secondaryColor.withOpacity(0.9),
    fontWeight: FontWeight.w300,
  );

  final titleStyle = context.bodyMedium.copyWith(
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
