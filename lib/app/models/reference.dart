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

  factory ReferenceModel.fromJson(dynamic json) {
    final image = json['cover_image'];
    final createdTime = json['created_time'];
    final modifiedTime = json['modified_time'];

    return ReferenceModel(
      uuid: json['uuid'],
      title: json['title'],
      image: image != null ? Uri.parse(image) : null,
      notes: json['notes'],
      createdTime: createdTime != null ? DateTime.parse(createdTime) : null,
      modifiedTime: modifiedTime != null ? DateTime.parse(modifiedTime) : null,
      authors: (json['authors'] as List).map((e) => e.toString()).toList(),
      links: LinkModel.listFromJson(json['links'] ?? []),
      courses: CourseModel.listFromJson(json['courses'] ?? []),
      relatedReferences:
          ReferenceModel.listFromJson(json['related_references'] ?? []),
    );
  }

  static List<ReferenceModel> listFromJson(List references) {
    return references
        .map((reference) => ReferenceModel.fromJson(reference))
        .toList();
  }
}
