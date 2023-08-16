import 'package:get/get.dart';

enum ArchivePage {
  home,
  chart,
  course,
  courses,
  reference,
  references,
  professor,
  professors,
  search,
  resources
}

class PageTrackerService extends GetxService {
  static PageTrackerService get to => Get.find();

  final _activePage = ArchivePage.home.obs;

  ArchivePage get activePage => _activePage.value;
  set activePage(ArchivePage newPage) => _activePage(newPage);
}
