import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GeneralController extends GetxController {
  final List<GlobalKey<ScaffoldState>> _scaffoldKeys = [];

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

  void addScaffoldKey(GlobalKey<ScaffoldState> newKey) {
    _scaffoldKeys.add(newKey);
  }

  void openDrawer() {
    for (var scaffoldKey in _scaffoldKeys) {
      scaffoldKey.currentState?.openDrawer();
    }
  }

  void closeDrawer() {
    for (var scaffoldKey in _scaffoldKeys) {
      scaffoldKey.currentState?.closeDrawer();
    }
  }
}
