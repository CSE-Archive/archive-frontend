import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/extensions/responsive.dart';
import 'package:cse_archive/app/models/course.dart';
import 'package:cse_archive/app/widgets/course_card.dart';
import 'package:flutter/material.dart';

Widget courseCardsBuilder({
  required BuildContext context,
  required List<CourseModel> courses,
  required bool infiniteWidth,
  bool showTooltip = false,
}) {
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
        child: Wrap(
          spacing: kSizeDefault,
          clipBehavior: Clip.none,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: courses
              .map(
                (course) => ArchiveCourseCard(
                  course: course,
                  showTooltip: showTooltip,
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  return SizedBox(
    width: double.infinity,
    child: Wrap(
      spacing: kSizeDefault,
      runSpacing: kSizeDefault,
      clipBehavior: Clip.none,
      alignment: WrapAlignment.spaceBetween,
      children: [
        ...courses
            .map(
              (course) => ArchiveCourseCard(
                course: course,
                showTooltip: showTooltip,
              ),
            )
            .toList(),

        /// TODO: Wrap force children to be as far as possible
        /// because of spaceBetween, change it later for all builders.
        /// This is a hacky solution:
        const ArchiveCourseCard.invisible(),
        const ArchiveCourseCard.invisible(),
        const ArchiveCourseCard.invisible(),
      ],
    ),
  );
}
