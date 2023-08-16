import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArchiveCard extends StatelessWidget {
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final void Function()? onPressed;
  final Widget child;

  const ArchiveCard({
    super.key,
    required this.onPressed,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final hovered = false.obs;

    return Obx(
      () => GestureDetector(
        onTap: onPressed,
        child: MouseRegion(
          cursor:
              onPressed == null ? MouseCursor.defer : SystemMouseCursors.click,
          onEnter: (_) => hovered(true),
          onExit: (_) => hovered(false),
          child: AnimatedContainer(
            duration: 100.milliseconds,
            width: width,
            height: height,
            padding: padding,
            decoration: BoxDecoration(
              color: color,
              boxShadow: [
                BoxShadow(
                  blurRadius: 6,
                  color: Theme.of(context).colorScheme.shadow.withOpacity(
                        hovered.isTrue && onPressed != null ? 0.7 : 0.4,
                      ),
                ),
              ],
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
