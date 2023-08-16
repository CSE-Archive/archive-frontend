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
        child: Wrap(
          spacing: kSizeDefault,
          clipBehavior: Clip.none,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: professors
              .map(
                (professor) => ArchiveProfessorCard(professor: professor),
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
        ...professors
            .map(
              (professor) => ArchiveProfessorCard(professor: professor),
            )
            .toList(),
        // TODO
        const ArchiveProfessorCard.invisible(),
        const ArchiveProfessorCard.invisible(),
        const ArchiveProfessorCard.invisible(),
      ],
    ),
  );
}
