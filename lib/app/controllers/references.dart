import 'package:cse_archive/app/models/reference.dart';
import 'package:get/get.dart';

import 'search_text_field.dart';

class ReferencesController extends GetxController with StateMixin {
  static const searchParameter = 'q';

  late List<ReferenceModel> references;

  final searchBarController = SearchTextFieldController();

  @override
  void onInit() async {
    super.onInit();

    await fetchData();
  }

  void setParameters(Map<String, String> parameters) {
    parameters.forEach(
      (key, value) {
        switch (key) {
          case ReferencesController.searchParameter:
            searchBarController.showClearButton(true);
            searchBarController.textController.text = value;
            break;
        }
      },
    );
  }

  Future<void> fetchData() async {
    change(null, status: RxStatus.loading());

    // TODO: Load data
    references = [];

    change(null, status: RxStatus.success());
  }
}
