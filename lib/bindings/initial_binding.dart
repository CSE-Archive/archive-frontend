import 'package:cse_archive/controllers/general/appbar_controller.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AppbarController());
  }
}
