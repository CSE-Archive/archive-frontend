import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/models/course.dart';
import 'package:cse_archive/app/routes/routes.dart';
import 'package:cse_archive/app/utils/en_to_fa_digits.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'gap.dart';
import 'card.dart';

class ArchiveCourseCard extends StatelessWidget {
  final CourseModel? course;
  final bool showTooltip;

  const ArchiveCourseCard({
    super.key,
    required this.course,
    this.showTooltip = false,
  });

  const ArchiveCourseCard.invisible({super.key})
      : showTooltip = false,
        course = null;

  @override
  Widget build(BuildContext context) {
    final child = ArchiveCard(
      width: kSizeCardWidth,
      color: Theme.of(context).colorScheme.primary,
      padding: const EdgeInsets.all(kSizeDefault),
      onPressed: () => context.go('${ArchiveRoutes.courses}/${course?.id}'),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            course?.name ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Gap.vertical(kSizeDefault),
          Text(
            enToFaDigits('${course?.units} ${ArchiveStrings.courseUnit}'),
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.8),
                ),
          ),
          Text(
            (course?.type ?? CourseType.basic).toString(),
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.8),
                ),
          ),
        ],
      ),
    );

    if (course == null) {
      return Opacity(
        opacity: 0,
        child: IgnorePointer(child: child),
      );
    }

    // TODO: Handle on real data
    if (showTooltip) {
      return Tooltip(
        message: _getTooltip(
          course!.requisites,
          course!.type != CourseType.optional &&
              course!.type != CourseType.general,
        ),
        child: child,
      );
    }

    return child;
  }
}

String _getTooltip(
  Map<CourseModel, RequisiteType> requisites,
  bool doesOpenNewTab,
) {
  if (!doesOpenNewTab) return ArchiveStrings.chartSeeCourses;

  bool coFlag = false;
  bool preFlag = false;
  String co = ArchiveStrings.chartCo;
  String pre = ArchiveStrings.chartPre;

  requisites.forEach(
    (key, value) {
      if (value == RequisiteType.co) {
        co += '\n• ${key.name}';
        coFlag = true;
      } else if (value == RequisiteType.pre) {
        pre += '\n• ${key.name}';
        preFlag = true;
      }
    },
  );

  return '${co + (coFlag ? '' : '\n-')}\n\n${pre + (preFlag ? '' : '\n-')}';
}
