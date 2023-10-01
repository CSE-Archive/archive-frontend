import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/models/reference.dart';
import 'package:cse_archive/app/models/reference_type_enum.dart';
import 'package:cse_archive/app/services/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReferencesController extends GetxController with StateMixin {
  static const searchQueryParameter = 'search';
  static const typeQueryParameter = 'type';
  static const typeQueryDefault = ReferenceTypeEnumModel.none;
  static const typeQueryOptions = ReferenceTypeEnumModel.values;

  final selectedType = typeQueryDefault.obs;

  final searchController = TextEditingController();
  final searchControllerEmpty = true.obs;

  int paginationCounter = 1;

  final references = <ReferenceModel>[].obs;
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
        (referenceType) =>
            referenceType.queryParameterValue == queryParameterValue,
        orElse: () => typeQueryDefault,
      );
    } else {
      selectedType.value = typeQueryDefault;
    }

    fetchData();
  }

  Future<void> fetchData() async {
    change(null, status: RxStatus.loading());

    final result = await APIService.to.references(
      type: selectedType.value,
      search: searchController.text,
    );

    if (result != null) {
      paginationCounter = 1;

      isThereMore.value = result.isThereMore;
      references.value = result.references;
      references.refresh();

      change(null, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error());
    }
  }

  Future<bool> loadMore() async {
    isLoadingMore.value = true;

    final result = await APIService.to.references(
      type: selectedType.value,
      search: searchController.text,
      offset: kDataLimit * paginationCounter,
    );

    if (result == null) {
      isLoadingMore.value = false;
      return false;
    }

    paginationCounter++;

    isThereMore.value = result.isThereMore;
    references.addAll(result.references);
    references.refresh();

    isLoadingMore.value = false;
    return true;
  }
}
