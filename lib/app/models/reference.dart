import 'course.dart';

class ReferenceModel {
  ReferenceModel({
    required this.id,
    required this.title,
    required this.authors,
    required this.image,
    required this.slug,
    this.url,
    this.courses = const [],
    this.references = const [],
  });

  final int id;
  final String title;
  final List<String> authors;
  final String image;
  final String slug;
  final String? url;
  final List<CourseModel> courses;
  final List<ReferenceModel> references;
}
