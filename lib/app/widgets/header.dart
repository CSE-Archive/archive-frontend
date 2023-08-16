import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/widgets/divider.dart';
import 'package:flutter/material.dart';

class ArchiveHeader extends StatelessWidget {
  final String title;
  final void Function()? seeAllOnPressed;

  const ArchiveHeader({
    Key? key,
    required this.title,
    this.seeAllOnPressed,
  }) : super(key: key);

  static TextStyle textStyle(BuildContext context) =>
      Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.w600,
          );

  static const bottomPadding = kSizeDefault;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: bottomPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SelectableText(
            title,
            style: textStyle(context),
          ),
          Expanded(
            child: ArchiveDivider(
              color: Theme.of(context).colorScheme.secondary,
              margin: EdgeInsets.only(
                right: kSizeDefault,
                left: (seeAllOnPressed != null) ? kSizeDefault : 0,
              ),
            ),
          ),
          if (seeAllOnPressed != null)
            OutlinedButton(
              onPressed: seeAllOnPressed,
              child: const Text(ArchiveStrings.homeSeeAll),
            ),
        ],
      ),
    );
  }
}
