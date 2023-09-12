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
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: resources.indexed.map(
            (indexedPair) {
              final (index, resource) = indexedPair;

              return Padding(
                padding: EdgeInsets.only(
                  left: index == resources.length - 1 ? 0 : kSizeDefault,
                ),
                child: ArchiveResourceCard(resource: resource),
              );
            },
          ).toList(),
        ),
      ),
    );
  }

  return GridView.count(
    // TODO: Card height is hard coded
    childAspectRatio: context.responsiveCardWidth / 102,
    shrinkWrap: true,
    clipBehavior: Clip.none,
    mainAxisSpacing: kSizeDefault,
    crossAxisSpacing: kSizeDefault,
    physics: const NeverScrollableScrollPhysics(),
    crossAxisCount: context.platform.cardsGridViewCrossAxisCount,
    children: resources
        .map(
          (resource) => ArchiveResourceCard(
            resource: resource,
            width: context.responsiveCardWidth,
          ),
        )
        .toList(),
  );
}
