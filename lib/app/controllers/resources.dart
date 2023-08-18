import 'package:cse_archive/app/models/resource.dart';
import 'package:get/get.dart';

class ResourcesController extends GetxController with StateMixin {
  late List<ResourceModel> resources;

  @override
  void onInit() async {
    super.onInit();

    await fetchData();
  }

  Future<void> fetchData() async {
    change(null, status: RxStatus.loading());

    // TODO: Load data
    resources = [];

    change(null, status: RxStatus.success());
  }
}
