import 'package:cse_archive/app/constants/icons.dart';
import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/widgets/icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget searchBar({
  required BuildContext context,
  required TextEditingController controller,
  required RxBool controllerEmpty,
  required Color primaryColor,
  required Color secondaryColor,
  String? hintText,
  void Function()? onClear,
  void Function(String)? onSubmitted,
}) {
  return Obx(
    () => TextField(
      maxLines: 1,
      controller: controller,
      textInputAction: TextInputAction.search,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        hintText: hintText ?? ArchiveStrings.search,
        suffixIconConstraints: const BoxConstraints(
          maxWidth: 2 * kSizeDefault,
          maxHeight: 2 * kSizeDefault,
        ),
        suffixIcon: controllerEmpty.isTrue
            ? null
            : Padding(
                padding: const EdgeInsets.all(kSizeDefault / 2),
                child: ArchiveIconButton(
                  icon: ArchiveIcons.x,
                  color: primaryColor,
                  size: kSizeDefault,
                  onPressed: () {
                    controller.clear();
                    if (onClear != null) onClear();
                  },
                ),
              ),
      ),
    ),
  );
}
