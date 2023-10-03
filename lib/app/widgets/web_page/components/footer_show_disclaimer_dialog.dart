import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/extensions/color_scheme.dart';
import 'package:cse_archive/app/extensions/text_theme.dart';
import 'package:cse_archive/app/widgets/dialog.dart';
import 'package:cse_archive/app/widgets/gap.dart';
import 'package:flutter/material.dart';

void showDisclaimerDialog({required BuildContext context}) {
  showDialog(
    context: context,
    builder: (context) {
      final textStyle = context.bodyMedium.copyWith(
        color: context.secondaryColor.withOpacity(0.9),
        fontWeight: FontWeight.w300,
      );

      final titleStyle = context.bodyMedium.copyWith(
        fontWeight: FontWeight.w500,
      );

      return ArchiveDialog(
        title: ArchiveStrings.disclaimer,
        children: [
          Text(
            ArchiveStrings.disclaimerCopyright,
            style: titleStyle,
          ),
          const Gap.vertical(kSizeDefault / 2),
          Text(
            ArchiveStrings.disclaimerCopyrightDescription,
            style: textStyle,
          ),
          const Gap.vertical(kSizeDefault),
          Text(
            ArchiveStrings.disclaimerResponsibility,
            style: titleStyle,
          ),
          const Gap.vertical(kSizeDefault / 2),
          Text(
            ArchiveStrings.disclaimerResponsibilityDescription,
            style: textStyle,
          ),
          const Gap.vertical(kSizeDefault),
          Text(
            ArchiveStrings.disclaimerOtherWebsites,
            style: titleStyle,
          ),
          const Gap.vertical(kSizeDefault / 2),
          Text(
            ArchiveStrings.disclaimerOtherWebsitesDescription,
            style: textStyle,
          ),
          const Gap.vertical(kSizeDefault),
          Text(
            ArchiveStrings.disclaimerChanges,
            style: titleStyle,
          ),
          const Gap.vertical(kSizeDefault / 2),
          Text(
            ArchiveStrings.disclaimerChangesDescription,
            style: textStyle,
          ),
          const Gap.vertical(kSizeDefault),
          Text(
            ArchiveStrings.disclaimerContact,
            style: titleStyle,
          ),
          const Gap.vertical(kSizeDefault / 2),
          Text(
            ArchiveStrings.disclaimerContactDescription,
            style: textStyle,
          ),
        ],
      );
    },
  );
}
