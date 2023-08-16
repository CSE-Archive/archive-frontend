import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/models/course.dart';
import 'package:get/get.dart';

import 'search_text_field.dart';

class CoursesController extends GetxController
    with StateMixin<List<CourseModel>> {
  late RxString selectedType;
  late RxString selectedUnits;

  final selectedExpansionTile = (-1).obs;

  final searchBarController = SearchTextFieldController();

  final typeOptions = {
    'all': ArchiveStrings.coursesAll,
    'specialized': ArchiveStrings.coursesTypeSpecialized,
    'optional': ArchiveStrings.coursesTypeOptional,
    'basic': ArchiveStrings.coursesTypeBasic,
    'general': ArchiveStrings.coursesTypeGeneral,
  };

  final unitsOptions = {
    'all': ArchiveStrings.coursesAll,
    '1': '۱',
    '2': '۲',
    '3': '۳',
  };

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
      CourseModel(
        id: 1,
        slug: 'Design-&-Implementation-of-Programming-Languages',
        name: 'طراحی الگوریتم',
        type: CourseType.specialized,
        units: 3,
      ),
      CourseModel(
        id: 1,
        slug: 'Design-&-Implementation-of-Programming-Languages',
        name: 'طراحی الگوریتم',
        type: CourseType.specialized,
        units: 3,
      ),
      CourseModel(
        id: 1,
        slug: 'Design-&-Implementation-of-Programming-Languages',
        name: 'طراحی الگوریتم',
        type: CourseType.specialized,
        units: 3,
      ),
      CourseModel(
        id: 1,
        slug: 'Design-&-Implementation-of-Programming-Languages',
        name: 'طراحی الگوریتم',
        type: CourseType.specialized,
        units: 3,
      ),
      CourseModel(
        id: 1,
        slug: 'Design-&-Implementation-of-Programming-Languages',
        name: 'طراحی الگوریتم',
        type: CourseType.specialized,
        units: 3,
      ),
      CourseModel(
        id: 1,
        slug: 'Design-&-Implementation-of-Programming-Languages',
        name: 'طراحی الگوریتم',
        type: CourseType.specialized,
        units: 3,
      ),
      CourseModel(
        id: 1,
        slug: 'Design-&-Implementation-of-Programming-Languages',
        name: 'طراحی الگوریتم',
        type: CourseType.specialized,
        units: 3,
      ),
      CourseModel(
        id: 1,
        slug: 'Design-&-Implementation-of-Programming-Languages',
        name: 'طراحی الگوریتم',
        type: CourseType.specialized,
        units: 3,
      ),
      CourseModel(
        id: 1,
        slug: 'Design-&-Implementation-of-Programming-Languages',
        name: 'طراحی الگوریتم',
        type: CourseType.specialized,
        units: 3,
      ),
      CourseModel(
        id: 1,
        slug: 'Design-&-Implementation-of-Programming-Languages',
        name: 'طراحی الگوریتم',
        type: CourseType.specialized,
        units: 3,
      ),
    ];

    change(result, status: RxStatus.success());
  }
}
