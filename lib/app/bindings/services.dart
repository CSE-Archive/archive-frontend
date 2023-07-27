import 'package:cse_archive/app/services/pages_tracker.dart';
import 'package:get/get.dart';

class ArchiveServicesBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put(PageTrackerService(), permanent: true);
  }
}
