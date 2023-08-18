import 'package:get/get.dart';

import 'chart.dart';
import 'courses.dart';
import 'home.dart';
import 'professors.dart';
import 'references.dart';
import 'resources.dart';

Future<void> controllersInitializer() async {
  Get.put(HomeController());
  Get.put(ResourcesController());
  Get.put(CoursesController());
  Get.put(ReferencesController());
  Get.put(ProfessorsController());
  Get.put(ChartController());
}
