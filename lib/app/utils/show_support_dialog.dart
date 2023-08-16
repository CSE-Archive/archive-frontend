import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/widgets/bullet_text.dart';
import 'package:cse_archive/app/widgets/dialog.dart';
import 'package:cse_archive/app/widgets/gap.dart';
import 'package:flutter/material.dart';

void showSupportDialog({required BuildContext context}) {
  showDialog(
    context: context,
    builder: (context) {
      final textStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.9),
            fontWeight: FontWeight.w300,
          );

      final titleStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w500,
          );

      return ArchiveDialog(
        title: ArchiveStrings.support,
        children: [
          SelectableText(
            ArchiveStrings.supportStart,
            style: textStyle,
          ),
          const Gap.vertical(kSizeDefault / 2),
          SelectableText(
            ArchiveStrings.supportDescription,
            style: textStyle,
          ),
          const Gap.vertical(kSizeDefault),
          SelectableText(
            ArchiveStrings.supportDonateTitle,
            style: titleStyle,
          ),
          const Gap.vertical(kSizeDefault / 2),
          SelectableText(
            ArchiveStrings.supportDonateDescription,
            style: textStyle,
          ),
          const Gap.vertical(kSizeDefault),
          SelectableText(
            ArchiveStrings.supportOtherTitle,
            style: titleStyle,
          ),
          const Gap.vertical(kSizeDefault / 2),
          SelectableText(
            ArchiveStrings.supportOtherDescription,
            style: textStyle,
          ),
          const Gap.vertical(kSizeDefault / 2),
          BulletText(
            text: ArchiveStrings.supportOtherCase1,
            textStyle: textStyle,
          ),
          const Gap.vertical(kSizeDefault / 4),
          BulletText(
            text: ArchiveStrings.supportOtherCase2,
            textStyle: textStyle,
          ),
          const Gap.vertical(kSizeDefault / 4),
          BulletText(
            text: ArchiveStrings.supportOtherCase3,
            textStyle: textStyle,
          ),
          const Gap.vertical(kSizeDefault),
          SelectableText(
            ArchiveStrings.supportEnd,
            style: textStyle,
          ),
          // TODO: Add support buttons
        ],
      );
    },
  );
}
