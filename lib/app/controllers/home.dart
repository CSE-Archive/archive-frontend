import 'package:cse_archive/app/models/recorded_classroom.dart';
import 'package:cse_archive/app/models/reference.dart';
import 'package:cse_archive/app/models/resource.dart';
import 'package:cse_archive/app/services/api.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin {
  late List<ResourceModel> resources;
  late List<RecordedClassroomModel> recordings;
  late List<ReferenceModel> references;

  @override
  void onInit() async {
    super.onInit();

    await fetchData();
  }

  Future<void> fetchData() async {
    change(null, status: RxStatus.loading());

    final result = await APIService.to.home();

    if (result != null) {
      resources = result.resources;
      recordings = result.recordings;
      references = result.references;

      change(null, status: RxStatus.success());
    } else {
      // TODO: Show error view
      change(null, status: RxStatus.error());
    }
  }
}
