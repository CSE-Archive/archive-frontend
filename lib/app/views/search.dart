import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/controllers/search.dart';
import 'package:cse_archive/app/routes/routes.dart';
import 'package:cse_archive/app/utils/not_found_svg.dart';
import 'package:cse_archive/app/utils/course_cards_builder.dart';
import 'package:cse_archive/app/utils/professor_cards_builder.dart';
import 'package:cse_archive/app/utils/reference_cards_builder.dart';
import 'package:cse_archive/app/widgets/gap.dart';
import 'package:cse_archive/app/widgets/header.dart';
import 'package:cse_archive/app/widgets/web_page/web_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'loading.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: Add recordings

    //TODO: Change
    final query = Get.parameters[SearchViewController.searchParameter] ?? '';

    final controller = Get.put(SearchViewController(query));
    controller.setParameters({SearchViewController.searchParameter: query});

    return ArchiveWebPage(
      body: controller.obx(
        (_) => (controller.courses.isEmpty &&
                controller.references.isEmpty &&
                controller.professors.isEmpty)
            ? Column(
                children: [
                  notFoundSVG(context),
                  Text(
                    ArchiveStrings.notFound,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          // TODO: titleLarge
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap.vertical(1.5 * kSizeDefault),
                  if (controller.courses.isNotEmpty) ...[
                    ArchiveHeader(
                      title: ArchiveStrings.courses,
                      seeAllOnPressed: () => context.go(
                        Uri(
                          path: ArchiveRoutes.courses,
                          queryParameters: {
                            SearchViewController.searchParameter: query,
                          },
                        ).toString(),
                      ),
                    ),
                    courseCardsBuilder(
                      context: context,
                      courses: controller.courses,
                      infiniteWidth: false,
                    ),
                    const Gap.vertical(2 * kSizeDefault),
                  ],
                  if (controller.references.isNotEmpty) ...[
                    ArchiveHeader(
                      title: ArchiveStrings.references,
                      seeAllOnPressed: () => context.go(
                        Uri(
                          path: ArchiveRoutes.references,
                          queryParameters: {
                            SearchViewController.searchParameter: query,
                          },
                        ).toString(),
                      ),
                    ),
                    referenceCardsBuilder(
                      context: context,
                      references: controller.references,
                      infiniteWidth: false,
                    ),
                    const Gap.vertical(2 * kSizeDefault),
                  ],
                  if (controller.professors.isNotEmpty) ...[
                    ArchiveHeader(
                      title: ArchiveStrings.professors,
                      seeAllOnPressed: () => context.go(
                        Uri(
                          path: ArchiveRoutes.professors,
                          queryParameters: {
                            SearchViewController.searchParameter: query,
                          },
                        ).toString(),
                      ),
                    ),
                    professorCardsBuilder(
                      context: context,
                      professors: controller.professors,
                      infiniteWidth: false,
                    ),
                  ],
                ],
              ),
        onLoading: const LoadingView(),
      ),
    );
  }
}
