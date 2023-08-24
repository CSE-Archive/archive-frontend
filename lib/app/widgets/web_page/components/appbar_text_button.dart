import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/services/pages_tracker.dart';
import 'package:cse_archive/app/widgets/gap.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class AppbarTextButton extends StatelessWidget {
  final String label;
  final String route;
  final ArchivePage page;

  const AppbarTextButton({
    super.key,
    required this.label,
    required this.route,
    required this.page,
  });

  Size _textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

  @override
  Widget build(BuildContext context) {
    final hovered = false.obs;
    final textStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontWeight: FontWeight.w500,
        );

    return GestureDetector(
      onTap: () => context.go(route),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => hovered(true),
        onExit: (_) => hovered(false),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: textStyle,
            ),
            Obx(
              () => hovered.value || (PageTrackerService.to.activePage == page)
                  ? Container(
                      height: 1.5,
                      margin: const EdgeInsets.only(top: kSizeDefault / 4),
                      width: _textSize(label, textStyle).width -
                          (kSizeDefault / 2),
                      color: textStyle.color,
                    )
                  : Gap.zero,
            ),
          ],
        ),
      ),
    );
  }
}
