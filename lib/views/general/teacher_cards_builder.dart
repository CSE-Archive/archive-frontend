import 'package:cse_archive/constants.dart';
import 'package:cse_archive/models/teacher_model.dart';
import 'package:cse_archive/views/general/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget teacherCardsBuilder({
  required BuildContext context,
  required List<TeacherModel> teachers,
  bool wrap = false,
}) {
  if (wrap) {
    return Wrap(
      children: teachers
          .map(
            (teacher) => singleTeacherCardBuilder(
              context: context,
              teacher: teacher,
            ),
          )
          .toList(),
    );
  }
  return SizedBox(
    height: kSizeTeacherCardHeight,
    child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: teachers.length,
      itemBuilder: (context, index) => singleTeacherCardBuilder(
        context: context,
        teacher: teachers[index],
      ),
    ),
  );
}

Container singleTeacherCardBuilder({
  required BuildContext context,
  required TeacherModel teacher,
}) {
  return Container(
    width: kSizeCardWidth,
    height: kSizeTeacherCardHeight,
    margin: const EdgeInsets.all(kSizeDefault / 2),
    child: CustomCard(
      onPressed: () => Get.toNamed(
        '/teachers/${teacher.id}/${teacher.slug}',
      ),
      child: Container(
        color: Theme.of(context).colorScheme.primary,
        padding: const EdgeInsets.all(kSizeDefault),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    '${teacher.honorific} ${teacher.fullName}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: kSizeDefault / 2),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '${'teacherItemDepartment'.tr} ${teacher.department}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.7),
                        ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              height: 13 * kSizeDefault,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    teacher.image,
                  ),
                  fit: BoxFit.cover,
                ),
                border:
                    Border.all(color: Theme.of(context).colorScheme.secondary),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
