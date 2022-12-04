import 'package:cse_archive/constants.dart';
import 'package:cse_archive/controllers/appbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

Widget appbarBuilder(BuildContext context) {
  var appbarController = Get.find<AppbarController>();

  return Container(
    height: 3.5 * kSizeDefault,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(kSizeDefault),
        bottomRight: Radius.circular(kSizeDefault),
      ),
      boxShadow: [
        BoxShadow(
          color: kColorPrimary.withOpacity(0.5),
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
                onTap: () {},
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: kSizeDefault / 2),
                  child: SvgPicture.asset(
                    kPathLogo,
                    color: kColorPrimary,
                  ),
                ),
              ),
            ),
            const SizedBox(width: kSizeDefault / 2),
            Expanded(
              flex: 10,
              child: TextField(
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: kColorPrimary),
                cursorColor: kColorPrimary,
                controller: appbarController.searchBarController,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: kSizeDefault / 1.2,
                    horizontal: kSizeDefault,
                  ),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: kColorPrimary.withOpacity(0.1),
                  hintText: 'appbarSearch'.tr,
                  hintStyle: TextStyle(
                    color: kColorPrimary.withOpacity(0.8),
                  ),
                ),
              ),
            ),
            const Spacer(flex: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomIconTextButton(label: 'appbarChart'.tr),
                const SizedBox(width: kSizeDefault),
                CustomIconTextButton(label: 'appbarCourses'.tr),
                const SizedBox(width: kSizeDefault),
                CustomIconTextButton(label: 'appbarReferences'.tr),
                const SizedBox(width: kSizeDefault),
                CustomIconTextButton(label: 'appbarTeachers'.tr),
              ],
            ),
            const Spacer(flex: 1),
            PopupMenuButton<Language>(
              icon: const Icon(
                Icons.translate,
                color: kColorPrimary,
              ),
              splashRadius: kSizeDefault,
              tooltip: '',
              onSelected: (language) => Get.updateLocale(
                Locale(
                  language.languageCode,
                  language.countryCode,
                ),
              ),
              itemBuilder: (BuildContext context) {
                return appbarController.languages
                    .map(
                      (language) => PopupMenuItem(
                        value: language,
                        child: Text(
                          language.label,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: kColorPrimary),
                        ),
                      ),
                    )
                    .toList();
              },
            ),
          ],
        ),
      ),
    ),
  );
}

class CustomIconTextButton extends StatelessWidget {
  const CustomIconTextButton({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: kColorPrimary,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
