import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/models/professor_department.dart';
import 'package:cse_archive/app/models/professor.dart';
import 'package:cse_archive/app/services/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfessorsController extends GetxController with StateMixin {
  static const searchQueryParameter = 'search';
  static const departmentQueryParameter = 'department';
  static const departmentQueryDefault = ProfessorDepartmentModel.defaultOption;

  late List<ProfessorDepartmentModel> departmentQueryOptions = [];

  final selectedDepartment = departmentQueryDefault.obs;

  final searchController = TextEditingController();
  final searchControllerEmpty = true.obs;

  int paginationCounter = 1;

  final professors = <ProfessorModel>[].obs;
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

  Future<void> setQueryParameters(Map<String, String> queryParameters) async {
    await _fetchOptions();

    if (queryParameters.keys.contains(searchQueryParameter)) {
      searchController.text = queryParameters[searchQueryParameter]!;
    } else {
      searchController.clear();
    }

    if (queryParameters.keys.contains(departmentQueryParameter)) {
      final queryParameterValue = queryParameters[departmentQueryParameter]!;

      selectedDepartment.value = departmentQueryOptions.firstWhere(
        (professorDepartment) =>
            professorDepartment.queryParameterValue == queryParameterValue,
        orElse: () => departmentQueryDefault,
      );
    } else {
      selectedDepartment.value = departmentQueryDefault;
    }

    fetchData();
  }

  Future<void> _fetchOptions() async {
    if (departmentQueryOptions.isEmpty) {
      change(null, status: RxStatus.loading());

      final options = await APIService.to.professorDepartments();

      if (options != null) {
        departmentQueryOptions = [ProfessorDepartmentModel.defaultOption];
        departmentQueryOptions.addAll(options);

        change(null, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.error());
      }
    }
  }

  Future<void> fetchData() async {
    change(null, status: RxStatus.loading());

    final result = await APIService.to.professors(
      department: selectedDepartment.value,
      search: searchController.text,
    );

    if (result != null) {
      paginationCounter = 1;

      isThereMore.value = result.isThereMore;
      professors.value = result.professors;
      professors.refresh();

      change(null, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error());
    }
  }

  Future<bool> loadMore() async {
    isLoadingMore.value = true;

    final result = await APIService.to.professors(
      department: selectedDepartment.value,
      search: searchController.text,
      offset: kDataLimit * paginationCounter,
    );

    if (result == null) {
      isLoadingMore.value = false;
      return false;
    }

    paginationCounter++;

    isThereMore.value = result.isThereMore;
    professors.addAll(result.professors);
    professors.refresh();

    isLoadingMore.value = false;
    return true;
  }
}
