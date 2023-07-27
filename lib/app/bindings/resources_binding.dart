import 'package:cse_archive/app/controllers/resources.dart';
import 'package:get/get.dart';

class ResourcesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResourcesController());
  }
}
