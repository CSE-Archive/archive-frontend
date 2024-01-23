import 'package:cse_archive/app/constants/links.dart';
import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/extensions/color_scheme.dart';
import 'package:cse_archive/app/extensions/text_theme.dart';
import 'package:cse_archive/app/widgets/dialog.dart';
import 'package:cse_archive/app/widgets/gap.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

void showContactUsDialog({required BuildContext context}) {
  showDialog(
    context: context,
    builder: (context) {
      final textStyle = context.bodyLarge.copyWith(
        color: context.secondaryColor.withOpacity(0.9),
        fontWeight: FontWeight.w300,
      );

      final linkStyle = context.bodyLarge.copyWith(
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.underline,
        decorationColor: context.secondaryColor.withOpacity(0.5),
      );

      return ArchiveDialog(
        title: ArchiveStrings.contact,
        children: [
          Text(
            ArchiveStrings.contactDescriptionP1,
            style: textStyle,
          ),
          const Gap.vertical(kSizeDefault / 2),
          Text(
            ArchiveStrings.contactDescriptionP2,
            style: textStyle,
          ),
          const Gap.vertical(kSizeDefault / 2),
          Text(
            ArchiveStrings.contactDescriptionP3,
            style: textStyle,
          ),
          const Gap.vertical(kSizeDefault),
          Text(
            ArchiveStrings.contactBotTitle,
            style: textStyle,
          ),
          Link(
            uri: Uri.parse(ArchiveLinks.telegramBot),
            target: LinkTarget.blank,
            builder: (_, followLink) => TextButton(
              onPressed: followLink,
              child: Text(
                '@${ArchiveLinks.telegramBot.split('/').last}',
                textDirection: TextDirection.ltr,
                style: linkStyle,
              ),
            ),
          ),
          const Gap.vertical(kSizeDefault / 2),
          Text(
            ArchiveStrings.contactEmailTitle,
            style: textStyle,
          ),
          Link(
            uri: Uri(
              scheme: 'mailto',
              path: ArchiveLinks.email,
            ),
            target: LinkTarget.blank,
            builder: (_, followLink) => TextButton(
              onPressed: followLink,
              child: Text(
                ArchiveLinks.email,
                textDirection: TextDirection.ltr,
                style: linkStyle,
              ),
            ),
          ),
        ],
      );
    },
  );
}
