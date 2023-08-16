import 'package:cse_archive/app/models/resource.dart';
import 'package:get/get.dart';

class ResourceCardsController extends GetxController {
  var resources = <ResourceModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadResources();
  }

  void loadResources() {
    resources.addAll(
      [
        ResourceModel(
          title: 'میانترم اول محاسبات عددی',
          semester: 'نیم سال اول ۱۳۹۹',
          professor: 'دکتر کشتکاران',
        ),
        ResourceModel(
          title: 'میانترم اول محاسبات عددی',
          semester: 'نیم سال اول ۱۳۹۹',
          professor: 'دکتر کشتکاران',
        ),
        ResourceModel(
          title: 'میانترم اول محاسبات عددی',
          semester: 'نیم سال اول ۱۳۹۹',
          professor: 'دکتر کشتکاران',
        ),
        ResourceModel(
          title: 'میانترم اول محاسبات عددی',
          semester: 'نیم سال اول ۱۳۹۹',
          professor: 'دکتر کشتکاران',
        ),
        ResourceModel(
          title: 'میانترم اول محاسبات عددی',
          semester: 'نیم سال اول ۱۳۹۹',
          professor: 'دکتر کشتکاران',
        ),
        ResourceModel(
          title: 'میانترم اول محاسبات عددی',
          semester: 'نیم سال اول ۱۳۹۹',
          professor: 'دکتر کشتکاران',
        ),
        ResourceModel(
          title: 'میانترم اول محاسبات عددی',
          semester: 'نیم سال اول ۱۳۹۹',
          professor: 'دکتر کشتکاران',
        ),
        ResourceModel(
          title: 'میانترم اول محاسبات عددی',
          semester: 'نیم سال اول ۱۳۹۹',
          professor: 'دکتر کشتکاران',
        ),
        ResourceModel(
          title: 'میانترم اول محاسبات عددی',
          semester: 'نیم سال اول ۱۳۹۹',
          professor: 'دکتر کشتکاران',
        ),
        ResourceModel(
          title: 'میانترم اول محاسبات عددی',
          semester: 'نیم سال اول ۱۳۹۹',
          professor: 'دکتر کشتکاران',
        ),
      ],
    );
  }
}
