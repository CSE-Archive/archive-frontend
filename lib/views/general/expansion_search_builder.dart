import 'package:cse_archive/constants.dart';
import 'package:cse_archive/controllers/general/searchbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'searchbar_builder.dart';

Widget expansionSearchBuilder({
  required int key,
  required BuildContext context,
  required String title,
  required Map<String, String> oldParameters,
  required String parameter,
  required String onSelectMainRoute,
  required RxInt selectedExpansionTile,
  required SearchBarController searchBarController,
}) {
  return ExpansionTile(
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
    children: [
      searchBarBuilder(
        context: context,
        hintText: ' ',
        searchBarController: searchBarController,
        primaryColor: Theme.of(context).colorScheme.primary,
        secondaryColor: Theme.of(context).colorScheme.secondary,
        onClear: () {
          oldParameters.remove(parameter);
          var url = Uri(
            path: onSelectMainRoute,
            queryParameters: oldParameters.isNotEmpty ? oldParameters : null,
          );
          Get.toNamed(url.toString());
        },
        onSubmitted: (value) {
          oldParameters.update(
            parameter,
            (oldValue) => value,
            ifAbsent: () => value,
          );
          var url = Uri(
            path: onSelectMainRoute,
            queryParameters: oldParameters,
          );
          Get.toNamed(url.toString());
        },
      ),
      const SizedBox(height: kSizeDefault * 2 / 3),
    ],
  );
}
