import 'package:cse_archive/app/constants/icons.dart';
import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/extensions/color_scheme.dart';
import 'package:cse_archive/app/extensions/text_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ArchivePath extends StatelessWidget {
  final List<String> labels;
  final List<String> routes;

  const ArchivePath({
    super.key,
    required this.labels,
    required this.routes,
  }) : assert(
          labels.length == routes.length,
          'labels and routes must have same length',
        );

  @override
  Widget build(BuildContext context) {
    final length = labels.length;

    final separator = Icon(
      ArchiveIcons.chevronRight,
      size: kSizeDefault,
      color: context.secondaryColor.withOpacity(0.5),
    );

    return Text.rich(
      TextSpan(
        style: context.bodySmall,
        children: [
          for (var index = 0; index < length; index++) ...[
            TextSpan(
              text: labels[index],
              recognizer: TapGestureRecognizer()
                ..onTap = () => context.go(routes[index]),
            ),
            if (index != length - 1) WidgetSpan(child: separator),
          ],
        ],
      ),
    );
  }
}
