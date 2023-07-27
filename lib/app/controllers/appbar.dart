import 'package:get/get.dart';

import 'search_text_field.dart';

class AppbarController extends GetxController {
  final searchBarController = SearchTextFieldController();

  @override
  void onClose() {
    searchBarController.dispose();

    super.onClose();
  }
}
