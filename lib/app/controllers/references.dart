import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/models/reference.dart';
import 'package:cse_archive/app/models/reference_type.dart';
import 'package:cse_archive/app/services/api.dart';
import 'package:get/get.dart';

import 'search_text_field.dart';

class ReferencesController extends GetxController with StateMixin {
  static const searchQueryParameter = 'search';
  static const typeQueryParameter = 'type';
  static const typeQueryOptions = ReferenceTypeModel.options;
  static const typeQueryDefault = ReferenceTypeModel.defaultOption;

  final searchController = SearchTextFieldController();
  final selectedType = typeQueryDefault.obs;

  int paginationCounter = 1;

  final references = <ReferenceModel>[].obs;
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
      search: searchController.textController.text,
    );

    if (result != null) {
      paginationCounter = 1;

      isThereMore.value = result.isThereMore;
      references.value = result.references;
      references.refresh();

      change(null, status: RxStatus.success());
    } else {
      // TODO: Show error view
      change(null, status: RxStatus.error());
    }
  }

  Future<void> loadMore() async {
    isLoadingMore.value = true;

    final result = await APIService.to.references(
      type: selectedType.value,
      search: searchController.textController.text,
      offset: kDataLimit * paginationCounter,
    );

    if (result != null) {
      paginationCounter++;

      isThereMore.value = result.isThereMore;
      references.addAll(result.references);
      references.refresh();
    } else {
      // TODO: Show error view
    }

    isLoadingMore.value = false;
  }
}
