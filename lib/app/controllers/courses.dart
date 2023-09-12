import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/models/course.dart';
import 'package:cse_archive/app/models/course_type.dart';
import 'package:cse_archive/app/models/course_units.dart';
import 'package:cse_archive/app/services/api.dart';
import 'package:get/get.dart';

import 'search_text_field.dart';

class CoursesController extends GetxController with StateMixin {
  static const searchQueryParameter = 'search';
  static const typeQueryParameter = 'type';
  static const unitsQueryParameter = 'units';
  static const typeQueryOptions = CourseTypeModel.options;
  static const unitsQueryOptions = CourseUnitsModel.options;
  static const typeQueryDefault = CourseTypeModel.defaultOption;
  static const unitsQueryDefault = CourseUnitsModel.defaultOption;

  final searchController = SearchTextFieldController();
  final selectedType = typeQueryDefault.obs;
  final selectedUnits = unitsQueryDefault.obs;

  int paginationCounter = 1;

  final courses = <CourseModel>[].obs;
  final isThereMore = false.obs;
  final isLoadingMore = false.obs;

  void setQueryParameters(Map<String, String> queryParameters) {
    if (queryParameters.keys.contains(searchQueryParameter)) {
      searchController.textController.text =
          queryParameters[searchQueryParameter]!;
    } else {
      searchController.textController.clear();
    }

    if (queryParameters.keys.contains(typeQueryParameter)) {
      final queryParameterValue = queryParameters[typeQueryParameter]!;

      selectedType.value = typeQueryOptions.firstWhere(
        (courseType) => courseType.queryParameterValue == queryParameterValue,
        orElse: () => typeQueryDefault,
      );
    } else {
      selectedType.value = typeQueryDefault;
    }

    if (queryParameters.keys.contains(unitsQueryParameter)) {
      final queryParameterValue = queryParameters[unitsQueryParameter]!;

      selectedUnits.value = unitsQueryOptions.firstWhere(
        (courseUnits) => courseUnits.queryParameterValue == queryParameterValue,
        orElse: () => unitsQueryDefault,
      );
    } else {
      selectedUnits.value = unitsQueryDefault;
    }

    fetchData();
  }

  Future<void> fetchData() async {
    change(null, status: RxStatus.loading());

    final result = await APIService.to.courses(
      type: selectedType.value,
      units: selectedUnits.value,
      search: searchController.textController.text,
    );

    if (result != null) {
      paginationCounter = 1;

      isThereMore.value = result.isThereMore;
      courses.value = result.courses;
      courses.refresh();

      change(null, status: RxStatus.success());
    } else {
      // TODO: Show error view
      change(null, status: RxStatus.error());
    }
  }

  Future<void> loadMore() async {
    isLoadingMore.value = true;

    final result = await APIService.to.courses(
      type: selectedType.value,
      units: selectedUnits.value,
      search: searchController.textController.text,
      offset: kDataLimit * paginationCounter,
    );

    if (result != null) {
      paginationCounter++;

      isThereMore.value = result.isThereMore;
      courses.addAll(result.courses);
      courses.refresh();
    } else {
      // TODO: Show error view
    }

    isLoadingMore.value = false;
  }
}
