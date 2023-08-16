import 'package:get/get.dart';

import 'pages_tracker.dart';
import 'storage_service.dart';
import 'theme_mode.dart';

Future<void> servicesInitializer() async {
  await Get.putAsync<StorageService>(
    () => StorageService().init(),
    permanent: true,
  );

  Get.put(ThemeModeService(), permanent: true);
  Get.put(PageTrackerService(), permanent: true);
}
