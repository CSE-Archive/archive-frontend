import 'package:cse_archive/app/controllers/search_text_field.dart';
import 'package:cse_archive/app/models/course.dart';
import 'package:cse_archive/app/models/reference.dart';
import 'package:cse_archive/app/models/resource.dart';
import 'package:cse_archive/app/models/professor.dart';
import 'package:get/get.dart';

class SearchVController extends GetxController
    with StateMixin<Map<String, List<dynamic>>> {
  String query;

  SearchVController(this.query);

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  @override
  void onClose() {
    final searchBarController =
        Get.find<SearchTextFieldController>(tag: 'appbar');
    searchBarController.textController.clear();
    searchBarController.showClearButton(false);

    super.onClose();
  }

  void setParameters(Map<String, String> parameters) {
    parameters.forEach((key, value) {
      switch (key) {
        case 'q':
          query = value;
          fetchData();

          final searchBarController =
              Get.find<SearchTextFieldController>(tag: 'appbar');
          searchBarController.showClearButton(true);
          searchBarController.textController.text = value;
          break;
      }
    });
  }

  Future<void> fetchData() async {
    final result = {
      'courses': query == '404'
          ? []
          : [
              CourseModel(
                  id: 1,
                  name: 'طراحی الگوریتم 2',
                  type: CourseType.specialized,
                  units: 3,
                  slug: 'temp'),
            ],
      'resources': query == '404'
          ? []
          : [
              ResourceModel(
                title: 'میانترم اول محاسبات عددی',
                semester: 'نیم سال اول ۱۳۹۹',
                professor: 'دکتر کشتکاران',
              ),
            ],
      'references': query == '404'
          ? []
          : [
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
      'professors': query == '404'
          ? []
          : [
              ProfessorModel(
                id: 1,
                image: 'assets/_/clrs.jpeg',
                slug: 'introduction-to-algorithms-4rd-edition',
                department: 'مهندسی کامپیوتر',
                honorific: 'دکتر',
                firstName: 'کوروش',
                lastName: 'زیارتی',
              ),
            ],
    };

    change(result, status: RxStatus.success());
  }
}
