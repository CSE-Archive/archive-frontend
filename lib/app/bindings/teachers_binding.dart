import 'package:cse_archive/app/controllers/teachers.dart';
import 'package:get/get.dart';

class TeachersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TeachersController());
  }
}
