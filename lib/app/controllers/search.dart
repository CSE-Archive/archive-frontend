import 'package:cse_archive/app/models/course.dart';
import 'package:cse_archive/app/models/professor.dart';
import 'package:cse_archive/app/models/reference.dart';
import 'package:cse_archive/app/services/api.dart';
import 'package:get/get.dart';

import 'general.dart';

class SearchViewController extends GetxController with StateMixin {
  static const searchQueryParameter = 'q';

  final appbarSearchController =
      Get.find<GeneralController>().appbarSearchController;

  final courses = <CourseModel>[].obs;
  final references = <ReferenceModel>[].obs;
  final professors = <ProfessorModel>[].obs;

  void setQueryParameters(Map<String, String> queryParameters) {
    if (queryParameters.keys.contains(searchQueryParameter)) {
      appbarSearchController.text = queryParameters[searchQueryParameter]!;
    } else {
      appbarSearchController.clear();
    }

    fetchData();
  }

  Future<void> fetchData() async {
    change(null, status: RxStatus.loading());

    final result = await APIService.to.search(
      query: appbarSearchController.text,
    );

    if (result != null) {
      courses.value = result.courses;
      references.value = result.references;
      professors.value = result.professors;

      change(null, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error());
    }
  }
}
