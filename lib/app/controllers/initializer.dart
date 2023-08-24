import 'package:cse_archive/app/controllers/recordings.dart';
import 'package:get/get.dart';

import 'chart.dart';
import 'courses.dart';
import 'home.dart';
import 'professors.dart';
import 'references.dart';
import 'resources.dart';

Future<void> controllersInitializer() async {
  Get.put(HomeController());
  Get.put(ChartController());
  Get.put(CoursesController());
  Get.put(RecordingsController());
  Get.put(ReferencesController());
  Get.put(ResourcesController());
  Get.put(ProfessorsController());
}
