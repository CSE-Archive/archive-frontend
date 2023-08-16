import 'package:cse_archive/app/constants/links.dart';
import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/widgets/bullet_text.dart';
import 'package:cse_archive/app/widgets/dialog.dart';
import 'package:cse_archive/app/widgets/gap.dart';
import 'package:flutter/material.dart';

void showAboutUsDialog({required BuildContext context}) {
  showDialog(
    context: context,
    builder: (context) {
      final textStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.9),
            fontWeight: FontWeight.w300,
          );

      final membersStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w500,
          );

      return ArchiveDialog(
        title: ArchiveStrings.about,
        children: [
          SelectableText(
            ArchiveStrings.aboutDescriptionP1,
            style: textStyle,
          ),
          const Gap.vertical(kSizeDefault / 2),
          SelectableText(
            ArchiveStrings.aboutDescriptionP2,
            style: textStyle,
          ),
          const Gap.vertical(kSizeDefault / 2),
          SelectableText(
            ArchiveStrings.aboutDescriptionP3,
            style: textStyle,
          ),
          const Gap.vertical(kSizeDefault / 2),
          SelectableText(
            ArchiveStrings.aboutMembersAnnounce,
            style: textStyle,
          ),
          const Gap.vertical(kSizeDefault / 2),
          BulletText(
            text: ArchiveStrings.aboutMemberSetia,
            textStyle: membersStyle,
            uri: Uri.parse(ArchiveLinks.linkedinSetia),
          ),
          const Gap.vertical(kSizeDefault / 4),
          BulletText(
            text: ArchiveStrings.aboutMemberAmirH,
            textStyle: membersStyle,
            uri: Uri.parse(ArchiveLinks.linkedinAmirH),
          ),
          const Gap.vertical(kSizeDefault / 4),
          BulletText(
            text: ArchiveStrings.aboutMemberAmirR,
            textStyle: membersStyle,
            uri: Uri.parse(ArchiveLinks.linkedinAmirR),
          ),
          const Gap.vertical(kSizeDefault / 4),
          BulletText(
            text: ArchiveStrings.aboutMemberReza,
            textStyle: membersStyle,
            uri: Uri.parse(ArchiveLinks.linkedinReza),
          ),
        ],
      );
    },
  );
}
