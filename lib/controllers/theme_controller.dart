import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  void changeToLightTheme() {
    Get.changeThemeMode(ThemeMode.light);
  }

  void changeToDarkTheme() {
    Get.changeThemeMode(ThemeMode.dark);
  }
}
