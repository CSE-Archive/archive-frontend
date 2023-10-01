import 'package:cse_archive/app/models/recorded_classroom.dart';
import 'package:cse_archive/app/services/api.dart';
import 'package:get/get.dart';

class RecordingController extends GetxController with StateMixin {
  final String uuid;

  RecordingController({required this.uuid});

  RecordedClassroomModel? recording;

  Future<void> fetchData() async {
    change(null, status: RxStatus.loading());

    final result = await APIService.to.recording(uuid: uuid);

    if (result != null) {
      recording = result;

      change(null, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error());
    }
  }
}
