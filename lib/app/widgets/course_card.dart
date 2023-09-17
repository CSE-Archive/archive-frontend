import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/controllers/courses.dart';
import 'package:cse_archive/app/extensions/color_scheme.dart';
import 'package:cse_archive/app/extensions/text_theme.dart';
import 'package:cse_archive/app/models/chart_node.dart';
import 'package:cse_archive/app/models/course.dart';
import 'package:cse_archive/app/routes/routes.dart';
import 'package:cse_archive/app/utils/en_to_fa_digits.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'gap.dart';
import 'card.dart';

class ArchiveCourseCard extends StatelessWidget {
  final CourseModel? course;
  final ChartNodeModel? chartNode;
  final double width;

  const ArchiveCourseCard({
    super.key,
    this.course,
    this.chartNode,
    this.width = kSizeCardWidth,
  })  : assert(
          course != null || chartNode != null,
          'One of course or chartNode must not be null',
        ),
        assert(
          course == null || chartNode == null,
          'One of course or chartNode must be null',
        );

  @override
  Widget build(BuildContext context) {
    final effectiveCourse = course ?? chartNode?.course;

    final child = ArchiveCard(
      width: width,
      color: context.primaryColor,
      padding: const EdgeInsets.all(kSizeDefault),
      onPressed: () => context.go(
        chartNode != null && effectiveCourse == null
            ? Uri(
                path: ArchiveRoutes.courses,
                queryParameters: {
                  CoursesController.typeQueryParameter:
                      chartNode!.courseType!.queryParameterValue,
                },
              ).toString()
            : '${ArchiveRoutes.courses}/${effectiveCourse!.uuid}',
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            chartNode != null && effectiveCourse == null
                ? chartNode!.courseType!.representation
                : effectiveCourse!.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.bodyLarge,
          ),
          const Gap.vertical(kSizeDefault),
          Text(
            enToFaDigits(
              '${chartNode != null && effectiveCourse == null ? chartNode!.courseUnits!.representation : effectiveCourse!.units.representation} ${ArchiveStrings.courseUnit}',
            ),
            style: context.bodySmall.copyWith(
              color: context.secondaryColor.withOpacity(0.8),
            ),
          ),
          Text(
            effectiveCourse?.type.representation ?? '',
            style: context.bodySmall.copyWith(
              color: context.secondaryColor.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );

    if (chartNode != null) {
      return Tooltip(
        message: _getTooltip(chartNode!),
        child: child,
      );
    }

    return child;
  }
}

String _getTooltip(ChartNodeModel chartNode) {
  if (chartNode.course == null) return ArchiveStrings.chartSeeCourses;

  final coRequisites = chartNode.course!.coRequisites;
  final preRequisites = chartNode.course!.preRequisites;

  String co = coRequisites.isNotEmpty
      ? '${ArchiveStrings.chartCo}\n• ${coRequisites.map(
            (course) => course.title,
          ).join('\n• ')}'
      : '${ArchiveStrings.chartCo}\n-';

  String pre = preRequisites.isNotEmpty
      ? '${ArchiveStrings.chartPre}\n• ${preRequisites.map(
            (course) => course.title,
          ).join('\n• ')}'
      : '${ArchiveStrings.chartPre}\n-';

  return '$co\n\n$pre';
}
