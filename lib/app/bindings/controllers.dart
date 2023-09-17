import 'package:cse_archive/app/controllers/general.dart';
import 'package:get/get.dart';

Future<void> controllersBinding() async {
  Get.put(GeneralController(), permanent: true);
}
