import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/controllers/search.dart';
import 'package:cse_archive/app/models/course.dart';
import 'package:cse_archive/app/models/reference.dart';
import 'package:cse_archive/app/models/professor.dart';
import 'package:cse_archive/app/routes/routes.dart';
import 'package:cse_archive/app/utils/not_found_svg.dart';
import 'package:cse_archive/app/utils/course_cards_builder.dart';
import 'package:cse_archive/app/utils/professor_cards_builder.dart';
import 'package:cse_archive/app/utils/reference_cards_builder.dart';
import 'package:cse_archive/app/widgets/gap.dart';
import 'package:cse_archive/app/widgets/web_page/web_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../widgets/header.dart';
import 'loading.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: Change

    final query = Get.parameters['q'] ?? '';

    final controller = Get.put(SearchVController(query));
    controller.setParameters({'q': query});

    return ArchiveWebPage(
      body: controller.obx(
        (results) => (results!['courses']!.isEmpty &&
                results['references']!.isEmpty &&
                results['professors']!.isEmpty)
            ? Column(
                children: [
                  notFoundSVG(context),
                  Text(
                    ArchiveStrings.notFound,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap.vertical(1.5 * kSizeDefault),
                  if (results['courses']!.isNotEmpty) ...[
                    ArchiveHeader(
                      title: ArchiveStrings.courses,
                      seeAllOnPressed: () => context.go(
                        Uri(
                          path: ArchiveRoutes.courses,
                          queryParameters: {'q': query},
                        ).toString(),
                      ),
                    ),
                    courseCardsBuilder(
                      context: context,
                      courses: results['courses'] as List<CourseModel>,
                      infiniteWidth: false,
                    ),
                    const Gap.vertical(2 * kSizeDefault),
                  ],
                  if (results['references']!.isNotEmpty) ...[
                    ArchiveHeader(
                      title: ArchiveStrings.references,
                      seeAllOnPressed: () => context.go(
                        Uri(
                          path: ArchiveRoutes.references,
                          queryParameters: {'q': query},
                        ).toString(),
                      ),
                    ),
                    referenceCardsBuilder(
                      context: context,
                      references: results['references'] as List<ReferenceModel>,
                      infiniteWidth: false,
                    ),
                    const Gap.vertical(2 * kSizeDefault),
                  ],
                  if (results['professors']!.isNotEmpty) ...[
                    ArchiveHeader(
                      title: ArchiveStrings.professors,
                      seeAllOnPressed: () => context.go(
                        Uri(
                          path: ArchiveRoutes.professors,
                          queryParameters: {'q': query},
                        ).toString(),
                      ),
                    ),
                    professorCardsBuilder(
                      context: context,
                      professors: results['professors'] as List<ProfessorModel>,
                      infiniteWidth: false,
                    ),
                    const Gap.vertical(2 * kSizeDefault),
                  ],
                ],
              ),
        onLoading: const LoadingView(),
      ),
    );
  }
}
