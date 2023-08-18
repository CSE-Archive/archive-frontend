import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
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

  const ArchiveCourseCard({
    super.key,
    this.course,
    this.chartNode,
  })  : assert(
          course != null || chartNode != null,
          'One of course or chartNode must not be null',
        ),
        assert(
          course == null || chartNode == null,
          'One of course or chartNode must be null',
        );

  const ArchiveCourseCard.invisible({super.key})
      : course = null,
        chartNode = null;

  @override
  Widget build(BuildContext context) {
    final effectiveCourse = course ?? chartNode?.course;

    final child = ArchiveCard(
      width: kSizeCardWidth,
      color: Theme.of(context).colorScheme.primary,
      padding: const EdgeInsets.all(kSizeDefault),
      onPressed: () =>
          context.go('${ArchiveRoutes.courses}/${effectiveCourse?.uuid}'),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            effectiveCourse?.title ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Gap.vertical(kSizeDefault),
          Text(
            enToFaDigits(
              '${effectiveCourse?.units} ${ArchiveStrings.courseUnit}',
            ),
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.8),
                ),
          ),
          Text(
            (effectiveCourse?.type ?? CourseType.basic).toString(),
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.8),
                ),
          ),
        ],
      ),
    );

    if (effectiveCourse == null) {
      return Opacity(
        opacity: 0,
        child: IgnorePointer(child: child),
      );
    }

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
  // TODO: Handle open new tab

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
