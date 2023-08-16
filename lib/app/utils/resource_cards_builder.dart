import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/extensions/responsive.dart';
import 'package:cse_archive/app/models/resource.dart';
import 'package:cse_archive/app/widgets/resource_card.dart';
import 'package:flutter/material.dart';

Widget resourceCardsBuilder({
  required BuildContext context,
  required List<ResourceModel> resources,
  required bool infiniteWidth,
}) {
  if (infiniteWidth) {
    return Align(
      alignment: Alignment.centerRight,
      child: SingleChildScrollView(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: context.responsiveHorizontalPadding,
        ),
        child: Wrap(
          spacing: kSizeDefault,
          clipBehavior: Clip.none,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: resources
              .map(
                (resource) => ArchiveResourceCard(resource: resource),
              )
              .toList(),
        ),
      ),
    );
  }

  /// TODO: Make all builders like this:
  /// 4 cards width for large desktops
  /// 3 cards width for desktop
  /// 2 cards width for tablet
  /// 1 card width for mobile

  return SizedBox(
    width: double.infinity,
    child: Wrap(
      spacing: kSizeDefault,
      runSpacing: kSizeDefault,
      clipBehavior: Clip.none,
      alignment: WrapAlignment.spaceBetween,
      children: [
        ...resources
            .map(
              (resource) => ArchiveResourceCard(resource: resource),
            )
            .toList(),
        // TODO
        const ArchiveResourceCard.invisible(),
        const ArchiveResourceCard.invisible(),
        const ArchiveResourceCard.invisible(),
      ],
    ),
  );
}
