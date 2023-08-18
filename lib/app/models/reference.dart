import 'course.dart';
import 'link.dart';

class ReferenceModel {
  final String uuid;
  final String title;
  final Uri? image;
  final String? notes;
  final DateTime? createdTime;
  final DateTime? modifiedTime;
  final List<String> authors;
  final List<LinkModel> links;
  final List<CourseModel> courses;
  final List<ReferenceModel> relatedReferences;

  ReferenceModel({
    required this.uuid,
    required this.title,
    this.image,
    this.notes,
    this.createdTime,
    this.modifiedTime,
    this.authors = const [],
    this.links = const [],
    this.courses = const [],
    this.relatedReferences = const [],
  });

  factory ReferenceModel.fromJson(dynamic json) => ReferenceModel(
        uuid: json['uuid'],
        title: json['title'],
        image: json['cover_image'],
        notes: json['notes'],
        createdTime: DateTime.parse(json['created_time']),
        modifiedTime: DateTime.parse(json['modified_time']),
        authors: json['authors'],
        links: LinkModel.listFromJson(json['links']),
        courses: CourseModel.listFromJson(json['courses']),
        relatedReferences:
            ReferenceModel.listFromJson(json['related_references']),
      );

  static List<ReferenceModel> listFromJson(dynamic references) =>
      List<ReferenceModel>.from(
        references.map(
          (reference) => ReferenceModel.fromJson(reference),
        ),
      );
}
