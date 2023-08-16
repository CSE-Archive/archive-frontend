import 'package:cse_archive/app/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const _storageKey = 'isDark';

class ThemeModeService extends GetxService {
  static ThemeModeService get to => Get.find();

  final _currentMode = ThemeMode.system.obs;

  Rx<ThemeMode> get currentMode => _currentMode;

  @override
  void onInit() {
    super.onInit();

    final cachedIsDarkMode = StorageService.to.storage.getBool(_storageKey);

    _currentMode.value = (cachedIsDarkMode != null)
        ? (cachedIsDarkMode ? ThemeMode.dark : ThemeMode.light)
        : ThemeMode.system;
  }

  bool isDarkMode(BuildContext context) =>
      _currentMode.value == ThemeMode.system
          ? MediaQuery.platformBrightnessOf(context) == Brightness.dark
          : _currentMode.value == ThemeMode.dark;

  void toggle(BuildContext context) {
    _currentMode.value = _currentMode.value == ThemeMode.system
        ? (MediaQuery.platformBrightnessOf(context) == Brightness.dark
            ? ThemeMode.light
            : ThemeMode.dark)
        : (isDarkMode(context) ? ThemeMode.light : ThemeMode.dark);

    StorageService.to.storage.setBool(
      _storageKey,
      _currentMode.value == ThemeMode.dark,
    );
  }
}
