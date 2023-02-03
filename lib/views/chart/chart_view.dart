import 'package:cse_archive/constants.dart';
import 'package:cse_archive/controllers/chart/chart_controller.dart';
import 'package:cse_archive/models/chart_course_model.dart';
import 'package:cse_archive/models/general.dart';
import 'package:cse_archive/views/general/basic_web_page.dart';
import 'package:cse_archive/views/general/custom_card.dart';
import 'package:cse_archive/views/general/helpers.dart';
import 'package:cse_archive/views/general/path_builder.dart';
import 'package:cse_archive/views/general/title_heading.dart';
import 'package:cse_archive/views/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChartView extends StatelessWidget {
  const ChartView({
    super.key,
  });

  String getTooltip(
    Map<ChartCourseModel, RequisiteType> requisites,
    bool doesOpenNewTab,
  ) {
    if (!doesOpenNewTab) return 'chartSeeCourses'.tr;

    var coFlag = false, preFlag = false;
    var co = 'chartCo'.tr, pre = 'chartPre'.tr;

    requisites.forEach((key, value) {
      if (value == RequisiteType.co) {
        co += "\n• ${key.name}";
        coFlag = true;
      } else if (value == RequisiteType.pre) {
        pre += "\n• ${key.name}";
        preFlag = true;
      }
    });

    return '${co + (coFlag ? '' : '\n-')}\n\n${pre + (preFlag ? '' : '\n-')}';
  }

  @override
  Widget build(BuildContext context) {
    var chartController = Get.find<ChartController>();

    return basicWebPage(
      context: context,
      body: chartController.obx(
        (data) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            pathBuilder(
              context,
              roots: {
                'home'.tr: () => Get.toNamed('/'),
                'chart'.tr: () => Get.toNamed('/chart'),
              },
            ),
            const SizedBox(height: kSizeDefault),
            ...data!.asMap().entries.map(
              (semester) {
                final index = semester.key;
                final courses = semester.value;
                return Column(
                  children: [
                    TitleHeading(
                      title: replaceEnWithFaDigits(
                        '${'chartSemester${index + 1}'.tr} - ${courses.fold<int>(0, (a, b) => a + b.units)} ${'courseUnit'.tr}',
                      ),
                    ),
                    SizedBox(
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
                              if (index == 0)
                                const SizedBox(width: kSizeDefault),
                              Tooltip(
                                padding: const EdgeInsets.all(kSizeDefault / 2),
                                message: getTooltip(
                                  course.requisites,
                                  course.doesOpenNewTab,
                                ),
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                child: Container(
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
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      padding:
                                          const EdgeInsets.all(kSizeDefault),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  course.name,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
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
                                            replaceEnWithFaDigits(
                                              '${course.units} ${'courseUnit'.tr}',
                                            ),
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
                                            courseTypeToString(course.type),
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
                              ),
                              if (index == courses.length - 1)
                                const SizedBox(width: kSizeDefault),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
        onLoading: const LoadingView(),
      ),
    );
  }
}
