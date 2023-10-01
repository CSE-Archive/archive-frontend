import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/extensions/responsive.dart';
import 'package:cse_archive/app/models/professor.dart';
import 'package:cse_archive/app/widgets/professor_card.dart';
import 'package:flutter/material.dart';

Widget professorCardsBuilder({
  required BuildContext context,
  required List<ProfessorModel> professors,
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
          children: professors.indexed.map(
            (indexedPair) {
              final (index, professor) = indexedPair;

              return Padding(
                padding: EdgeInsets.only(
                  left: index == professors.length - 1 ? 0 : kSizeDefault,
                ),
                child: ArchiveProfessorCard(professor: professor),
              );
            },
          ).toList(),
        ),
      ),
    );
  }

  return GridView.count(
    // TODO: Card height is hard coded
    childAspectRatio: context.responsiveCardWidth / 128,
    shrinkWrap: true,
    clipBehavior: Clip.none,
    mainAxisSpacing: kSizeDefault,
    crossAxisSpacing: kSizeDefault,
    physics: const NeverScrollableScrollPhysics(),
    crossAxisCount: context.platform.cardsGridViewCrossAxisCount,
    children: professors
        .map(
          (professor) => ArchiveProfessorCard(
            professor: professor,
            width: context.responsiveCardWidth,
          ),
        )
        .toList(),
  );
}
