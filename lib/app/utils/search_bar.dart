import 'package:cse_archive/app/constants/icons.dart';
import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/controllers/search_text_field.dart';
import 'package:cse_archive/app/widgets/icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget searchBar({
  required BuildContext context,
  required SearchTextFieldController searchController,
  required Color primaryColor,
  required Color secondaryColor,
  String? hintText,
  void Function()? onInit,
  void Function()? onClear,
  void Function(String)? onSubmitted,
}) {
  if (onInit != null) onInit();

  return Obx(
    () => TextField(
      maxLines: 1,
      controller: searchController.textController,
      textInputAction: TextInputAction.search,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        hintText: hintText ?? ArchiveStrings.search,
        suffixIconConstraints: const BoxConstraints(
          maxWidth: 2 * kSizeDefault,
          maxHeight: 2 * kSizeDefault,
        ),
        suffixIcon: searchController.isEmpty.isTrue
            ? null
            : Container(
                color: primaryColor,
                padding: const EdgeInsets.all(kSizeDefault / 2),
                child: ArchiveIconButton(
                  icon: ArchiveIcons.x,
                  color: secondaryColor,
                  size: kSizeDefault,
                  onPressed: () {
                    searchController.textController.clear();
                    if (onClear != null) onClear();
                  },
                ),
              ),
      ),
    ),
  );
}
