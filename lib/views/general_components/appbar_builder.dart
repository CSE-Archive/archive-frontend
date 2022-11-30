import 'package:cse_archive/constants.dart';
import 'package:cse_archive/controllers/appbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

AppBar appbarBuilder() {
  var controller = Get.find<AppbarController>();

  return AppBar(
    backgroundColor: Colors.white,
    shadowColor: kColorPrimary,
    leading: Padding(
      padding: const EdgeInsets.all(kSizeDefault / 2),
      child: SvgPicture.asset(
        kPathLogo,
        color: kColorPrimary,
      ),
    ),
    title: TextField(
      maxLines: 1,
      style: const TextStyle(color: kColorPrimary),
      cursorColor: kColorPrimary,
      controller: controller.searchBarController,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(kSizeDefault),
        border: InputBorder.none,
        filled: true,
        fillColor: kColorPrimary.withOpacity(0.1),
        hintText: 'جستجو...',
        hintStyle: TextStyle(
          color: kColorPrimary.withOpacity(0.8),
        ),
      ),
    ),
  );
}
