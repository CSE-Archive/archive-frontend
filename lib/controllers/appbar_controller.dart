import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language {
  Language({
    required this.languageCode,
    required this.countryCode,
    required this.label,
    this.icon,
  });

  final String languageCode;
  final String countryCode;
  final String label;
  final Widget? icon;
}

class AppbarController extends GetxController {
  late TextEditingController searchBarController;

  final languages = [
    Language(
      languageCode: 'fa',
      countryCode: 'IR',
      label: 'FA فارسی',
    ),
    Language(
      languageCode: 'en',
      countryCode: 'US',
      label: 'EN انگلیسی',
    ),
  ];

  @override
  void onInit() {
    searchBarController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    searchBarController.dispose();
    super.onClose();
  }
}
