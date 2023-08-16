import 'dart:math' as math;

import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/controllers/search_text_field.dart';
import 'package:cse_archive/app/widgets/icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


// TODO: Change
Widget searchBar({
  required BuildContext context,
  required SearchTextFieldController searchBarController,
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
      onChanged: (text) => searchBarController.showClearButton(text.isNotEmpty),
      controller: searchBarController.textController,
      textInputAction: TextInputAction.search,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        hintText: hintText ?? ArchiveStrings.search,
        prefixIconConstraints: const BoxConstraints(
          minHeight: kSizeDefault,
          maxHeight: kSizeDefault,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(
            right: kSizeDefault,
            left: kSizeDefault / 2,
          ),
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: const Icon(
              Icons.search,
              size: kSizeDefault,
            ),
          ),
        ),
        suffixIcon: searchBarController.showClearButton.isTrue
            ? Container(
                color: primaryColor,
                child: ArchiveIconButton(
                  icon: Icons.clear,
                  color: secondaryColor,
                  size: kSizeDefault,
                  onPressed: () {
                    searchBarController.textController.clear();
                    searchBarController.showClearButton(false);
                    if (onClear != null) onClear();
                  },
                ),
              )
            : null,
      ),
    ),
  );
}
