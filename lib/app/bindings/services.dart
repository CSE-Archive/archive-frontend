import 'package:cse_archive/app/services/api.dart';
import 'package:cse_archive/app/services/pages_tracker.dart';
import 'package:cse_archive/app/services/storage.dart';
import 'package:cse_archive/app/services/theme_mode.dart';
import 'package:get/get.dart';

Future<void> servicesBinding() async {
  await Get.putAsync<StorageService>(
    () => StorageService().init(),
    permanent: true,
  );

  Get.put(ThemeModeService(), permanent: true);
  Get.put(PageTrackerService(), permanent: true);
  Get.put(APIService(), permanent: true);
}
