import 'package:cse_archive/app/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FooterIconButton extends StatelessWidget {
  final String iconAsset;
  final void Function()? onPressed;

  const FooterIconButton({
    super.key,
    required this.iconAsset,
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
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary.withOpacity(0),
              border: Border.all(
                width: 1,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            child: Center(
              child: SvgPicture.asset(
                iconAsset,
                width: 1.1 * kSizeDefault,
                height: 1.1 * kSizeDefault,
                colorFilter: ColorFilter.mode(
                  hovered.isTrue
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.secondary,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
