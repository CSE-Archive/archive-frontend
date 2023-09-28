import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/extensions/text_theme.dart';
import 'package:flutter/material.dart';

class BulletText extends StatelessWidget {
  final Text? richText;
  final String? text;
  final TextStyle? textStyle;
  final TextStyle? bulletStyle;
  final String bullet;
  final int tabs;

  const BulletText({
    super.key,
    this.text,
    this.textStyle,
    this.bulletStyle,
    this.bullet = '•',
    this.tabs = 1,
    this.richText,
  })  : assert(
          text != null || richText != null,
          'One of text or richText must not be null',
        ),
        assert(
          text == null || richText == null,
          'One of text or richText must be null',
        );

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = context.bodyMedium;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: tabs * kSizeDefault / 2),
        Text(
          '$bullet  ',
          style: bulletStyle ?? defaultTextStyle,
        ),
        Expanded(
          child: text != null
              ? Text(
                  text!,
                  style: textStyle ?? defaultTextStyle,
                )
              : richText!,
        )
      ],
    );
  }
}
