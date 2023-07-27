import 'package:cse_archive/app/models/teacher.dart';
import 'package:get/get.dart';

import 'search_text_field.dart';

class TeachersController extends GetxController
    with StateMixin<List<TeacherModel>> {
  late RxString selectedDepartment;

  final searchBarController = SearchTextFieldController();

  final departmentOptions = {
    'all': 'teachersAll'.tr,
    'cse': 'teachersDepartmentCSE'.tr,
    'electrical': 'teachersDepartmentElectrical'.tr,
    'others': 'teachersDepartmentOthers'.tr,
  };

  final selectedExpansionTile = (-1).obs;

  @override
  void onInit() {
    super.onInit();

    selectedDepartment = departmentOptions.keys.first.obs;
    fetchData();
  }

  void setParameters(Map<String, String> parameters) {
    parameters.forEach((key, value) {
      switch (key) {
        case 'q':
          searchBarController.showClearButton(true);
          searchBarController.textController.text = value;
          break;
        case 'department':
          selectedDepartment.value = value;
          break;
      }
    });
  }

  Future<void> fetchData() async {
    final result = [
      TeacherModel(
        id: 1,
        image: 'assets/images/clrs.jpeg',
        slug: 'introduction-to-algorithms-4rd-edition',
        department: 'مهندسی کامپیوتر',
        honorific: 'دکتر',
        firstName: 'کوروش',
        lastName: 'زیارتی',
      ),
      TeacherModel(
        id: 1,
        image: 'assets/images/clrs.jpeg',
        slug: 'introduction-to-algorithms-4rd-edition',
        department: 'مهندسی کامپیوتر',
        honorific: 'دکتر',
        firstName: 'کوروش',
        lastName: 'زیارتی',
      ),
      TeacherModel(
        id: 1,
        image: 'assets/images/clrs.jpeg',
        slug: 'introduction-to-algorithms-4rd-edition',
        department: 'مهندسی کامپیوتر',
        honorific: 'دکتر',
        firstName: 'کوروش',
        lastName: 'زیارتی',
      ),
      TeacherModel(
        id: 1,
        image: 'assets/images/clrs.jpeg',
        slug: 'introduction-to-algorithms-4rd-edition',
        department: 'مهندسی کامپیوتر',
        honorific: 'دکتر',
        firstName: 'کوروش',
        lastName: 'زیارتی',
      ),
      TeacherModel(
        id: 1,
        image: 'assets/images/clrs.jpeg',
        slug: 'introduction-to-algorithms-4rd-edition',
        department: 'مهندسی کامپیوتر',
        honorific: 'دکتر',
        firstName: 'کوروش',
        lastName: 'زیارتی',
      ),
      TeacherModel(
        id: 1,
        image: 'assets/images/clrs.jpeg',
        slug: 'introduction-to-algorithms-4rd-edition',
        department: 'مهندسی کامپیوتر',
        honorific: 'دکتر',
        firstName: 'کوروش',
        lastName: 'زیارتی',
      ),
      TeacherModel(
        id: 1,
        image: 'assets/images/clrs.jpeg',
        slug: 'introduction-to-algorithms-4rd-edition',
        department: 'مهندسی کامپیوتر',
        honorific: 'دکتر',
        firstName: 'کوروش',
        lastName: 'زیارتی',
      ),
      TeacherModel(
        id: 1,
        image: 'assets/images/clrs.jpeg',
        slug: 'introduction-to-algorithms-4rd-edition',
        department: 'مهندسی کامپیوتر',
        honorific: 'دکتر',
        firstName: 'کوروش',
        lastName: 'زیارتی',
      ),
      TeacherModel(
        id: 1,
        image: 'assets/images/clrs.jpeg',
        slug: 'introduction-to-algorithms-4rd-edition',
        department: 'مهندسی کامپیوتر',
        honorific: 'دکتر',
        firstName: 'کوروش',
        lastName: 'زیارتی',
      ),
      TeacherModel(
        id: 1,
        image: 'assets/images/clrs.jpeg',
        slug: 'introduction-to-algorithms-4rd-edition',
        department: 'مهندسی کامپیوتر',
        honorific: 'دکتر',
        firstName: 'کوروش',
        lastName: 'زیارتی',
      ),
    ];

    change(result, status: RxStatus.success());
  }
}
