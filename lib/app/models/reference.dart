import 'course.dart';
import 'link.dart';
import 'reference_type.dart';

class ReferenceModel {
  final String uuid;
  final String title;
  final ReferenceTypeModel type;
  final Uri? file;
  final Uri? image;
  final String? notes;
  final DateTime? createdTime;
  final DateTime? modifiedTime;
  final List<String> writers;
  final List<LinkModel> links;
  final List<CourseModel> courses;
  final List<ReferenceModel> relatedReferences;

  ReferenceModel({
    required this.uuid,
    required this.title,
    required this.type,
    this.file,
    this.image,
    this.notes,
    this.createdTime,
    this.modifiedTime,
    this.writers = const [],
    this.links = const [],
    this.courses = const [],
    this.relatedReferences = const [],
  });

  static ReferenceModel? fromJson(dynamic json) {
    if (json == null) return null;

    final file = json['file'];
    final image = json['cover_image'];
    final createdTime = json['created_time'];
    final modifiedTime = json['modified_time'];
    final type = ReferenceTypeModel.fromJson(json['type']);
    final courses = CourseModel.listFromJson(json['courses']);

    return ReferenceModel(
      uuid: json['uuid'],
      title: json['title'] ?? '${type.concatenation} ${courses.first.title}',
      type: type,
      file: file == null ? null : Uri.parse(file),
      image: image == null ? null : Uri.parse(image),
      notes: json['notes'],
      createdTime: createdTime == null ? null : DateTime.parse(createdTime),
      modifiedTime: modifiedTime == null ? null : DateTime.parse(modifiedTime),
      writers: List<String>.from(json['writers']),
      links: LinkModel.listFromJson(json['links']),
      courses: courses,
      relatedReferences:
          ReferenceModel.listFromJson(json['related_references']),
    );
  }

  static List<ReferenceModel> listFromJson(List? references) {
    if (references == null) return [];

    return references
        .map((reference) => ReferenceModel.fromJson(reference)!)
        .toList();
  }
}
