import 'package:cse_archive/controllers/general/searchbar_controller.dart';
import 'package:cse_archive/models/teacher_model.dart';
import 'package:get/get.dart';

class TeachersController extends GetxController
    with StateMixin<List<TeacherModel>> {
  var searchBarController = Get.put(
    SearchBarController(),
    tag: 'teachersSearchBar',
  );
  var departmentOptions = {
    'all': 'teachersAll'.tr,
    'cse': 'teachersDepartmentCSE'.tr,
    'electrical': 'teachersDepartmentElectrical'.tr,
    'others': 'teachersDepartmentOthers'.tr,
  };
  late RxString selectedDepartment;
  var selectedExpansionTile = (-1).obs;

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
