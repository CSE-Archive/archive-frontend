import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GeneralController extends GetxController {
  late GlobalKey<ScaffoldState> _scaffoldKey;

  set scaffoldKey(GlobalKey<ScaffoldState> value) => _scaffoldKey = value;

  final drawerOpen = false.obs;

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

  void openDrawer() => _scaffoldKey.currentState!.openDrawer();
  void closeDrawer() => _scaffoldKey.currentState!.closeDrawer();
}
