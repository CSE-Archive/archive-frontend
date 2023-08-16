import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/extensions/responsive.dart';
import 'package:cse_archive/app/models/reference.dart';
import 'package:cse_archive/app/widgets/reference_card.dart';
import 'package:flutter/material.dart';

Widget referenceCardsBuilder({
  required BuildContext context,
  required List<ReferenceModel> references,
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
          children: references
              .map(
                (reference) => ArchiveReferenceCard(reference: reference),
              )
              .toList(),
        ),
      ),
    );
  }

  return SizedBox(
    width: double.infinity,
    child: Wrap(
      spacing: kSizeDefault,
      runSpacing: kSizeDefault,
      clipBehavior: Clip.none,
      alignment: WrapAlignment.spaceBetween,
      children: [
        ...references
            .map(
              (reference) => ArchiveReferenceCard(reference: reference),
            )
            .toList(),
        // TODO
        const ArchiveReferenceCard.invisible(),
        const ArchiveReferenceCard.invisible(),
        const ArchiveReferenceCard.invisible(),
      ],
    ),
  );
}
