import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/widgets/divider.dart';
import 'package:flutter/material.dart';

// TODO: Change for real data models 
class CourseExpansionTile extends StatelessWidget {
  const CourseExpansionTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.downloadables,
    this.tas,
  });

  final String title;
  final String subtitle;
  final List<String> downloadables;
  final List<String>? tas;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.7),
            ),
      ),
      children: [
        Container(
          width: double.infinity,
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
          padding: const EdgeInsets.all(kSizeDefault),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (tas != null) ...[
                Text(
                  ArchiveStrings.courseTAs,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.8),
                      ),
                ),
                Text(
                  tas!.join(', '),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                ArchiveDivider(
                  color: Theme.of(context).colorScheme.secondary,
                  margin: const EdgeInsets.symmetric(vertical: kSizeDefault),
                ),
              ],
              Wrap(
                spacing: kSizeDefault,
                runSpacing: kSizeDefault,
                children: downloadables
                    .map(
                      (String file) => ElevatedButton(
                        onPressed: () {},
                        child: Text(file),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
