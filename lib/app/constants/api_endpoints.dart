import 'package:flutter_dotenv/flutter_dotenv.dart';

class ArchiveAPIEndpoints {
  ArchiveAPIEndpoints._();

  static final base = dotenv.env['API_BASE_URL'];

  static final chart = '$base/chart';
  static final courses = '$base/courses';
  static final departments = '$base/departments';
  static final home = '$base/home';
  static final professors = '$base/professors';
  static final recordings = '$base/recordings';
  static final references = '$base/references';
  static final resources = '$base/resources';
  static final search = '$base/search';

  static String course(String uuid) => '$base/courses/$uuid';
  static String professor(String uuid) => '$base/professors/$uuid';
  static String reference(String uuid) => '$base/references/$uuid';
  static String resource(String uuid) => '$base/resources/$uuid';
  static String recording(String uuid) => '$base/recordings/$uuid';
}
