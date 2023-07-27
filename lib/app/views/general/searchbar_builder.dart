import 'dart:math' as math;

import 'package:cse_archive/app/constants.dart';
import 'package:cse_archive/app/controllers/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget searchBarBuilder({
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
