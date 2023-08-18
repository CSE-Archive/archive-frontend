import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/models/professor.dart';
import 'package:get/get.dart';

import 'search_text_field.dart';

class ProfessorsController extends GetxController with StateMixin {
  static const searchParameter = 'q';
  static const departmentParameter = 'department';

  late List<ProfessorModel> professors;

  late RxString selectedDepartment;

  final searchBarController = SearchTextFieldController();

  final departmentOptions = {
    'all': ArchiveStrings.professorsAll,
    'cse': ArchiveStrings.professorsDepartmentCSE,
    'electrical': ArchiveStrings.professorsDepartmentElectrical,
    'others': ArchiveStrings.professorsDepartmentOthers,
  };

  @override
  void onInit() async {
    super.onInit();

    selectedDepartment = departmentOptions.keys.first.obs;

    await fetchData();
  }

  void setParameters(Map<String, String> parameters) {
    parameters.forEach(
      (key, value) {
        switch (key) {
          case ProfessorsController.searchParameter:
            searchBarController.showClearButton(true);
            searchBarController.textController.text = value;
            break;
          case ProfessorsController.departmentParameter:
            selectedDepartment.value = value;
            break;
        }
      },
    );
  }

  Future<void> fetchData() async {
    change(null, status: RxStatus.loading());

    // TODO: Load data
    professors = [];

    change(null, status: RxStatus.success());
  }
}
