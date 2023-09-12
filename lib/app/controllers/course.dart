import 'package:cse_archive/app/models/course.dart';
import 'package:cse_archive/app/services/api.dart';
import 'package:get/get.dart';

class CourseController extends GetxController with StateMixin {
  final String uuid;

  CourseController({required this.uuid});

  CourseModel? course;

  Future<void> fetchData() async {
    change(null, status: RxStatus.loading());

    final result = await APIService.to.course(uuid: uuid);

    if (result != null) {
      course = result;

      change(null, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error());
    }
  }
}
