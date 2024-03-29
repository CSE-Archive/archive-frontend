import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/models/course.dart';
import 'package:cse_archive/app/models/course_type_enum.dart';
import 'package:cse_archive/app/models/course_units_enum.dart';
import 'package:cse_archive/app/services/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoursesController extends GetxController with StateMixin {
  static const searchQueryParameter = 'search';
  static const typeQueryParameter = 'type';
  static const unitsQueryParameter = 'units';
  static const typeQueryOptions = CourseTypeEnumModel.values;
  static const unitsQueryOptions = CourseUnitsEnumModel.values;
  static const typeQueryDefault = CourseTypeEnumModel.none;
  static const unitsQueryDefault = CourseUnitsEnumModel.none;

  final selectedType = typeQueryDefault.obs;
  final selectedUnits = unitsQueryDefault.obs;

  final searchController = TextEditingController();
  final searchControllerEmpty = true.obs;

  int paginationCounter = 1;

  final courses = <CourseModel>[].obs;
  final isThereMore = false.obs;
  final isLoadingMore = false.obs;

  @override
  void onInit() {
    super.onInit();

    searchController.addListener(
      () {
        searchControllerEmpty.value = searchController.text.isEmpty;
        searchControllerEmpty.refresh();
      },
    );
  }

  @override
  void onClose() {
    searchController.dispose();

    super.onClose();
  }

  void setQueryParameters(Map<String, String> queryParameters) {
    if (queryParameters.keys.contains(searchQueryParameter)) {
      searchController.text = queryParameters[searchQueryParameter]!;
    } else {
      searchController.clear();
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
      search: searchController.text,
    );

    if (result != null) {
      paginationCounter = 1;

      isThereMore.value = result.isThereMore;
      courses.value = result.courses;
      courses.refresh();

      change(null, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error());
    }
  }

  Future<bool> loadMore() async {
    isLoadingMore.value = true;

    final result = await APIService.to.courses(
      type: selectedType.value,
      units: selectedUnits.value,
      search: searchController.text,
      offset: kDataLimit * paginationCounter,
    );

    if (result == null) {
      isLoadingMore.value = false;
      return false;
    }

    paginationCounter++;

    isThereMore.value = result.isThereMore;
    courses.addAll(result.courses);
    courses.refresh();

    isLoadingMore.value = false;
    return true;
  }
}
