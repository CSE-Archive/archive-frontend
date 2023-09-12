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
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: references.indexed.map(
            (indexedPair) {
              final (index, reference) = indexedPair;

              return Padding(
                padding: EdgeInsets.only(
                  left: index == references.length - 1 ? 0 : kSizeDefault,
                ),
                child: ArchiveReferenceCard(reference: reference),
              );
            },
          ).toList(),
        ),
      ),
    );
  }

  return GridView.count(
    // TODO: Card height is hard coded
    childAspectRatio: context.responsiveCardWidth / 246,
    shrinkWrap: true,
    clipBehavior: Clip.none,
    mainAxisSpacing: kSizeDefault,
    crossAxisSpacing: kSizeDefault,
    physics: const NeverScrollableScrollPhysics(),
    crossAxisCount: context.platform.cardsGridViewCrossAxisCount,
    children: references
        .map(
          (reference) => ArchiveReferenceCard(
            reference: reference,
            width: context.responsiveCardWidth,
          ),
        )
        .toList(),
  );
}
