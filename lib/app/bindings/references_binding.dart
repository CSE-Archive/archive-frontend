import 'package:cse_archive/app/controllers/references.dart';
import 'package:get/get.dart';

class ReferencesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReferencesController());
  }
}
