import 'package:cse_archive/app/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'gap.dart';

class ArchiveLabel extends StatelessWidget {
  final String title;
  final String value;

  const ArchiveLabel({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Container(
        padding: const EdgeInsets.all(kSizeDefault / 2),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(kSizeDefault / 2),
        ),
        child: Row(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall,
              // TODO: titleSmall
            ),
            const Gap.horizontal(kSizeDefault / 2),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: kSizeDefault / 2,
                vertical: kSizeDefault / 4,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(
                  kSizeDefault / 4,
                ),
              ),
              child: Text(
                value,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      // TODO: titleSmall
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
