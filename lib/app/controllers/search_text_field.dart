import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchTextFieldController extends GetxController {
  final isEmpty = false.obs;

  final textController = TextEditingController();

  String get text => textController.text;

  @override
  void onInit() {
    super.onInit();

    textController.addListener(
      () {
        isEmpty.value = textController.text.isEmpty;
        isEmpty.refresh();
      },
    );
  }
}
