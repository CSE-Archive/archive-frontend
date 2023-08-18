import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/models/course.dart';
import 'package:get/get.dart';

import 'search_text_field.dart';

class CoursesController extends GetxController with StateMixin {
  static const searchParameter = 'q';
  static const typeParameter = 'type';
  static const unitsParameter = 'units';

  late List<CourseModel> courses;

  late RxString selectedType;
  late RxString selectedUnits;

  final searchBarController = SearchTextFieldController();

  final typeOptions = {
    'all': ArchiveStrings.coursesAll,
    'specialized': CourseType.specialized.toString(),
    'optional': CourseType.optional.toString(),
    'basic': CourseType.basic.toString(),
    'general': CourseType.general.toString(),
  };

  final unitsOptions = {
    'all': ArchiveStrings.coursesAll,
    '1': UnitsType.one.toString(),
    '2': UnitsType.two.toString(),
    '3': UnitsType.three.toString(),
  };

  @override
  void onInit() async {
    super.onInit();

    selectedType = typeOptions.keys.first.obs;
    selectedUnits = unitsOptions.keys.first.obs;

    await fetchData();
  }

  void setParameters(Map<String, String> parameters) {
    parameters.forEach(
      (key, value) {
        switch (key) {
          case CoursesController.searchParameter:
            searchBarController.showClearButton(true);
            searchBarController.textController.text = value;
            break;
          case CoursesController.typeParameter:
            selectedType.value = value;
            break;
          case CoursesController.unitsParameter:
            selectedUnits.value = value;
            break;
        }
      },
    );
  }

  Future<void> fetchData() async {
    change(null, status: RxStatus.loading());

    // TODO: Load data

    courses = [];

    change(null, status: RxStatus.success());
  }
}
