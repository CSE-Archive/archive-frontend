import 'package:cse_archive/controllers/references/references_controller.dart';
import 'package:get/get.dart';

class ReferencesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReferencesController());
  }
}
