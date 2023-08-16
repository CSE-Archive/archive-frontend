import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/models/reference.dart';
import 'package:cse_archive/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'gap.dart';
import 'card.dart';

class ArchiveReferenceCard extends StatelessWidget {
  final ReferenceModel? reference;

  const ArchiveReferenceCard({
    super.key,
    required this.reference,
  });

  const ArchiveReferenceCard.invisible({super.key}) : reference = null;

  @override
  Widget build(BuildContext context) {
    final child = ArchiveCard(
      width: kSizeCardWidth,
      color: Theme.of(context).colorScheme.primary,
      padding: const EdgeInsets.all(kSizeDefault),
      onPressed: () =>
          context.go('${ArchiveRoutes.references}/${reference?.id}'),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              reference?.title ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          const Gap.vertical(kSizeDefault / 2),
          SizedBox(
            width: double.infinity,

            /// TODO: It is a hacky solution, keep an eye on
            /// https://github.com/flutter/flutter/issues/31134
            /// for possible future built-in solution
            child: Text(
              '${reference?.authors.join(', ')}\n',
              maxLines: 2,
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
              image: DecorationImage(
                image: AssetImage(reference?.image ?? ''),
                fit: BoxFit.cover,
              ),
              border:
                  Border.all(color: Theme.of(context).colorScheme.secondary),
            ),
          ),
        ],
      ),
    );

    if (reference == null) {
      return Opacity(
        opacity: 0,
        child: IgnorePointer(child: child),
      );
    }

    return child;
  }
}
