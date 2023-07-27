import 'package:cse_archive/app/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Container expansionTileBuilder({
  required BuildContext context,
  required String title,
  required String subtitle,
  required List<String> downloadables,
  List<String>? tas,
}) {
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.8),
          blurRadius: 2,
        ),
      ],
    ),
    child: ExpansionTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.secondary,
            ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.7),
            ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      collapsedBackgroundColor: Theme.of(context).colorScheme.primary,
      iconColor: Theme.of(context).colorScheme.secondary,
      collapsedIconColor: Theme.of(context).colorScheme.secondary,
      children: [
        if (tas != null)
          Container(
            width: double.infinity,
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
            padding: const EdgeInsets.all(kSizeDefault),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'courseItemTas'.tr,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.5),
                      ),
                ),
                Text(
                  tas.join(', '),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.8),
                      ),
                ),
              ],
            ),
          ),
        if (tas != null)
          Container(
            width: double.infinity,
            height: 1,
            color: Theme.of(context).colorScheme.secondary,
          ),
        Container(
          width: double.infinity,
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
          padding: const EdgeInsets.all(kSizeDefault),
          child: Wrap(
            children: downloadables
                .map(
                  (String file) => Padding(
                    padding: const EdgeInsets.all(kSizeDefault / 2),
                    child: GestureDetector(
                      onTap: () {},
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          color: Theme.of(context).colorScheme.secondary,
                          padding: const EdgeInsets.symmetric(
                            horizontal: kSizeDefault,
                            vertical: kSizeDefault / 2,
                          ),
                          child: Text(
                            file,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    ),
  );
}
