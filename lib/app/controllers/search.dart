import 'package:cse_archive/app/controllers/search_text_field.dart';
import 'package:cse_archive/app/models/course.dart';
import 'package:cse_archive/app/models/professor.dart';
import 'package:cse_archive/app/models/reference.dart';
import 'package:cse_archive/app/services/api.dart';
import 'package:get/get.dart';

class SearchViewController extends GetxController with StateMixin {
  static const searchQueryParameter = 'q';

  final searchController = Get.find<SearchTextFieldController>(tag: 'appbar');

  final courses = <CourseModel>[].obs;
  final references = <ReferenceModel>[].obs;
  final professors = <ProfessorModel>[].obs;

  void setQueryParameters(Map<String, String> queryParameters) {
    if (queryParameters.keys.contains(searchQueryParameter)) {
      searchController.textController.text =
          queryParameters[searchQueryParameter]!;
    } else {
      searchController.textController.clear();
    }

    fetchData();
  }

  Future<void> fetchData() async {
    change(null, status: RxStatus.loading());

    final result = await APIService.to.search(
      query: searchController.textController.text,
    );

    if (result != null) {
      courses.value = result.courses;
      references.value = result.references;
      professors.value = result.professors;

      change(null, status: RxStatus.success());
    } else {
      // TODO: Show error view
      change(null, status: RxStatus.error());
    }
  }
}
