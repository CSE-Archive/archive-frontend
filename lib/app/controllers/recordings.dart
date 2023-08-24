import 'package:cse_archive/app/models/recorded_classroom.dart';
import 'package:get/get.dart';

class RecordingsController extends GetxController with StateMixin {
  late List<RecordedClassroomModel> recordings;

  @override
  void onInit() async {
    super.onInit();

    await fetchData();
  }

  Future<void> fetchData() async {
    change(null, status: RxStatus.loading());

    // TODO: Load data
    recordings = [];

    change(null, status: RxStatus.success());
  }
}
