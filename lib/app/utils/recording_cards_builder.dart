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
        child: Wrap(
          spacing: kSizeDefault,
          clipBehavior: Clip.none,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: recordings
              .map(
                (recording) => ArchiveRecordingCard(recording: recording),
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
        ...recordings
            .map(
              (recording) => ArchiveRecordingCard(recording: recording),
            )
            .toList(),
        // TODO
        const ArchiveRecordingCard.invisible(),
        const ArchiveRecordingCard.invisible(),
        const ArchiveRecordingCard.invisible(),
      ],
    ),
  );
}
