import 'package:cse_archive/app/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

// TODO: Change
Widget expansionTileRadioButton({
  required BuildContext context,
  required String title,
  required Map<String, String> options,
  required RxString selectedOption,
  required Map<String, String> oldParameters,
  required String parameter,
  required String onSelectMainRoute,
}) {
  return Obx(
    () => ExpansionTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.w500,
            ),
      ),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      expandedAlignment: Alignment.topRight,
      children: options.entries
          .map(
            (pair) => RadioListTile<String>(
              value: pair.key,
              groupValue: selectedOption.value,
              activeColor: Theme.of(context).colorScheme.secondary,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: kSizeDefault / 2),
              title: Text(
                pair.value,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
              onChanged: (value) {
                selectedOption(value);
                oldParameters.update(
                  parameter,
                  (oldValue) => value!,
                  ifAbsent: () => value!,
                );
                context.go(
                  Uri(
                    path: onSelectMainRoute,
                    queryParameters:
                        oldParameters.isNotEmpty ? oldParameters : null,
                  ).toString(),
                );
              },
            ),
          )
          .toList(),
    ),
  );
}
