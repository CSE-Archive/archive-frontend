import 'package:cse_archive/models/general.dart';
import 'package:get/get.dart';

String replaceEnWithFaDigits(String input) {
  const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const farsi = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];

  for (int i = 0; i < english.length; i++) {
    input = input.replaceAll(english[i], farsi[i]);
  }

  return input;
}

String courseTypeToString(CourseType type) {
  switch (type) {
    case CourseType.basic:
      return 'chartBasic'.tr;
    case CourseType.general:
      return 'chartGeneral'.tr;
    case CourseType.optional:
      return 'chartOptional'.tr;
    case CourseType.specialized:
      return 'chartSpecialized'.tr;
  }
}
