import 'package:cse_archive/app/controllers/courses.dart';
import 'package:get/get.dart';

class CoursesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CoursesController());
  }
}
