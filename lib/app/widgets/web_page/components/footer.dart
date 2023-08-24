import 'package:cse_archive/app/constants/assets.dart';
import 'package:cse_archive/app/constants/links.dart';
import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/extensions/responsive.dart';
import 'package:cse_archive/app/routes/routes.dart';
import 'package:cse_archive/app/utils/show_support_dialog.dart';
import 'package:cse_archive/app/widgets/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart' show RiveAnimation;
import 'package:url_launcher/link.dart';

import 'footer_icon_button.dart';
import 'footer_show_about_us_dialog.dart';
import 'footer_show_contact_us_dialog.dart';
import 'footer_text_button.dart';

Widget footer({required BuildContext context}) {
  final logoIcon = SvgPicture.asset(
    ArchiveAssets.svg.logo,
    colorFilter: ColorFilter.mode(
      Theme.of(context).colorScheme.secondary,
      BlendMode.srcIn,
    ),
  );

  final logo = Link(
    uri: Uri(path: ArchiveRoutes.home),
    builder: (_, followLink) => GestureDetector(
      onTap: followLink,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: context.responsiveBuilder(
          mobile: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              logoIcon,
              const Gap.vertical(kSizeDefault / 2),
              Text(
                ArchiveStrings.footerTitleMobile,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
          desktop: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              logoIcon,
              const Gap.horizontal(kSizeDefault / 2),
              Transform.translate(
                offset: const Offset(0, 4),
                child: Text(
                  ArchiveStrings.footerTitleDesktop,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                        height: 1,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );

  final coursesButton = Link(
    uri: Uri(path: ArchiveRoutes.courses),
    builder: (_, followLink) => FooterTextButton(
      label: ArchiveStrings.footerCourses,
      onPressed: followLink,
    ),
  );

  final referencesButton = Link(
    uri: Uri(path: ArchiveRoutes.references),
    builder: (_, followLink) => FooterTextButton(
      label: ArchiveStrings.footerReferences,
      onPressed: followLink,
    ),
  );

  final professorsButton = Link(
    uri: Uri(path: ArchiveRoutes.professors),
    builder: (_, followLink) => FooterTextButton(
      label: ArchiveStrings.footerProfessors,
      onPressed: followLink,
    ),
  );

  final chartButton = Link(
    uri: Uri(path: ArchiveRoutes.chart),
    builder: (_, followLink) => FooterTextButton(
      label: ArchiveStrings.footerChart,
      onPressed: followLink,
    ),
  );

  final supportButton = FooterTextButton(
    label: ArchiveStrings.footerSupport,
    onPressed: () => showSupportDialog(context: context),
  );

  final aboutUsButton = FooterTextButton(
    label: ArchiveStrings.footerAboutUs,
    onPressed: () => showAboutUsDialog(context: context),
  );

  final contactUsButton = FooterTextButton(
    label: ArchiveStrings.footerContactUs,
    onPressed: () => showContactUsDialog(context: context),
  );

  final socialButtons = Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Link(
        uri: Uri.parse(ArchiveLinks.telegram),
        target: LinkTarget.blank,
        builder: (_, followLink) => FooterIconButton(
          iconAsset: ArchiveAssets.svg.iconTelegram,
          onPressed: followLink,
        ),
      ),
      const Gap.horizontal(kSizeDefault),
      Link(
        uri: Uri.parse(ArchiveLinks.github),
        target: LinkTarget.blank,
        builder: (_, followLink) => FooterIconButton(
          iconAsset: ArchiveAssets.svg.iconGithub,
          onPressed: followLink,
        ),
      ),
    ],
  );

  final publicUseNote = DefaultTextStyle(
    style: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.7),
        ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Transform.translate(
          offset: const Offset(-kSizeDefault / 2, 0),
          child: const Text(ArchiveStrings.footerNoteP1),
        ),
        SizedBox.square(
          dimension: 3 * kSizeDefault,
          child: RiveAnimation.asset(ArchiveAssets.riv.heart),
        ),
        Transform.translate(
          offset: const Offset(kSizeDefault / 2, 0),
          child: const Text(ArchiveStrings.footerNoteP2),
        ),
      ],
    ),
  );

  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Theme.of(context).colorScheme.tertiary,
          Theme.of(context).colorScheme.onTertiary,
        ],
      ),
    ),
    child: Center(
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(maxWidth: context.platform.maxWidth),
        padding: EdgeInsets.symmetric(
          vertical: 3 * kSizeDefault,
          horizontal: context.platform.margin,
        ),
        child: context.responsiveBuilder(
          mobile: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              logo,
              const Gap.vertical(1.5 * kSizeDefault),
              Container(
                height: 1,
                width: 2 / 3 * context.platform.maxWidth,
                color: Theme.of(context).colorScheme.secondary,
              ),
              const Gap.vertical(1.5 * kSizeDefault),
              Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kSizeDefault / 2),
                    child: coursesButton,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kSizeDefault / 2),
                    child: referencesButton,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kSizeDefault / 2),
                    child: professorsButton,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kSizeDefault / 2),
                    child: chartButton,
                  ),
                ],
              ),
              const Gap.vertical(kSizeDefault),
              Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kSizeDefault / 2),
                    child: supportButton,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kSizeDefault / 2),
                    child: aboutUsButton,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kSizeDefault / 2),
                    child: contactUsButton,
                  ),
                ],
              ),
              const Gap.vertical(1.5 * kSizeDefault),
              socialButtons,
              const Gap.vertical(2 * kSizeDefault),
              publicUseNote,
            ],
          ),
          tablet: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  logo,
                  const Spacer(),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      supportButton,
                      aboutUsButton,
                      contactUsButton,
                    ],
                  ),
                  const Gap.horizontal(2 * kSizeDefault),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      coursesButton,
                      referencesButton,
                      professorsButton,
                      chartButton,
                    ],
                  ),
                ],
              ),
              const Gap.vertical(kSizeDefault),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  publicUseNote,
                  const Spacer(),
                  socialButtons,
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
