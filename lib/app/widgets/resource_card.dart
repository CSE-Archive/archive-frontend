import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/models/resource.dart';
import 'package:cse_archive/app/utils/en_to_fa_digits.dart';
import 'package:flutter/material.dart';

import 'gap.dart';
import 'card.dart';

class ArchiveResourceCard extends StatelessWidget {
  final ResourceModel resource;
  final double width;

  const ArchiveResourceCard({
    super.key,
    required this.resource,
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
            '${resource.title ?? resource.type.concatenation} ${resource.classroom!.course.title}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Gap.vertical(kSizeDefault),
          Text(
            enToFaDigits(
              '${resource.classroom!.semester} ${resource.classroom!.year}',
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.8),
                ),
          ),
          Text(
            resource.classroom!.professors
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
