import 'dart:math' as math;

import 'package:cse_archive/constants.dart';
import 'package:cse_archive/controllers/general/searchbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget searchBarBuilder({
  required BuildContext context,
  required SearchBarController searchBarController,
  required Color primaryColor,
  required Color secondaryColor,
  String? hintText,
  void Function()? onClear,
  void Function(String)? onSubmitted,
}) {
  return Obx(
    () => TextField(
      maxLines: 1,
      onChanged: (text) {
        // searchBarController.textDirection.value = textDirectionDetector(text);
        searchBarController.showClearButton(text.isNotEmpty);
      },
      // textDirection: searchBarController.textDirection.value,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: primaryColor,
          ),
      cursorColor: primaryColor,
      controller: searchBarController.textController,
      textInputAction: TextInputAction.search,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        isDense: true,
        prefixIcon: Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(math.pi),
          child: Icon(
            Icons.search,
            color: primaryColor,
          ),
        ),
        suffixIcon: searchBarController.showClearButton.isTrue
            ? Container(
                color: primaryColor,
                child: IconButton(
                  splashRadius: 2,
                  icon: Icon(
                    Icons.clear,
                    color: secondaryColor,
                  ),
                  onPressed: () {
                    searchBarController.textController.clear();
                    searchBarController.showClearButton(false);
                    if (onClear != null) onClear();
                  },
                ),
              )
            : null,
        contentPadding: const EdgeInsets.symmetric(
          vertical: kSizeDefault / 1.2,
          horizontal: kSizeDefault,
        ),
        border: InputBorder.none,
        filled: true,
        fillColor: primaryColor.withOpacity(0.1),
        hintText: hintText ?? 'search'.tr,
        hintStyle: TextStyle(
          color: primaryColor.withOpacity(0.8),
        ),
      ),
    ),
  );
}
