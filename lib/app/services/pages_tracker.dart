import 'package:get/get.dart';

enum ArchivePages { home, chart, courses, references, teachers, search }

class PageTrackerService extends GetxService {
  static PageTrackerService get to => Get.find();

  final _activePage = ArchivePages.home.obs;

  ArchivePages get activePage => _activePage.value;
  set activePage(ArchivePages newPage) => _activePage(newPage);
}
