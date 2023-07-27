import 'package:cse_archive/app/models/resource.dart';
import 'package:get/get.dart';

class ResourcesController extends GetxController
    with StateMixin<List<ResourceModel>> {
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    final result = [
      ResourceModel(
        title: 'میانترم اول محاسبات عددی',
        semester: 'نیم سال اول ۱۳۹۹',
        teacher: 'دکتر کشتکاران',
      ),
      ResourceModel(
        title: 'میانترم اول محاسبات عددی',
        semester: 'نیم سال اول ۱۳۹۹',
        teacher: 'دکتر کشتکاران',
      ),
      ResourceModel(
        title: 'میانترم اول محاسبات عددی',
        semester: 'نیم سال اول ۱۳۹۹',
        teacher: 'دکتر کشتکاران',
      ),
      ResourceModel(
        title: 'میانترم اول محاسبات عددی',
        semester: 'نیم سال اول ۱۳۹۹',
        teacher: 'دکتر کشتکاران',
      ),
      ResourceModel(
        title: 'میانترم اول محاسبات عددی',
        semester: 'نیم سال اول ۱۳۹۹',
        teacher: 'دکتر کشتکاران',
      ),
      ResourceModel(
        title: 'میانترم اول محاسبات عددی',
        semester: 'نیم سال اول ۱۳۹۹',
        teacher: 'دکتر کشتکاران',
      ),
      ResourceModel(
        title: 'میانترم اول محاسبات عددی',
        semester: 'نیم سال اول ۱۳۹۹',
        teacher: 'دکتر کشتکاران',
      ),
      ResourceModel(
        title: 'میانترم اول محاسبات عددی',
        semester: 'نیم سال اول ۱۳۹۹',
        teacher: 'دکتر کشتکاران',
      ),
      ResourceModel(
        title: 'میانترم اول محاسبات عددی',
        semester: 'نیم سال اول ۱۳۹۹',
        teacher: 'دکتر کشتکاران',
      ),
      ResourceModel(
        title: 'میانترم اول محاسبات عددی',
        semester: 'نیم سال اول ۱۳۹۹',
        teacher: 'دکتر کشتکاران',
      ),
    ];

    change(result, status: RxStatus.success());
  }
}
