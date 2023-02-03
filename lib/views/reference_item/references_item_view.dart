import 'package:cse_archive/constants.dart';
import 'package:cse_archive/controllers/reference_item/reference_item_controller.dart';
import 'package:cse_archive/views/general/basic_web_page.dart';
import 'package:cse_archive/views/general/course_cards_builder.dart';
import 'package:cse_archive/views/general/path_builder.dart';
import 'package:cse_archive/views/general/reference_cards_builder.dart';
import 'package:cse_archive/views/general/title_heading.dart';
import 'package:cse_archive/views/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReferenceItemView extends StatelessWidget {
  const ReferenceItemView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final id = Get.parameters["id"];
    final controller = Get.put(
      ReferenceItemController(referenceId: int.parse(id!)),
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
                'references'.tr: () => Get.toNamed('/references'),
                data!.title: () =>
                    Get.toNamed('/references/${data.id}/${data.slug}'),
              },
            ),
            const SizedBox(height: kSizeDefault),
            ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 22 * kSizeDefault,
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
                          Text(
                            'referenceItemTitle'.tr,
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
                            data.title,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: kSizeDefault),
                          Text(
                            'referenceItemAuthors'.tr,
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
                            data.authors.join('\n'),
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: kSizeDefault),
                    Container(
                      width: 17 * kSizeDefault,
                      height: 22 * kSizeDefault,
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
            Row(
              children: [
                const SizedBox(width: 4 * kSizeDefault),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => states.contains(MaterialState.hovered)
                          ? Theme.of(context).colorScheme.secondary
                          : Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.8),
                    ),
                    shadowColor: MaterialStateProperty.all(
                      Colors.transparent,
                    ),
                    overlayColor: MaterialStateProperty.all(
                      Colors.transparent,
                    ),
                    shape: MaterialStateProperty.resolveWith(
                      (states) {
                        if (states.contains(MaterialState.hovered)) {
                          return const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          );
                        }
                        return const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(kSizeDefault),
                            bottomRight: Radius.circular(kSizeDefault),
                          ),
                        );
                      },
                    ),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(
                        horizontal: 4 * kSizeDefault,
                        vertical: kSizeDefault,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.download_rounded),
                      const SizedBox(width: kSizeDefault / 2),
                      Text(
                        'referenceItemDownload'.tr,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2 * kSizeDefault),
            if (data.courses.isNotEmpty)
              TitleHeading(title: 'referenceItemRelatedCourses'.tr),
            if (data.courses.isNotEmpty)
              courseCardsBuilder(context: context, courses: data.courses),
            const SizedBox(height: 2 * kSizeDefault),
            if (data.references.isNotEmpty)
              TitleHeading(title: 'referenceItemRelatedReferences'.tr),
            if (data.references.isNotEmpty)
              referenceCardsBuilder(
                context: context,
                references: data.references,
              ),
          ],
        ),
        onLoading: const LoadingView(),
      ),
    );
  }
}
