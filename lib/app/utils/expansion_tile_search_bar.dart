import 'package:cse_archive/app/controllers/search_text_field.dart';
import 'package:cse_archive/app/utils/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// TODO: Change
Widget expansionTileSearchBar({
  required BuildContext context,
  required String title,
  required Map<String, String> oldParameters,
  required String parameter,
  required String onSelectMainRoute,
  required SearchTextFieldController searchBarController,
}) {
  return ExpansionTile(
    title: Text(
      title,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.w600,
          ),
    ),
    children: [
      searchBar(
        context: context,
        hintText: ' ',
        searchBarController: searchBarController,
        primaryColor: Theme.of(context).colorScheme.primary,
        secondaryColor: Theme.of(context).colorScheme.secondary,
        onClear: () {
          oldParameters.remove(parameter);
          context.go(
            Uri(
              path: onSelectMainRoute,
              queryParameters: oldParameters.isNotEmpty ? oldParameters : null,
            ).toString(),
          );
        },
        onSubmitted: (value) {
          oldParameters.update(
            parameter,
            (oldValue) => value,
            ifAbsent: () => value,
          );

          context.go(
            Uri(
              path: onSelectMainRoute,
              queryParameters: oldParameters,
            ).toString(),
          );
        },
      ),
    ],
  );
}
