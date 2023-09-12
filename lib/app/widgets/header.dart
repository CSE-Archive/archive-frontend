import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/widgets/divider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class ArchiveHeader extends StatelessWidget {
  final String title;
  final Uri? seeAllUri;

  const ArchiveHeader({
    Key? key,
    required this.title,
    this.seeAllUri,
  }) : super(key: key);

  static TextStyle textStyle(BuildContext context) =>
      Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontWeight: FontWeight.bold,
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
                left: (seeAllUri != null) ? kSizeDefault : 0,
              ),
            ),
          ),
          if (seeAllUri != null)
            Link(
              uri: seeAllUri,
              builder: (_, followLink) => OutlinedButton(
                onPressed: followLink,
                child: const Text(ArchiveStrings.homeSeeAll),
              ),
            ),
        ],
      ),
    );
  }
}
