import 'package:cse_archive/controllers/general/searchbar_controller.dart';
import 'package:cse_archive/models/reference_model.dart';
import 'package:get/get.dart';

class ReferencesController extends GetxController
    with StateMixin<List<ReferenceModel>> {
  var searchBarController = Get.put(
    SearchBarController(),
    tag: 'referencesSearchBar',
  );
  var selectedExpansionTile = (-1).obs;

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
