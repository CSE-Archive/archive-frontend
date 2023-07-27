import 'course.dart';

class TeacherModel {
  TeacherModel({
    required this.id,
    required this.honorific,
    required this.firstName,
    required this.lastName,
    required this.department,
    required this.image,
    required this.slug,
    this.description,
    this.emails = const [],
    this.relatedLinks = const [],
    this.courses = const [],
  });

  final int id;
  final String honorific;
  final String firstName;
  final String lastName;
  final String department;
  final String image;
  final String slug;
  final String? description;
  final List<String> emails;
  final List<String> relatedLinks;
  final List<CourseModel> courses;

  String get fullName => '$firstName $lastName';
}
