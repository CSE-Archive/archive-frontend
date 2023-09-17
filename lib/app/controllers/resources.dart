import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/models/resource.dart';
import 'package:cse_archive/app/models/resource_type.dart';
import 'package:cse_archive/app/services/api.dart';
import 'package:get/get.dart';

class ResourcesController extends GetxController with StateMixin {
  static const typeQueryParameter = 'type';
  static const typeQueryOptions = ResourceTypeModel.options;
  static const typeQueryDefault = ResourceTypeModel.defaultOption;

  final selectedType = typeQueryDefault.obs;

  int paginationCounter = 1;

  final resources = <ResourceModel>[].obs;
  final isThereMore = false.obs;
  final isLoadingMore = false.obs;

  void setQueryParameters(Map<String, String> queryParameters) {
    if (queryParameters.keys.contains(typeQueryParameter)) {
      final queryParameterValue = queryParameters[typeQueryParameter]!;

      selectedType.value = typeQueryOptions.firstWhere(
        (resourceType) =>
            resourceType.queryParameterValue == queryParameterValue,
        orElse: () => typeQueryDefault,
      );
    } else {
      selectedType.value = typeQueryDefault;
    }

    fetchData();
  }

  Future<void> fetchData() async {
    change(null, status: RxStatus.loading());

    final result = await APIService.to.resources(
      type: selectedType.value,
    );

    if (result != null) {
      paginationCounter = 1;

      isThereMore.value = result.isThereMore;
      resources.value = result.resources;
      resources.refresh();

      change(null, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error());
    }
  }

  Future<bool> loadMore() async {
    isLoadingMore.value = true;

    final result = await APIService.to.resources(
      type: selectedType.value,
      offset: kDataLimit * paginationCounter,
    );

    if (result == null) {
      isLoadingMore.value = false;
      return false;
    }

    paginationCounter++;

    isThereMore.value = result.isThereMore;
    resources.addAll(result.resources);
    resources.refresh();

    isLoadingMore.value = false;
    return true;
  }
}
