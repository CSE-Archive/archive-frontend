import 'package:get/get.dart';

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'appbarSearch': 'Search...',
          'appbarChart': 'CSE Chart',
          'appbarCourses': 'Courses',
          'appbarReferences': 'References',
          'appbarTeachers': 'Teachers',
        },
        'fa_IR': {
          'appbarSearch': 'جستجو...',
          'appbarChart': 'چارت مهندسی کامپیوتر',
          'appbarCourses': 'دروس',
          'appbarReferences': 'رفرنس‌ها',
          'appbarTeachers': 'اساتید',
          'seeAll': 'مشاهده‌ی همه',
          'newResources': 'جدیدترین منابع',
          'newReferences': 'جدیدترین رفرنس‌ها',
        }
      };
}
