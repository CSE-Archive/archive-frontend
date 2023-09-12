import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'divider.dart';

class ArchiveLoadMoreButton extends StatelessWidget {
  final RxBool isLoadingMore;
  final void Function()? onPressed;

  const ArchiveLoadMoreButton({
    super.key,
    required this.isLoadingMore,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: ArchiveDivider(
            color: Theme.of(context).colorScheme.secondary,
            margin: const EdgeInsets.only(left: kSizeDefault),
          ),
        ),
        Obx(
          () => OutlinedButton(
            onPressed: isLoadingMore.isTrue ? null : onPressed,
            style: ButtonStyle(
              mouseCursor: MaterialStatePropertyAll(
                isLoadingMore.isTrue ? SystemMouseCursors.wait : null,
              ),
              foregroundColor: MaterialStatePropertyAll(
                isLoadingMore.isTrue
                    ? Theme.of(context).colorScheme.primary
                    : null,
              ),
              iconColor: MaterialStatePropertyAll(
                isLoadingMore.isTrue
                    ? Theme.of(context).colorScheme.primary
                    : null,
              ),
              backgroundColor: MaterialStatePropertyAll(
                isLoadingMore.isTrue
                    ? Theme.of(context).colorScheme.secondary.withOpacity(0.7)
                    : null,
              ),
              side: MaterialStatePropertyAll(
                isLoadingMore.isTrue ? BorderSide.none : null,
              ),
            ),
            child: const Text(ArchiveStrings.loadMore),
          ),
        ),
        Expanded(
          child: ArchiveDivider(
            color: Theme.of(context).colorScheme.secondary,
            margin: const EdgeInsets.only(right: kSizeDefault),
          ),
        ),
      ],
    );
  }
}
