import 'package:cse_archive/models/course_model.dart';
import 'package:cse_archive/models/reference_model.dart';

class ReferenceItemModel {
  ReferenceItemModel({
    required this.id,
    required this.title,
    required this.authors,
    required this.image,
    required this.slug,
    required this.url,
    required this.courses,
    required this.references,
  });

  final int id;
  final String title;
  final List<String> authors;
  final String image;
  final String slug;
  final String url;
  final List<CourseModel> courses;
  final List<ReferenceModel> references;
}
