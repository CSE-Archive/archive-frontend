import 'package:cse_archive/constants.dart';
import 'package:cse_archive/controllers/appbar_controller.dart';
import 'package:cse_archive/views/general_components/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

Widget appbarBuilder(BuildContext context) {
  var appbarController = Get.find<AppbarController>();

  return Container(
    height: 3.5 * kSizeDefault,
    margin: const EdgeInsets.symmetric(horizontal: kSizeDefault / 2),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.primary,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(kSizeDefault),
        bottomRight: Radius.circular(kSizeDefault),
      ),
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
          offset: const Offset(0, kSizeDefault / 6),
          blurRadius: kSizeDefault / 2,
        ),
      ],
    ),
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: kSizeMaxWidth),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2 * kSizeDefault),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => Get.toNamed('/'),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: kSizeDefault / 2),
                  child: SvgPicture.asset(
                    kPathLogo,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
            ),
            const SizedBox(width: kSizeDefault / 2),
            Expanded(
              flex: 10,
              child: Obx(
                () => TextField(
                  maxLines: 1,
                  onChanged: (text) =>
                      appbarController.detectTextDirection(text),
                  textDirection: appbarController.searchBarTextDirection.value,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Theme.of(context).colorScheme.secondary),
                  cursorColor: Theme.of(context).colorScheme.secondary,
                  controller: appbarController.searchBarController,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: kSizeDefault / 1.2,
                      horizontal: kSizeDefault,
                    ),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.1),
                    hintText: 'appbarSearch'.tr,
                    hintStyle: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.8),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(flex: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextButton(
                  label: 'appbarChart'.tr,
                  onPressed: () => Get.toNamed('/chart'),
                  staticUnderline: appbarController.activeButton.value ==
                      AppbarButtons.chart,
                ),
                const SizedBox(width: kSizeDefault),
                CustomTextButton(
                  label: 'appbarCourses'.tr,
                  staticUnderline: appbarController.activeButton.value ==
                      AppbarButtons.courses,
                ),
                const SizedBox(width: kSizeDefault),
                CustomTextButton(
                  label: 'appbarReferences'.tr,
                  staticUnderline: appbarController.activeButton.value ==
                      AppbarButtons.references,
                ),
                const SizedBox(width: kSizeDefault),
                CustomTextButton(
                  label: 'appbarTeachers'.tr,
                  staticUnderline: appbarController.activeButton.value ==
                      AppbarButtons.teachers,
                ),
              ],
            ),
            const Spacer(flex: 1),
            IconButton(
              onPressed: () {
                Get.changeThemeMode(
                  Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
                );
              },
              icon: Icon(
                Get.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                size: 2 * kSizeDefault,
                color: Theme.of(context).colorScheme.secondary,
              ),
              splashRadius: 2,
              padding: EdgeInsets.zero,
            ),
            // PopupMenuButton<Language>(
            //   icon: Icon(
            //     Icons.translate,
            //     color: Theme.of(context).colorScheme.secondary,
            //   ),
            //   splashRadius: kSizeDefault,
            //   tooltip: '',
            //   onSelected: (language) => Get.updateLocale(
            //     Locale(
            //       language.languageCode,
            //       language.countryCode,
            //     ),
            //   ),
            //   itemBuilder: (BuildContext context) {
            //     return appbarController.languages
            //         .map(
            //           (language) => PopupMenuItem(
            //             value: language,
            //             child: Text(
            //               language.label,
            //               style: Theme.of(context)
            //                   .textTheme
            //                   .bodyText1!
            //                   .copyWith(color: Theme.of(context).colorScheme.secondary),
            //             ),
            //           ),
            //         )
            //         .toList();
            //   },
            // ),
          ],
        ),
      ),
    ),
  );
}
