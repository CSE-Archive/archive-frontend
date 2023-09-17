import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GeneralController extends GetxController {
  static final scaffoldKey = GlobalKey<ScaffoldState>();
  static void openDrawer() => scaffoldKey.currentState?.openDrawer();
  static void closeDrawer() => scaffoldKey.currentState?.closeDrawer();

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
