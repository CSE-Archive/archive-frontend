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

void showAboutUsDialog({required BuildContext context}) {
  showDialog(
    context: context,
    builder: (context) {
      final textStyle = context.bodyLarge.copyWith(
        color: context.secondaryColor.withOpacity(0.9),
        fontWeight: FontWeight.w300,
      );

      return ArchiveDialog(
        title: ArchiveStrings.about,
        children: [
          Text(
            ArchiveStrings.aboutDescriptionP1,
            style: textStyle,
          ),
          const Gap.vertical(kSizeDefault / 2),
          Text(
            ArchiveStrings.aboutDescriptionP2,
            style: textStyle,
          ),
          const Gap.vertical(kSizeDefault / 2),
          Text(
            ArchiveStrings.aboutDescriptionP3,
            style: textStyle,
          ),
          const Gap.vertical(kSizeDefault / 2),
          Text(
            ArchiveStrings.aboutMembersAnnounce,
            style: textStyle,
          ),
          const Gap.vertical(kSizeDefault / 2),
          _memberBulletText(
            context: context,
            text: ArchiveStrings.aboutMemberSina,
            url: ArchiveLinks.linkedinSina,
          ),
          const Gap.vertical(kSizeDefault / 4),
          _memberBulletText(
            context: context,
            text: ArchiveStrings.aboutMemberSetia,
            url: ArchiveLinks.linkedinSetia,
          ),
          const Gap.vertical(kSizeDefault / 4),
          _memberBulletText(
            context: context,
            text: ArchiveStrings.aboutMemberAmirH,
            url: ArchiveLinks.linkedinAmirH,
          ),
          const Gap.vertical(kSizeDefault / 4),
          _memberBulletText(
            context: context,
            text: ArchiveStrings.aboutMemberAmirR,
            url: ArchiveLinks.linkedinAmirR,
          ),
          const Gap.vertical(kSizeDefault / 4),
          _memberBulletText(
            context: context,
            text: ArchiveStrings.aboutMemberReza,
            url: ArchiveLinks.linkedinReza,
          ),
        ],
      );
    },
  );
}

BulletText _memberBulletText({
  required BuildContext context,
  required String text,
  required String url,
}) {
  return BulletText(
    richText: Text.rich(
      WidgetSpan(
        child: Link(
          uri: Uri.parse(url),
          target: LinkTarget.blank,
          builder: (_, followLink) => GestureDetector(
            onTap: followLink,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Text(
                text,
                style: context.bodyLarge.copyWith(
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                  decorationColor: context.secondaryColor.withOpacity(0.4),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
