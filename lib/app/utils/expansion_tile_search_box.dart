import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/extensions/color_scheme.dart';
import 'package:cse_archive/app/extensions/text_theme.dart';
import 'package:cse_archive/app/utils/search_bar.dart';
import 'package:cse_archive/app/widgets/expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

Widget expansionTileSearchBox({
  required BuildContext context,
  required String title,
  required TextEditingController searchController,
  required RxBool searchControllerEmpty,
  required Map<String, String> queryParameters,
  required String queryParameter,
  required String effectiveRoute,
}) {
  return ArchiveExpansionTile(
    title: Text(
      title,
      style: context.bodyLarge.copyWith(
        color: context.secondaryColor,
        fontWeight: FontWeight.w500,
      ),
    ),
    children: [
      searchBar(
        context: context,
        hintText: ArchiveStrings.search,
        controller: searchController,
        controllerEmpty: searchControllerEmpty,
        primaryColor: context.primaryColor,
        secondaryColor: context.secondaryColor,
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
