import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/controllers/courses.dart';
import 'package:cse_archive/app/controllers/professors.dart';
import 'package:cse_archive/app/controllers/references.dart';
import 'package:cse_archive/app/controllers/search.dart';
import 'package:cse_archive/app/extensions/responsive.dart';
import 'package:cse_archive/app/routes/routes.dart';
import 'package:cse_archive/app/utils/course_cards_builder.dart';
import 'package:cse_archive/app/utils/professor_cards_builder.dart';
import 'package:cse_archive/app/utils/reference_cards_builder.dart';
import 'package:cse_archive/app/widgets/gap.dart';
import 'package:cse_archive/app/widgets/header.dart';
import 'package:cse_archive/app/widgets/error.dart';
import 'package:cse_archive/app/widgets/web_page/web_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'error.dart';
import 'loading.dart';

class SearchView extends GetView<SearchViewController> {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (_) => ArchiveWebPage(
        applyPlatformConstraints: false,
        body: (controller.courses.isEmpty &&
                controller.references.isEmpty &&
                controller.professors.isEmpty)
            ? IntrinsicHeight(
                child: ArchiveError(
                  type: ArchiveErrorType.notFound,
                  title: ArchiveStrings.searchNotFoundTitle,
                  description: ArchiveStrings.searchNotFoundDescriptionP1 +
                      controller.searchController.text +
                      ArchiveStrings.searchNotFoundDescriptionP2,
                ),
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (controller.courses.isNotEmpty) ...[
                    Container(
                      constraints:
                          BoxConstraints(maxWidth: context.platform.maxWidth),
                      padding: EdgeInsets.symmetric(
                        horizontal: context.platform.margin,
                      ),
                      child: ArchiveHeader(
                        title: ArchiveStrings.courses,
                        seeAllUri: Uri(
                          path: ArchiveRoutes.courses,
                          queryParameters: {
                            CoursesController.searchQueryParameter:
                                controller.searchController.text,
                          },
                        ),
                      ),
                    ),
                    courseCardsBuilder(
                      context: context,
                      courses: controller.courses,
                      infiniteWidth: true,
                    ),
                    if (controller.references.isNotEmpty ||
                        controller.professors.isNotEmpty)
                      const Gap.vertical(2 * kSizeDefault),
                  ],
                  if (controller.references.isNotEmpty) ...[
                    Container(
                      constraints:
                          BoxConstraints(maxWidth: context.platform.maxWidth),
                      padding: EdgeInsets.symmetric(
                        horizontal: context.platform.margin,
                      ),
                      child: ArchiveHeader(
                        title: ArchiveStrings.references,
                        seeAllUri: Uri(
                          path: ArchiveRoutes.references,
                          queryParameters: {
                            ReferencesController.searchQueryParameter:
                                controller.searchController.text,
                          },
                        ),
                      ),
                    ),
                    referenceCardsBuilder(
                      context: context,
                      references: controller.references,
                      infiniteWidth: true,
                    ),
                    if (controller.professors.isNotEmpty)
                      const Gap.vertical(2 * kSizeDefault),
                  ],
                  if (controller.professors.isNotEmpty) ...[
                    Container(
                      constraints:
                          BoxConstraints(maxWidth: context.platform.maxWidth),
                      padding: EdgeInsets.symmetric(
                        horizontal: context.platform.margin,
                      ),
                      child: ArchiveHeader(
                        title: ArchiveStrings.professors,
                        seeAllUri: Uri(
                          path: ArchiveRoutes.professors,
                          queryParameters: {
                            ProfessorsController.searchQueryParameter:
                                controller.searchController.text,
                          },
                        ),
                      ),
                    ),
                    professorCardsBuilder(
                      context: context,
                      professors: controller.professors,
                      infiniteWidth: true,
                    ),
                  ],
                ],
              ),
      ),
      onLoading: const LoadingView(),
      onError: (_) => ErrorView(retryButtonOnPressed: controller.fetchData),
    );
  }
}
