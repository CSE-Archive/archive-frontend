import 'package:cse_archive/controllers/general/searchbar_controller.dart';
import 'package:get/get.dart';

class CoursesController extends GetxController with StateMixin<List<Map>> {
  var searchBarController = Get.put(
    SearchBarController(),
    tag: 'coursesSearchBar',
  );
  var typeOptions = {
    'all': 'coursesAll'.tr,
    'specialized': 'coursesTypeSpecialized'.tr,
    'optional': 'coursesTypeOptional'.tr,
    'basic': 'coursesTypeBasic'.tr,
    'general': 'coursesTypeGeneral'.tr,
  };
  var unitsOptions = {
    'all': 'coursesAll'.tr,
    '1': '۱',
    '2': '۲',
    '3': '۳',
  };
  late RxString selectedType;
  late RxString selectedUnits;
  var selectedExpansionTile = (-1).obs;

  @override
  void onInit() {
    super.onInit();
    selectedType = typeOptions.keys.first.obs;
    selectedUnits = unitsOptions.keys.first.obs;
    fetchData();
  }

  void setParameters(Map<String, String> parameters) {
    parameters.forEach((key, value) {
      switch (key) {
        case 'q':
          searchBarController.showClearButton(true);
          searchBarController.textController.text = value;
          break;
        case 'type':
          selectedType.value = value;
          break;
        case 'units':
          selectedUnits.value = value;
          break;
      }
    });
  }

  Future<void> fetchData() async {
    final result = [
      {
        'title': 'طراحی الگوریتم 2',
        'unit': 3,
        'type': 'تخصصی',
      },
      {
        'title': 'طراحی الگوریتم 3',
        'unit': 3,
        'type': 'تخصصی',
      },
      {
        'title': 'طراحی الگوریتم 2',
        'unit': 3,
        'type': 'تخصصی',
      },
      {
        'title': 'طراحی الگوریتم 3',
        'unit': 3,
        'type': 'تخصصی',
      },
      {
        'title': 'طراحی الگوریتم 2',
        'unit': 3,
        'type': 'تخصصی',
      },
      {
        'title': 'طراحی الگوریتم 3',
        'unit': 3,
        'type': 'تخصصی',
      },
      {
        'title': 'طراحی الگوریتم 2',
        'unit': 3,
        'type': 'تخصصی',
      },
      {
        'title': 'طراحی الگوریتم 3',
        'unit': 3,
        'type': 'تخصصی',
      },
      {
        'title': 'طراحی الگوریتم 2',
        'unit': 3,
        'type': 'تخصصی',
      },
      {
        'title': 'طراحی الگوریتم 3',
        'unit': 3,
        'type': 'تخصصی',
      },
      {
        'title': 'طراحی الگوریتم 2',
        'unit': 3,
        'type': 'تخصصی',
      },
      {
        'title': 'طراحی الگوریتم 3',
        'unit': 3,
        'type': 'تخصصی',
      },
      {
        'title': 'طراحی الگوریتم 2',
        'unit': 3,
        'type': 'تخصصی',
      },
      {
        'title': 'طراحی الگوریتم 3',
        'unit': 3,
        'type': 'تخصصی',
      },
    ];

    change(result, status: RxStatus.success());
  }
}