import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/extensions/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class BulletText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final TextStyle? bulletStyle;
  final Uri? uri;
  final String bullet;
  final int tabs;

  const BulletText({
    super.key,
    required this.text,
    this.textStyle,
    this.bulletStyle,
    this.uri,
    this.bullet = '•',
    this.tabs = 1,
  });

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
        uri == null
            ? Expanded(
                child: SelectableText(
                  text,
                  style: textStyle ?? defaultTextStyle,
                ),
              )
            : Link(
                uri: uri,
                target: LinkTarget.blank,
                builder: (_, followLink) => GestureDetector(
                  onTap: followLink,
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Text(
                      text,
                      softWrap: true,
                      style: (textStyle ?? defaultTextStyle).copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.4),
                      ),
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
