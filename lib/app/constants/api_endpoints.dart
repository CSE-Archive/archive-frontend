class ArchiveAPIEndpoints {
  ArchiveAPIEndpoints._();

  // TODO: Add it to env vars
  static const base = 'http://127.0.0.1:8000';

  static const chart = '$base/chart';
  static const courses = '$base/courses';
  static const departments = '$base/departments';
  static const home = '$base/home';
  static const professors = '$base/professors';
  static const recordings = '$base/recordings';
  static const references = '$base/references';
  static const resources = '$base/resources';
  static const search = '$base/search';

  static String course(String uuid) => '$base/courses/$uuid';
  static String professor(String uuid) => '$base/professors/$uuid';
  static String reference(String uuid) => '$base/references/$uuid';
}
