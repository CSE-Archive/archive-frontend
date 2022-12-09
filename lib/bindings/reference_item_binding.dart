import 'package:cse_archive/controllers/appbar_controller.dart';
import 'package:get/get.dart';

class ReferenceItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppbarController());
  }
}
