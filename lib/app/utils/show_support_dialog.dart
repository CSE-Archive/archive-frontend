import 'package:cse_archive/app/constants/icons.dart';
import 'package:cse_archive/app/constants/links.dart';
import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/extensions/color_scheme.dart';
import 'package:cse_archive/app/extensions/text_theme.dart';
import 'package:cse_archive/app/widgets/bullet_text.dart';
import 'package:cse_archive/app/widgets/dialog.dart';
import 'package:cse_archive/app/widgets/gap.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

void showSupportDialog({required BuildContext context}) {
  showDialog(
    context: context,
    builder: (context) {
      final textStyle = context.bodyLarge.copyWith(
        color: context.secondaryColor.withOpacity(0.9),
        fontWeight: FontWeight.w300,
      );

      final titleStyle = context.bodyLarge.copyWith(
        fontWeight: FontWeight.w500,
      );

      return ArchiveDialog(
        title: ArchiveStrings.support,
        children: [
          Text(
            ArchiveStrings.supportStart,
            style: textStyle,
          ),
          const Gap.vertical(kSizeDefault / 2),
          Text(
            ArchiveStrings.supportDescription,
            style: textStyle,
          ),
          const Gap.vertical(kSizeDefault),
          Text(
            ArchiveStrings.supportDonateTitle,
            style: titleStyle,
          ),
          const Gap.vertical(kSizeDefault / 2),
          Text.rich(
            style: textStyle,
            TextSpan(
              children: [
                const TextSpan(text: ArchiveStrings.supportDonateDescriptionP1),
                WidgetSpan(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Link(
                        uri: Uri.parse(ArchiveLinks.support),
                        target: LinkTarget.blank,
                        builder: (_, followLink) => GestureDetector(
                          onTap: followLink,
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Text(
                              ArchiveStrings.supportDonateDescriptionLink,
                              style: textStyle.copyWith(
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                                decorationColor:
                                    context.secondaryColor.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Icon(
                        ArchiveIcons.externalLink,
                        color: context.secondaryColor,
                        size: textStyle.fontSize,
                      ),
                    ],
                  ),
                ),
                const TextSpan(text: ArchiveStrings.supportDonateDescriptionP2),
              ],
            ),
          ),
          const Gap.vertical(kSizeDefault),
          Text(
            ArchiveStrings.supportOtherTitle,
            style: titleStyle,
          ),
          const Gap.vertical(kSizeDefault / 2),
          Text(
            ArchiveStrings.supportOtherDescription,
            style: textStyle,
          ),
          const Gap.vertical(kSizeDefault / 2),
          BulletText(
            richText: Text.rich(
              style: textStyle,
              TextSpan(
                children: [
                  const TextSpan(text: ArchiveStrings.supportOtherCase1P1),
                  WidgetSpan(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Link(
                          uri: Uri.parse(ArchiveLinks.projectRepos),
                          target: LinkTarget.blank,
                          builder: (_, followLink) => GestureDetector(
                            onTap: followLink,
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Text(
                                ArchiveStrings.supportOtherCase1Repos,
                                style: textStyle.copyWith(
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                  decorationColor:
                                      context.secondaryColor.withOpacity(0.5),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Icon(
                          ArchiveIcons.externalLink,
                          color: context.secondaryColor,
                          size: textStyle.fontSize,
                        ),
                      ],
                    ),
                  ),
                  const TextSpan(text: ArchiveStrings.supportOtherCase1P2),
                ],
              ),
            ),
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
          Text(
            ArchiveStrings.supportEnd,
            style: textStyle,
          ),
        ],
      );
    },
  );
}
