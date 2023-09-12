import 'package:cse_archive/app/constants/icons.dart';
import 'package:cse_archive/app/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class ArchivePath extends StatelessWidget {
  final List<String> labels;
  final List<String> routes;

  const ArchivePath({
    super.key,
    required this.labels,
    required this.routes,
  }) : assert(
          labels.length == routes.length,
          'labels and routes must have same length',
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.5 * kSizeDefault,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: routes.length,
        itemBuilder: (_, index) => Link(
          uri: Uri(path: routes[index]),
          builder: (_, followLink) => TextButton(
            onPressed: followLink,
            child: Text(
              labels[index],
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ),
        separatorBuilder: (_, __) => Icon(
          ArchiveIcons.chevronRight,
          size: kSizeDefault,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
