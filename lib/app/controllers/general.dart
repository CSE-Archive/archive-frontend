import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GeneralController extends GetxController {
  static void openDrawer({required BuildContext context}) =>
      Scaffold.of(context).openDrawer();

  static void closeDrawer({required BuildContext context}) =>
      Scaffold.of(context).closeDrawer();

  final appbarSearchController = TextEditingController();
  final appbarSearchControllerEmpty = true.obs;

  @override
  void onInit() {
    super.onInit();

    appbarSearchController.addListener(
      () {
        appbarSearchControllerEmpty.value = appbarSearchController.text.isEmpty;
        appbarSearchControllerEmpty.refresh();
      },
    );
  }

  @override
  void onClose() {
    appbarSearchController.dispose();

    super.onClose();
  }
}
