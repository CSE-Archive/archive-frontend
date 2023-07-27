import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchTextFieldController extends GetxController {
  final showClearButton = false.obs;

  final textController = TextEditingController();

  @override
  void onClose() {
    textController.dispose();

    super.onClose();
  }
}
