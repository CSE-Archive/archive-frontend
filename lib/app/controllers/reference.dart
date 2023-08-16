import 'package:cse_archive/app/models/course.dart';
import 'package:cse_archive/app/models/reference.dart';
import 'package:get/get.dart';

class ReferenceController extends GetxController
    with StateMixin<ReferenceModel> {
  final int referenceId;

  ReferenceController({required this.referenceId});

  final loading = true.obs;

  @override
  void onInit() {
    super.onInit();

    fetchData();
  }

  Future<void> fetchData() async {
    var result = ReferenceModel(
      id: 1,
      title: 'Introduction to Algorithms, 4rd Edition',
      authors: [
        'Thomas H. Cormen',
        'Charles E. Leiserson',
        'Ronald L. Rivest',
        'Clifford Stein',
      ],
      image: 'assets/_/clrs.jpeg',
      slug: 'introduction-to-algorithms-4rd-edition',
      url: '',
      courses: [
        CourseModel(
          id: 1,
          name: 'طراحی الگوریتم',
          type: CourseType.specialized,
          units: 3,
          slug: 'temp',
        ),
        CourseModel(
          id: 1,
          name: 'طراحی الگوریتم',
          type: CourseType.specialized,
          units: 3,
          slug: 'temp',
        ),
        CourseModel(
          id: 1,
          name: 'طراحی الگوریتم',
          type: CourseType.specialized,
          units: 3,
          slug: 'temp',
        ),
        CourseModel(
          id: 1,
          name: 'طراحی الگوریتم',
          type: CourseType.specialized,
          units: 3,
          slug: 'temp',
        ),
        CourseModel(
          id: 1,
          name: 'طراحی الگوریتم',
          type: CourseType.specialized,
          units: 3,
          slug: 'temp',
        ),
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
          image: 'assets/_/clrs.jpeg',
          slug: 'introduction-to-algorithms-4rd-edition',
        ),
      ],
    );

    change(result, status: RxStatus.success());
  }
}
