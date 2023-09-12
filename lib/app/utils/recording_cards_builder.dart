import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/extensions/responsive.dart';
import 'package:cse_archive/app/models/recorded_classroom.dart';
import 'package:cse_archive/app/widgets/recording_card.dart';
import 'package:flutter/material.dart';

Widget recordingCardsBuilder({
  required BuildContext context,
  required List<RecordedClassroomModel> recordings,
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
          children: recordings.indexed.map(
            (indexedPair) {
              final (index, recording) = indexedPair;

              return Padding(
                padding: EdgeInsets.only(
                  left: index == recordings.length - 1 ? 0 : kSizeDefault,
                ),
                child: ArchiveRecordingCard(recording: recording),
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
    crossAxisCount: context.platform.cardsGridViewCrossAxisCount,
    children: recordings
        .map(
          (recording) => ArchiveRecordingCard(
            recording: recording,
            width: context.responsiveCardWidth,
          ),
        )
        .toList(),
  );
}
