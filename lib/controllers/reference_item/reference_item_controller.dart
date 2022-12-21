import 'package:cse_archive/models/reference_item_model.dart';
import 'package:cse_archive/models/reference_model.dart';
import 'package:get/get.dart';

class ReferenceItemController extends GetxController
    with StateMixin<ReferenceItemModel> {
  final int referenceId;
  ReferenceItemController({
    required this.referenceId,
  });

  var loading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    var result = ReferenceItemModel(
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
      url: '',
      courses: [
        {
          'title': 'طراحی الگوریتم',
          'unit': 3,
          'type': 'تخصصی',
        },
        {
          'title': 'طراحی الگوریتم',
          'unit': 3,
          'type': 'تخصصی',
        },
        {
          'title': 'طراحی الگوریتم',
          'unit': 3,
          'type': 'تخصصی',
        },
        {
          'title': 'طراحی الگوریتم',
          'unit': 3,
          'type': 'تخصصی',
        },
      ],
      references: [
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
      ],
    );

    change(result, status: RxStatus.success());
  }
}
