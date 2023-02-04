import 'general.dart';

class CourseModel {
  CourseModel({
    required this.id,
    required this.name,
    required this.type,
    required this.units,
    required this.slug,
  });

  final int id;
  final String name;
  final CourseType type;
  final int units;
  final String slug;
}
