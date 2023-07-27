import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget expansionRadioButtonBuilder({
  required int key,
  required BuildContext context,
  required String title,
  required Map<String, String> options,
  required RxString selectedOption,
  required Map<String, String> oldParameters,
  required String parameter,
  required String onSelectMainRoute,
  required RxInt selectedExpansionTile,
}) {
  return Obx(
    () => ExpansionTile(
      key: ValueKey(key),
      maintainState: true,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
      ),
      tilePadding: EdgeInsets.zero,
      childrenPadding: EdgeInsets.zero,
      iconColor: Theme.of(context).colorScheme.primary,
      collapsedIconColor: Theme.of(context).colorScheme.primary,
      initiallyExpanded: selectedExpansionTile.value == key,
      onExpansionChanged: (value) => selectedExpansionTile(value ? key : -1),
      children: options.entries
          .map(
            (pair) => ListTile(
              minLeadingWidth: 0,
              minVerticalPadding: 0,
              visualDensity: const VisualDensity(vertical: -4),
              contentPadding: EdgeInsets.zero,
              title: Text(
                pair.value,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              leading: Radio<String>(
                value: pair.key,
                groupValue: selectedOption.value,
                activeColor: Theme.of(context).colorScheme.primary,
                splashRadius: 2,
                onChanged: (value) {
                  selectedOption(value);
                  oldParameters.update(
                    parameter,
                    (oldValue) => value!,
                    ifAbsent: () => value!,
                  );
                  var url = Uri(
                    path: onSelectMainRoute,
                    queryParameters:
                        oldParameters.isNotEmpty ? oldParameters : null,
                  );
                  Get.toNamed(url.toString());
                },
              ),
            ),
          )
          .toList(),
    ),
  );
}
