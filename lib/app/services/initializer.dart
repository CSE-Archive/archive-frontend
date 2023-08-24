import 'package:get/get.dart';

import 'api.dart';
import 'pages_tracker.dart';
import 'storage.dart';
import 'theme_mode.dart';

Future<void> servicesInitializer() async {
  await Get.putAsync<StorageService>(
    () => StorageService().init(),
    permanent: true,
  );

  Get.put(ThemeModeService(), permanent: true);
  Get.put(PageTrackerService(), permanent: true);
  Get.put(APIService(), permanent: true);
}
