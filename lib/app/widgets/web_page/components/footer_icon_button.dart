import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/extensions/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FooterIconButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;

  const FooterIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final hovered = false.obs;

    return GestureDetector(
      onTap: onPressed,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => hovered.value = true,
        onExit: (_) => hovered.value = false,
        child: Obx(
          () => AnimatedContainer(
            duration: 200.milliseconds,
            width: 2.2 * kSizeDefault,
            height: 2.2 * kSizeDefault,
            decoration: BoxDecoration(
              color: hovered.isTrue
                  ? context.secondaryColor
                  : context.primaryColor.withOpacity(0),
              border: Border.all(
                width: 1,
                color: context.secondaryColor,
              ),
            ),
            child: Center(
              child: Icon(
                icon,
                size: 1.25 * kSizeDefault,
                color: hovered.isTrue
                    ? context.primaryColor
                    : context.secondaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
