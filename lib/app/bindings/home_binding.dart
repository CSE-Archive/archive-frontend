import 'package:cse_archive/app/controllers/home/reference_cards_controller.dart';
import 'package:cse_archive/app/controllers/home/resource_cards_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResourceCardsController());
    Get.lazyPut(() => ReferenceCardsController());
  }
}
