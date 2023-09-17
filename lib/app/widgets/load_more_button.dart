import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/extensions/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dialog.dart';
import 'divider.dart';

class ArchiveLoadMoreButton extends StatelessWidget {
  final RxBool isLoadingMore;
  final Future<bool> Function() onPressed;

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
            color: context.secondaryColor,
            margin: const EdgeInsets.only(left: kSizeDefault),
          ),
        ),
        Obx(
          () => OutlinedButton(
            onPressed: isLoadingMore.isTrue
                ? null
                : () => onPressed().then(
                      (result) {
                        if (!result) {
                          showDialog(
                            context: context,
                            builder: (context) => ArchiveDialog(
                              title: ArchiveStrings.errorTitle,
                              children: [
                                SelectableText(
                                  ArchiveStrings.errorDescription,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary
                                            .withOpacity(0.9),
                                        fontWeight: FontWeight.w300,
                                      ),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    ),
            style: ButtonStyle(
              mouseCursor: MaterialStatePropertyAll(
                isLoadingMore.isTrue ? SystemMouseCursors.wait : null,
              ),
              foregroundColor: MaterialStatePropertyAll(
                isLoadingMore.isTrue ? context.primaryColor : null,
              ),
              iconColor: MaterialStatePropertyAll(
                isLoadingMore.isTrue ? context.primaryColor : null,
              ),
              backgroundColor: MaterialStatePropertyAll(
                isLoadingMore.isTrue
                    ? context.secondaryColor.withOpacity(0.7)
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
            color: context.secondaryColor,
            margin: const EdgeInsets.only(right: kSizeDefault),
          ),
        ),
      ],
    );
  }
}
