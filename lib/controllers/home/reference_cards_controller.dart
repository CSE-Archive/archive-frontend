import 'package:cse_archive/models/reference_model.dart';
import 'package:get/get.dart';

class ReferenceCardsController extends GetxController {
  var references = <ReferenceModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadReferences();
  }

  void loadReferences() {
    references.addAll([
      ReferenceModel(
        title: 'Introduction to Algorithms, 4rd Edition',
        authors: [
          'Thomas H. Cormen',
          'Charles E. Leiserson',
          'Ronald L. Rivest',
          'Clifford Stein',
        ],
        image: 'assets/images/clrs.jpeg',
      ),
      ReferenceModel(
        title: 'Introduction to Algorithms, 4rd Edition',
        authors: [
          'Thomas H. Cormen',
          'Charles E. Leiserson',
          'Ronald L. Rivest',
          'Clifford Stein',
        ],
        image: 'assets/images/clrs.jpeg',
      ),
      ReferenceModel(
        title: 'Introduction to Algorithms, 4rd Edition',
        authors: [
          'Thomas H. Cormen',
          'Charles E. Leiserson',
          'Ronald L. Rivest',
          'Clifford Stein',
        ],
        image: 'assets/images/clrs.jpeg',
      ),
      ReferenceModel(
        title: 'Introduction to Algorithms, 4rd Edition',
        authors: [
          'Thomas H. Cormen',
          'Charles E. Leiserson',
          'Ronald L. Rivest',
          'Clifford Stein',
        ],
        image: 'assets/images/clrs.jpeg',
      ),
      ReferenceModel(
        title: 'Introduction to Algorithms, 4rd Edition',
        authors: [
          'Thomas H. Cormen',
          'Charles E. Leiserson',
          'Ronald L. Rivest',
          'Clifford Stein',
        ],
        image: 'assets/images/clrs.jpeg',
      ),
      ReferenceModel(
        title: 'Introduction to Algorithms, 4rd Edition',
        authors: [
          'Thomas H. Cormen',
          'Charles E. Leiserson',
          'Ronald L. Rivest',
          'Clifford Stein',
        ],
        image: 'assets/images/clrs.jpeg',
      ),
      ReferenceModel(
        title: 'Introduction to Algorithms, 4rd Edition',
        authors: [
          'Thomas H. Cormen',
          'Charles E. Leiserson',
          'Ronald L. Rivest',
          'Clifford Stein',
        ],
        image: 'assets/images/clrs.jpeg',
      ),
      ReferenceModel(
        title: 'Introduction to Algorithms, 4rd Edition',
        authors: [
          'Thomas H. Cormen',
          'Charles E. Leiserson',
          'Ronald L. Rivest',
          'Clifford Stein',
        ],
        image: 'assets/images/clrs.jpeg',
      ),
      ReferenceModel(
        title: 'Introduction to Algorithms, 4rd Edition',
        authors: [
          'Thomas H. Cormen',
          'Charles E. Leiserson',
          'Ronald L. Rivest',
          'Clifford Stein',
        ],
        image: 'assets/images/clrs.jpeg',
      ),
      ReferenceModel(
        title: 'Introduction to Algorithms, 4rd Edition',
        authors: [
          'Thomas H. Cormen',
          'Charles E. Leiserson',
          'Ronald L. Rivest',
          'Clifford Stein',
        ],
        image: 'assets/images/clrs.jpeg',
      ),
    ]);
  }
}
