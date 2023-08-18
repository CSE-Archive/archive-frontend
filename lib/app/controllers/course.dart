import 'package:cse_archive/app/models/course.dart';
import 'package:get/get.dart';

class CourseController extends GetxController with StateMixin {
  final int courseId;

  CourseController({required this.courseId});

  late CourseModel course;

  @override
  void onInit() async {
    super.onInit();

    await fetchData();
  }

  Future<void> fetchData() async {
    change(null, status: RxStatus.loading());

    // TODO: Load data

    change(null, status: RxStatus.success());
  }
}
