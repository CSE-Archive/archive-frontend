import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/controllers/search_text_field.dart';
import 'package:cse_archive/app/utils/search_bar.dart';
import 'package:cse_archive/app/widgets/expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Widget expansionTileSearchBar({
  required BuildContext context,
  required String title,
  required SearchTextFieldController searchController,
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
    children: [
      searchBar(
        context: context,
        hintText: ArchiveStrings.search,
        searchController: searchController,
        primaryColor: Theme.of(context).colorScheme.primary,
        secondaryColor: Theme.of(context).colorScheme.secondary,
        onClear: () {
          queryParameters.remove(queryParameter);

          context.go(
            Uri(
              path: effectiveRoute,
              queryParameters: queryParameters,
            ).toString(),
          );
        },
        onSubmitted: (value) {
          if (value.trim().isEmpty) {
            queryParameters.remove(queryParameter);
          } else {
            queryParameters.update(
              queryParameter,
              (oldValue) => value,
              ifAbsent: () => value,
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
    ],
  );
}
