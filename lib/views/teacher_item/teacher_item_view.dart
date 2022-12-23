import 'package:cse_archive/constants.dart';
import 'package:cse_archive/controllers/teacher_item/teacher_item_controller.dart';
import 'package:cse_archive/views/general_components/basic_web_page.dart';
import 'package:cse_archive/views/general_components/custom_card.dart';
import 'package:cse_archive/views/general_components/custom_text_button.dart';
import 'package:cse_archive/views/general_components/path_builder.dart';
import 'package:cse_archive/views/general_components/title_heading.dart';
import 'package:cse_archive/views/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class TeacherItemView extends StatelessWidget {
  const TeacherItemView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final id = Get.parameters["id"];
    final controller = Get.put(
      TeacherItemController(teacherId: int.parse(id!)),
      tag: id,
    );

    return basicWebPage(
      context: context,
      body: controller.obx(
        (data) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            pathBuilder(
              context,
              roots: {
                'home'.tr: () => Get.toNamed('/'),
                'teachers'.tr: () {},
                data!.fullName: () =>
                    Get.toNamed('/teachers/${data.id}/${data.slug}'),
              },
            ),
            const SizedBox(height: kSizeDefault),
            ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 17 * kSizeDefault,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(kSizeDefault),
                ),
                padding: const EdgeInsets.all(kSizeDefault),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.honorific,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary
                                                .withOpacity(0.8),
                                          ),
                                    ),
                                    Text(
                                      data.fullName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(kSizeDefault / 2),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius:
                                      BorderRadius.circular(kSizeDefault / 2),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      'teacherItemDepartment'.tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                          ),
                                    ),
                                    const SizedBox(width: kSizeDefault / 2),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: kSizeDefault / 2,
                                        vertical: kSizeDefault / 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        borderRadius: BorderRadius.circular(
                                            kSizeDefault / 4),
                                      ),
                                      child: Text(
                                        data.department,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          if (data.description.isNotEmpty)
                            const SizedBox(height: kSizeDefault),
                          if (data.description.isNotEmpty)
                            Text(
                              data.description,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withOpacity(0.8),
                                  ),
                            ),
                          if (data.emails.isNotEmpty)
                            const SizedBox(height: 2 * kSizeDefault),
                          if (data.emails.isNotEmpty)
                            Text(
                              'teacherItemEmails'.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withOpacity(0.8),
                                  ),
                            ),
                          if (data.emails.isNotEmpty)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: data.emails
                                  .map(
                                    (email) => CustomTextButton(
                                      onPressed: () async {
                                        final emailUri = Uri(
                                          scheme: 'mailto',
                                          path: email,
                                        );
                                        await launchUrl(emailUri);
                                      },
                                      label: email,
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                      showUnderline: false,
                                    ),
                                  )
                                  .toList(),
                            ),
                          if (data.relatedLinks.isNotEmpty)
                            const SizedBox(height: 2 * kSizeDefault),
                          if (data.relatedLinks.isNotEmpty)
                            Text(
                              'teacherItemRelatedLinks'.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withOpacity(0.8),
                                  ),
                            ),
                          if (data.relatedLinks.isNotEmpty)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: data.relatedLinks
                                  .map(
                                    (relatedLink) => CustomTextButton(
                                      onPressed: () async {
                                        final url = Uri.parse(relatedLink);
                                        await launchUrl(url);
                                      },
                                      label: relatedLink,
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                      showUnderline: false,
                                    ),
                                  )
                                  .toList(),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(width: kSizeDefault),
                    Container(
                      width: 17 * kSizeDefault,
                      height: 17 * kSizeDefault,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(data.image),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(kSizeDefault / 2),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (data.courses.isNotEmpty)
              const SizedBox(height: 2 * kSizeDefault),
            if (data.courses.isNotEmpty)
              TitleHeading(title: 'referenceItemRelatedCourses'.tr),
            if (data.courses.isNotEmpty)
              SizedBox(
                height: 9 * kSizeDefault,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: data.courses.length,
                  itemBuilder: (context, index) {
                    var course = data.courses[index];
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          course['title'],
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                              ),
                                        ),
                                      ),
                                    ],
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
                          ),
                        ),
                        if (index == data.courses.length - 1)
                          const SizedBox(width: kSizeDefault),
                      ],
                    );
                  },
                ),
              ),
          ],
        ),
        onLoading: const LoadingView(),
      ),
    );
  }
}
