import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppbarController extends GetxController {
  late TextEditingController searchBarController;

  @override
  void onInit() {
    super.onInit();
    searchBarController = TextEditingController();
  }

  @override
  void onClose() {
    searchBarController.dispose();
    super.onClose();
  }
}
