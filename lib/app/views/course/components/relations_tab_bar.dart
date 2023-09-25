import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/extensions/color_scheme.dart';
import 'package:cse_archive/app/extensions/responsive.dart';
import 'package:cse_archive/app/models/course.dart';
import 'package:cse_archive/app/utils/course_cards_builder.dart';
import 'package:cse_archive/app/widgets/divider.dart';
import 'package:cse_archive/app/widgets/gap.dart';
import 'package:cse_archive/app/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RelationsTabBar extends StatelessWidget {
  final List<String> labels;
  final List<List<CourseModel>> listOfCourses;

  const RelationsTabBar({
    super.key,
    required this.labels,
    required this.listOfCourses,
  });

  @override
  Widget build(BuildContext context) {
    final length = labels.length;
    final activeTab = 0.obs;

    GlobalKey buttonsKey = GlobalKey();

    double getButtonsWidth() {
      final renderBox =
          buttonsKey.currentContext?.findRenderObject() as RenderBox;

      return renderBox.size.width;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: context.responsiveHorizontalPadding,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                key: buttonsKey,
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (var index = 0; index < length; index++) ...[
                    TextButton(
                      onPressed: () => activeTab.value = index,
                      child: Obx(
                        () => AnimatedDefaultTextStyle(
                          duration: 100.milliseconds,
                          style: ArchiveHeader.textStyle(context).copyWith(
                            color: activeTab.value == index
                                ? null
                                : context.secondaryColor.withOpacity(0.5),
                            fontWeight: activeTab.value == index
                                ? null
                                : FontWeight.w400,
                          ),
                          child: Text(labels[index]),
                        ),
                      ),
                    ),
                    const Gap.horizontal(kSizeDefault),
                  ],
                ],
              ),
              FutureBuilder(
                future: Future.delayed(100.milliseconds),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    final width = context.platform.maxWidth -
                        getButtonsWidth() -
                        2 * context.platform.margin;

                    return SizedBox(
                      width: width > 0 ? width : 0,
                      child: ArchiveDivider(color: context.secondaryColor),
                    );
                  }
                  return Gap.zero;
                },
              ),
            ],
          ),
        ),
        const Gap.vertical(ArchiveHeader.bottomPadding),
        Obx(
          () => courseCardsBuilder(
            context: context,
            courses: listOfCourses[activeTab.value],
            infiniteWidth: true,
          ),
        ),
      ],
    );
  }
}
