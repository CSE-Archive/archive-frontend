import 'package:cse_archive/constants.dart';
import 'package:cse_archive/controllers/home/card_hover_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.label,
    this.onPressed,
    this.labelStyle,
    this.showUnderline,
    this.staticUnderline,
  }) : super(key: key);

  final String label;
  final TextStyle? labelStyle;
  final void Function()? onPressed;
  final bool? showUnderline;
  final bool? staticUnderline;

  Size _textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

  @override
  Widget build(BuildContext context) {
    final hoverController = CardHoverController();
    final defaultStyle = Theme.of(context).textTheme.bodyText1!.copyWith(
          color: Theme.of(context).colorScheme.secondary,
          fontWeight: FontWeight.bold,
        );

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) => hoverController.onEnter(),
      onExit: (event) => hoverController.onExit(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: onPressed,
            style: ButtonStyle(
              shadowColor: MaterialStateProperty.all(
                Colors.transparent,
              ),
              surfaceTintColor: MaterialStateProperty.all(
                Colors.transparent,
              ),
              overlayColor: MaterialStateProperty.all(
                Colors.transparent,
              ),
            ),
            child: Text(
              label,
              style: labelStyle ?? defaultStyle,
            ),
          ),
          if (showUnderline ?? true)
            Obx(
              () => AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 1.5,
                width: _textSize(label, labelStyle ?? defaultStyle).width -
                    (kSizeDefault / 2),
                color: hoverController.hover.value || (staticUnderline ?? false)
                    ? labelStyle?.color ?? defaultStyle.color
                    : Colors.transparent,
              ),
            ),
        ],
      ),
    );
  }
}
