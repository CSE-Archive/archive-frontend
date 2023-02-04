import 'package:cse_archive/controllers/general/appbar_controller.dart';
import 'package:cse_archive/models/course_model.dart';
import 'package:cse_archive/models/general.dart';
import 'package:cse_archive/models/reference_model.dart';
import 'package:cse_archive/models/resource_model.dart';
import 'package:cse_archive/models/teacher_model.dart';
import 'package:get/get.dart';

class SearchController extends GetxController
    with StateMixin<Map<String, List<dynamic>>> {
  SearchController(this.query);
  String query;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  @override
  void onClose() {
    var controller = Get.find<AppbarController>();
    controller.searchBarController.textController.clear();
    controller.searchBarController.showClearButton(false);

    super.onClose();
  }

  void setParameters(Map<String, String> parameters) {
    parameters.forEach((key, value) {
      switch (key) {
        case 'q':
          query = value;
          fetchData();

          var searchBarController =
              Get.find<AppbarController>().searchBarController;
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
                teacher: 'دکتر کشتکاران',
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
            ],
      'teachers': query == '404'
          ? []
          : [
              TeacherModel(
                id: 1,
                image: 'assets/images/clrs.jpeg',
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
