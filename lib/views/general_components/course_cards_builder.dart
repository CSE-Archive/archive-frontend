import 'package:cse_archive/constants.dart';
import 'package:cse_archive/views/general_components/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget courseCardsBuilder({
  required List<Map> courses,
  Widget? icon,
}) {
  return SizedBox(
    height: 9 * kSizeDefault,
    child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: courses.length,
      itemBuilder: (context, index) {
        var course = courses[index];
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (index == 0) const SizedBox(width: kSizeDefault),
            Container(
              width: 19 * kSizeDefault,
              margin: const EdgeInsets.only(
                left: kSizeDefault,
                top: kSizeDefault,
                bottom: kSizeDefault,
              ),
              child: CustomCard(
                onPressed: () {},
                child: Container(
                  width: double.infinity,
                  color: Theme.of(context).colorScheme.primary,
                  padding: const EdgeInsets.all(kSizeDefault),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              course['title'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                            ),
                            const Spacer(),
                            Text(
                              '${course['unit']} ${'courseUnit'.tr}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary
                                        .withOpacity(0.7),
                                  ),
                            ),
                            Text(
                              course['type'],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary
                                        .withOpacity(0.7),
                                  ),
                            ),
                          ],
                        ),
                      ),
                      if (icon != null)
                        Container(
                          width: 1.5,
                          height: double.infinity,
                          color: Theme.of(context).colorScheme.secondary,
                          margin: const EdgeInsets.only(left: kSizeDefault),
                        ),
                      if (icon != null)
                        RotatedBox(
                          quarterTurns: 3,
                          child: icon,
                        ),
                    ],
                  ),
                ),
              ),
            ),
            if (index == courses.length - 1)
              const SizedBox(width: kSizeDefault),
          ],
        );
      },
    ),
  );
}
