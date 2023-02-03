import 'package:cse_archive/controllers/general/searchbar_controller.dart';
import 'package:get/get.dart';

enum AppbarButtons {
  none,
  chart,
  courses,
  references,
  teachers,
}

class AppbarController extends GetxController {
  var activeButton = AppbarButtons.none.obs;
  var searchBarController = Get.put(
    SearchBarController(),
    tag: 'appbarSearchBar',
  );

  @override
  void onClose() {
    searchBarController.dispose();
    super.onClose();
  }
}
