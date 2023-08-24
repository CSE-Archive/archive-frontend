import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/extensions/responsive.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'gap.dart';
import 'icon_button.dart';

class ArchiveDialog extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const ArchiveDialog({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(context.platform.margin),
      child: Container(
        width: (context.isMobile ? 1 : 2 / 3) * context.platform.maxWidth,
        padding: EdgeInsets.all(context.platform.margin),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SelectableText(
                    title,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Spacer(),
                  const Gap.horizontal(kSizeDefault),
                  ArchiveIconButton(
                    icon: Icons.close,
                    onPressed: context.pop,
                  ),
                ],
              ),
              const Gap.vertical(1.5 * kSizeDefault),
              ...children,
            ],
          ),
        ),
      ),
    );
  }
}
