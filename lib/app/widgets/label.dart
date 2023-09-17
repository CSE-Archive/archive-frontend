import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/extensions/color_scheme.dart';
import 'package:cse_archive/app/extensions/text_theme.dart';
import 'package:flutter/material.dart';

import 'gap.dart';

class ArchiveLabel extends StatelessWidget {
  final String title;
  final String value;

  const ArchiveLabel({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Container(
        padding: const EdgeInsets.all(kSizeDefault / 2),
        decoration: BoxDecoration(
          color: context.primaryColor,
          borderRadius: BorderRadius.circular(kSizeDefault / 2),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: context.bodyMedium,
            ),
            const Gap.horizontal(kSizeDefault / 2),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: kSizeDefault / 2,
                vertical: kSizeDefault / 4,
              ),
              decoration: BoxDecoration(
                color: context.secondaryColor,
                borderRadius: BorderRadius.circular(
                  kSizeDefault / 4,
                ),
              ),
              child: Text(
                value,
                style: context.bodyMedium.copyWith(
                  color: context.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
