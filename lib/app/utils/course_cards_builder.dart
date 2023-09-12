import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/extensions/responsive.dart';
import 'package:cse_archive/app/models/chart_node.dart';
import 'package:cse_archive/app/models/course.dart';
import 'package:cse_archive/app/widgets/course_card.dart';
import 'package:flutter/material.dart';

Widget courseCardsBuilder({
  required BuildContext context,
  required bool infiniteWidth,
  List<CourseModel>? courses,
  List<ChartNodeModel>? chartNodes,
}) {
  assert(
    courses != null || chartNodes != null,
    'One of courses or chartNodes must not be null',
  );
  assert(
    courses == null || chartNodes == null,
    'One of courses or chartNodes must be null',
  );

  if (infiniteWidth) {
    return Align(
      alignment: Alignment.centerRight,
      child: SingleChildScrollView(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: context.responsiveHorizontalPadding,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: courses != null
              ? courses.indexed.map(
                  (indexedPair) {
                    final (index, course) = indexedPair;

                    return Padding(
                      padding: EdgeInsets.only(
                        left: index == courses.length - 1 ? 0 : kSizeDefault,
                      ),
                      child: ArchiveCourseCard(course: course),
                    );
                  },
                ).toList()
              : chartNodes!.indexed.map(
                  (indexedPair) {
                    final (index, chartNode) = indexedPair;

                    return Padding(
                      padding: EdgeInsets.only(
                        left: index == chartNodes.length - 1 ? 0 : kSizeDefault,
                      ),
                      child: ArchiveCourseCard(chartNode: chartNode),
                    );
                  },
                ).toList(),
        ),
      ),
    );
  }

  return GridView.count(
    // TODO: Card height is hard coded
    childAspectRatio: context.responsiveCardWidth / 102,
    shrinkWrap: true,
    clipBehavior: Clip.none,
    mainAxisSpacing: kSizeDefault,
    crossAxisSpacing: kSizeDefault,
    physics: const NeverScrollableScrollPhysics(),
    crossAxisCount: context.platform.cardsGridViewCrossAxisCount,
    children: courses != null
        ? courses
            .map(
              (course) => ArchiveCourseCard(
                course: course,
                width: context.responsiveCardWidth,
              ),
            )
            .toList()
        : chartNodes!
            .map(
              (chartNode) => ArchiveCourseCard(
                chartNode: chartNode,
                width: context.responsiveCardWidth,
              ),
            )
            .toList(),
  );
}
