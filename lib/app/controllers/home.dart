import 'package:cse_archive/app/models/recorded_classroom.dart';
import 'package:cse_archive/app/models/reference.dart';
import 'package:cse_archive/app/models/resource.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin {
  late List<ResourceModel> resources;
  late List<ReferenceModel> references;
  late List<RecordedClassroomModel> recordings;

  @override
  void onInit() async {
    super.onInit();

    await fetchData();
  }

  Future<void> fetchData() async {
    change(null, status: RxStatus.loading());

    // TODO: Load data

    resources = [];
    references = [];
    recordings = [];

    change(null, status: RxStatus.success());
  }
}
