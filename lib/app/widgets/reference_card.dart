import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/models/reference.dart';
import 'package:cse_archive/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'gap.dart';
import 'card.dart';

class ArchiveReferenceCard extends StatelessWidget {
  final ReferenceModel reference;
  final double width;

  const ArchiveReferenceCard({
    super.key,
    required this.reference,
    this.width = kSizeCardWidth,
  });

  @override
  Widget build(BuildContext context) {
    return ArchiveCard(
      width: width,
      color: Theme.of(context).colorScheme.primary,
      padding: const EdgeInsets.all(kSizeDefault),
      onPressed: () =>
          context.go('${ArchiveRoutes.references}/${reference.uuid}'),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              reference.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          const Gap.vertical(kSizeDefault / 2),
          SizedBox(
            width: double.infinity,
            child: Text(
              reference.writers.join(', '),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.8),
                  ),
            ),
          ),
          const Gap.vertical(kSizeDefault),
          Container(
            width: double.infinity,
            height: kSizeCardWidth / 2,
            decoration: BoxDecoration(
              image: (reference.image != null)
                  ? DecorationImage(
                      image: AssetImage(reference.image.toString()),
                      fit: BoxFit.cover,
                    )
                  : null,
              border:
                  Border.all(color: Theme.of(context).colorScheme.secondary),
            ),
            child: (reference.image != null)
                ? null
                : Placeholder(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
          ),
        ],
      ),
    );
  }
}
