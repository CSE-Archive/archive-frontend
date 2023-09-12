import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/models/recorded_classroom.dart';
import 'package:cse_archive/app/utils/en_to_fa_digits.dart';
import 'package:flutter/material.dart';

import 'gap.dart';
import 'card.dart';

class ArchiveRecordingCard extends StatelessWidget {
  final RecordedClassroomModel recording;
  final double width;

  const ArchiveRecordingCard({
    super.key,
    required this.recording,
    this.width = kSizeCardWidth,
  });

  @override
  Widget build(BuildContext context) {
    return ArchiveCard(
      width: width,
      color: Theme.of(context).colorScheme.primary,
      padding: const EdgeInsets.all(kSizeDefault),
      onPressed: () {}, // TODO: Add on press download options
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            recording.classroom.course.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Gap.vertical(kSizeDefault),
          Text(
            enToFaDigits(
              '${recording.classroom.semester} ${recording.classroom.year}',
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.8),
                ),
          ),
          Text(
            recording.classroom.professors
                .map(
                  (professor) => professor.fullNameWithHonorific,
                )
                .join(', '),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.8),
                ),
          ),
        ],
      ),
    );
  }
}