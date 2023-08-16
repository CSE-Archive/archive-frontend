import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/models/professor.dart';
import 'package:get/get.dart';

import 'search_text_field.dart';

class ProfessorsController extends GetxController
    with StateMixin<List<ProfessorModel>> {
  late RxString selectedDepartment;

  final searchBarController = SearchTextFieldController();

  final departmentOptions = {
    'all': ArchiveStrings.professorsAll,
    'cse': ArchiveStrings.professorsDepartmentCSE,
    'electrical': ArchiveStrings.professorsDepartmentElectrical,
    'others': ArchiveStrings.professorsDepartmentOthers,
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
      ProfessorModel(
        id: 1,
        image: 'assets/_/clrs.jpeg',
        slug: 'introduction-to-algorithms-4rd-edition',
        department: 'مهندسی کامپیوتر',
        honorific: 'دکتر',
        firstName: 'کوروش',
        lastName: 'زیارتی',
      ),
      ProfessorModel(
        id: 1,
        image: 'assets/_/clrs.jpeg',
        slug: 'introduction-to-algorithms-4rd-edition',
        department: 'مهندسی کامپیوتر',
        honorific: 'دکتر',
        firstName: 'کوروش',
        lastName: 'زیارتی',
      ),
      ProfessorModel(
        id: 1,
        image: 'assets/_/clrs.jpeg',
        slug: 'introduction-to-algorithms-4rd-edition',
        department: 'مهندسی کامپیوتر',
        honorific: 'دکتر',
        firstName: 'کوروش',
        lastName: 'زیارتی',
      ),
      ProfessorModel(
        id: 1,
        image: 'assets/_/clrs.jpeg',
        slug: 'introduction-to-algorithms-4rd-edition',
        department: 'مهندسی کامپیوتر',
        honorific: 'دکتر',
        firstName: 'کوروش',
        lastName: 'زیارتی',
      ),
      ProfessorModel(
        id: 1,
        image: 'assets/_/clrs.jpeg',
        slug: 'introduction-to-algorithms-4rd-edition',
        department: 'مهندسی کامپیوتر',
        honorific: 'دکتر',
        firstName: 'کوروش',
        lastName: 'زیارتی',
      ),
      ProfessorModel(
        id: 1,
        image: 'assets/_/clrs.jpeg',
        slug: 'introduction-to-algorithms-4rd-edition',
        department: 'مهندسی کامپیوتر',
        honorific: 'دکتر',
        firstName: 'کوروش',
        lastName: 'زیارتی',
      ),
      ProfessorModel(
        id: 1,
        image: 'assets/_/clrs.jpeg',
        slug: 'introduction-to-algorithms-4rd-edition',
        department: 'مهندسی کامپیوتر',
        honorific: 'دکتر',
        firstName: 'کوروش',
        lastName: 'زیارتی',
      ),
      ProfessorModel(
        id: 1,
        image: 'assets/_/clrs.jpeg',
        slug: 'introduction-to-algorithms-4rd-edition',
        department: 'مهندسی کامپیوتر',
        honorific: 'دکتر',
        firstName: 'کوروش',
        lastName: 'زیارتی',
      ),
      ProfessorModel(
        id: 1,
        image: 'assets/_/clrs.jpeg',
        slug: 'introduction-to-algorithms-4rd-edition',
        department: 'مهندسی کامپیوتر',
        honorific: 'دکتر',
        firstName: 'کوروش',
        lastName: 'زیارتی',
      ),
      ProfessorModel(
        id: 1,
        image: 'assets/_/clrs.jpeg',
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
