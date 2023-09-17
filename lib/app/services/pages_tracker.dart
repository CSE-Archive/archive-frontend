import 'package:get/get.dart';

enum ArchivePage {
  home,
  notFound,
  chart,
  course,
  courses,
  professor,
  professors,
  recordings,
  reference,
  references,
  resources,
  search,
}

class PageTrackerService extends GetxService {
  static PageTrackerService get to => Get.find();

  ArchivePage activePage = ArchivePage.home;
}
