import 'package:cse_archive/app/constants.dart';
import 'package:cse_archive/app/models/course.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_card.dart';
import 'helpers.dart';

Widget courseCardsBuilder({
  required BuildContext context,
  required List<CourseModel> courses,
  bool wrap = false,
}) {
  if (wrap) {
    return Wrap(
      children: courses
          .map(
            (course) => singleCourseCardBuilder(
              context: context,
              course: course,
            ),
          )
          .toList(),
    );
  }
  return SizedBox(
    height: kSizeCourseCardHeight,
    child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: courses.length,
      itemBuilder: (context, index) {
        return singleCourseCardBuilder(
          context: context,
          course: courses[index],
        );
      },
    ),
  );
}

Container singleCourseCardBuilder({
  required BuildContext context,
  required CourseModel course,
}) {
  return Container(
    width: kSizeCardWidth,
    height: kSizeCourseCardHeight,
    margin: const EdgeInsets.all(kSizeDefault / 2),
    child: CustomCard(
      onPressed: () => Get.toNamed('/courses/${course.id}/${course.slug}'),
      child: Container(
        width: double.infinity,
        height: kSizeCourseCardHeight,
        color: Theme.of(context).colorScheme.primary,
        padding: const EdgeInsets.all(kSizeDefault),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              course.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
            const Spacer(),
            Text(
              replaceEnWithFaDigits('${course.units} ${'courseUnit'.tr}'),
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.7),
                  ),
            ),
            Text(
              courseTypeToString(course.type),
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.7),
                  ),
            ),
          ],
        ),
      ),
    ),
  );
}
