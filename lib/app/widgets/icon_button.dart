import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/extensions/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArchiveIconButton extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final double size;
  final EdgeInsetsGeometry? padding;
  final void Function()? onPressed;

  const ArchiveIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.color,
    this.padding,
    this.size = 1.5 * kSizeDefault,
  });

  @override
  Widget build(BuildContext context) {
    final hovered = false.obs;

    final effectiveColor = color ?? context.secondaryColor;

    return GestureDetector(
      onTap: onPressed,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => hovered.value = true,
        onExit: (_) => hovered.value = false,
        child: Padding(
          padding: padding ?? EdgeInsets.zero,
          child: Obx(
            () => Icon(
              icon,
              size: size,
              color: hovered.isTrue
                  ? effectiveColor.withOpacity(0.8)
                  : effectiveColor,
            ),
          ),
        ),
      ),
    );
  }
}
