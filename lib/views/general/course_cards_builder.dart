import 'package:cse_archive/constants.dart';
import 'package:cse_archive/views/general/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget courseCardsBuilder({
  required BuildContext context,
  required List<Map> courses,
  bool wrap = false,
}) {
  if (wrap) {
    return Wrap(
      children: courses
          .map(
            (course) => singleCourseCardBuilder(context, course),
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
        return singleCourseCardBuilder(context, courses[index]);
      },
    ),
  );
}

Container singleCourseCardBuilder(
  BuildContext context,
  Map<dynamic, dynamic> course,
) {
  return Container(
    width: kSizeCardWidth,
    height: kSizeCourseCardHeight,
    margin: const EdgeInsets.all(kSizeDefault / 2),
    child: CustomCard(
      onPressed: () {},
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
              course['title'],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
            const Spacer(),
            Text(
              '${course['unit']} ${'courseUnit'.tr}',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.7),
                  ),
            ),
            Text(
              course['type'],
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
