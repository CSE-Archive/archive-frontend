import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/models/resource.dart';
import 'package:cse_archive/app/utils/en_to_fa_digits.dart';
import 'package:flutter/material.dart';

import 'gap.dart';
import 'card.dart';

class ArchiveResourceCard extends StatelessWidget {
  final ResourceModel? resource;

  const ArchiveResourceCard({
    super.key,
    required this.resource,
  });

  const ArchiveResourceCard.invisible({super.key}) : resource = null;

  @override
  Widget build(BuildContext context) {
    final child = ArchiveCard(
      width: kSizeCardWidth,
      color: Theme.of(context).colorScheme.primary,
      padding: const EdgeInsets.all(kSizeDefault),
      onPressed: () {}, // TODO: Add on press download options
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            (resource != null && resource!.classroom != null)
                ? '${resource!.title} ${resource!.classroom!.course.title}'
                : '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Gap.vertical(kSizeDefault),
          Text(
            (resource != null && resource!.classroom != null)
                ? '${resource!.classroom!.semester} ${enToFaDigits(resource!.classroom!.year.toString())}'
                : '',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.8),
                ),
          ),
          Text(
            (resource != null && resource!.classroom != null)
                ? resource!.classroom!.professors
                    .map(
                      (professor) => professor.fullNameWithHonorific,
                    )
                    .join(', ')
                : '',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.8),
                ),
          ),
        ],
      ),
    );

    if (resource == null) {
      return Opacity(
        opacity: 0,
        child: IgnorePointer(child: child),
      );
    }

    return child;
  }
}
