import 'package:cse_archive/app/models/reference.dart';
import 'package:get/get.dart';

import 'search_text_field.dart';

class ReferencesController extends GetxController
    with StateMixin<List<ReferenceModel>> {
  final searchBarController = SearchTextFieldController();
  final selectedExpansionTile = (-1).obs;

  @override
  void onInit() {
    super.onInit();

    fetchData();
  }

  void setParameters(Map<String, String> parameters) {
    parameters.forEach((key, value) {
      switch (key) {
        case 'q':
          searchBarController.showClearButton(true);
          searchBarController.textController.text = value;
          break;
      }
    });
  }

  Future<void> fetchData() async {
    final result = [
      ReferenceModel(
        id: 1,
        title: 'Introduction to Algorithms, 4rd Edition',
        authors: [
          'Thomas H. Cormen',
          'Charles E. Leiserson',
          'Ronald L. Rivest',
          'Clifford Stein',
        ],
        image: 'assets/images/clrs.jpeg',
        slug: 'introduction-to-algorithms-4rd-edition',
      ),
      ReferenceModel(
        id: 1,
        title: 'Introduction to Algorithms, 4rd Edition',
        authors: [
          'Thomas H. Cormen',
          'Charles E. Leiserson',
          'Ronald L. Rivest',
          'Clifford Stein',
        ],
        image: 'assets/images/clrs.jpeg',
        slug: 'introduction-to-algorithms-4rd-edition',
      ),
      ReferenceModel(
        id: 1,
        title: 'Introduction to Algorithms, 4rd Edition',
        authors: [
          'Thomas H. Cormen',
          'Charles E. Leiserson',
          'Ronald L. Rivest',
          'Clifford Stein',
        ],
        image: 'assets/images/clrs.jpeg',
        slug: 'introduction-to-algorithms-4rd-edition',
      ),
      ReferenceModel(
        id: 1,
        title: 'Introduction to Algorithms, 4rd Edition',
        authors: [
          'Thomas H. Cormen',
          'Charles E. Leiserson',
          'Ronald L. Rivest',
          'Clifford Stein',
        ],
        image: 'assets/images/clrs.jpeg',
        slug: 'introduction-to-algorithms-4rd-edition',
      ),
      ReferenceModel(
        id: 1,
        title: 'Introduction to Algorithms, 4rd Edition',
        authors: [
          'Thomas H. Cormen',
          'Charles E. Leiserson',
          'Ronald L. Rivest',
          'Clifford Stein',
        ],
        image: 'assets/images/clrs.jpeg',
        slug: 'introduction-to-algorithms-4rd-edition',
      ),
      ReferenceModel(
        id: 1,
        title: 'Introduction to Algorithms, 4rd Edition',
        authors: [
          'Thomas H. Cormen',
          'Charles E. Leiserson',
          'Ronald L. Rivest',
          'Clifford Stein',
        ],
        image: 'assets/images/clrs.jpeg',
        slug: 'introduction-to-algorithms-4rd-edition',
      ),
    ];

    change(result, status: RxStatus.success());
  }
}
