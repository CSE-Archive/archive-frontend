import 'package:get/get.dart';

import 'chart.dart';
import 'courses.dart';
import 'home/reference_cards_controller.dart';
import 'home/resource_cards_controller.dart';
import 'professors.dart';
import 'references.dart';
import 'resources.dart';

Future<void> controllersInitializer() async {
  Get.put(ResourceCardsController());
  Get.put(ReferenceCardsController());

  Get.put(ResourcesController());

  Get.put(CoursesController());

  Get.put(ReferencesController());

  Get.put(ProfessorsController());

  Get.put(ChartController());
}
