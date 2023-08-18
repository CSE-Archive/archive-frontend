import 'package:cse_archive/app/controllers/search_text_field.dart';
import 'package:cse_archive/app/models/course.dart';
import 'package:cse_archive/app/models/professor.dart';
import 'package:cse_archive/app/models/recorded_classroom.dart';
import 'package:cse_archive/app/models/reference.dart';
import 'package:get/get.dart';

class SearchViewController extends GetxController with StateMixin {
  static const searchParameter = 'q';

  String query;

  SearchViewController(this.query);

  late List<CourseModel> courses;
  late List<ReferenceModel> references;
  late List<ProfessorModel> professors;
  late List<RecordedClassroomModel> recordings;

  @override
  void onInit() async {
    super.onInit();

    await fetchData();
  }

  @override
  void onClose() {
    final searchBarController =
        Get.find<SearchTextFieldController>(tag: 'appbar');

    searchBarController.textController.clear();
    searchBarController.showClearButton(false);

    super.onClose();
  }

  void setParameters(Map<String, String> parameters) {
    parameters.forEach(
      (key, value) {
        switch (key) {
          case SearchViewController.searchParameter:
            query = value;
            fetchData();

            final searchBarController =
                Get.find<SearchTextFieldController>(tag: 'appbar');

            searchBarController.showClearButton(true);
            searchBarController.textController.text = value;

            break;
        }
      },
    );
  }

  Future<void> fetchData() async {
    change(null, status: RxStatus.loading());

    // TODO: Load data

    courses = [];
    references = [];
    professors = [];
    recordings = [];

    change(null, status: RxStatus.success());
  }
}
