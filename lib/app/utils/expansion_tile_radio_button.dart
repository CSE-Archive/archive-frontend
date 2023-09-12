import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/models/base_enum.dart';
import 'package:cse_archive/app/widgets/expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

Widget expansionTileRadioButton({
  required BuildContext context,
  required String title,
  required List<BaseEnumModel> options,
  required Rx<BaseEnumModel> selectedOption,
  required BaseEnumModel defaultOption,
  required Map<String, String> queryParameters,
  required String queryParameter,
  required String effectiveRoute,
}) {
  return ArchiveExpansionTile(
    title: Text(
      title,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.w500,
          ),
    ),
    children: options
        .map(
          (option) => Obx(
            () => RadioListTile<BaseEnumModel>(
              value: option,
              groupValue: selectedOption.value,
              activeColor: Theme.of(context).colorScheme.secondary,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: kSizeDefault / 2),
              title: Text(
                option.representation,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
              onChanged: (value) {
                selectedOption.value = value!;

                if (value == defaultOption) {
                  queryParameters.remove(queryParameter);
                } else {
                  queryParameters.update(
                    queryParameter,
                    (oldValue) => value.queryParameterValue,
                    ifAbsent: () => value.queryParameterValue,
                  );
                }

                context.go(
                  Uri(
                    path: effectiveRoute,
                    queryParameters: queryParameters,
                  ).toString(),
                );
              },
            ),
          ),
        )
        .toList(),
  );
}
