import 'package:cse_archive/app/controllers/chart.dart';
import 'package:get/get.dart';

class ChartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChartController());
  }
}
