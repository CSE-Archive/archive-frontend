import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService extends GetxService {
  static StorageService get to => Get.find();

  late SharedPreferences storage;

  Future<StorageService> init() async {
    storage = await SharedPreferences.getInstance();

    return this;
  }
}
