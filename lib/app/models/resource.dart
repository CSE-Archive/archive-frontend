import 'classroom.dart';
import 'link.dart';

class ResourceModel {
  final String uuid;
  final String title;
  final ResourceType type;
  final ClassroomModel? classroom;
  final String? notes;
  final DateTime? createdTime;
  final DateTime? modifiedTime;
  final List<LinkModel> links;

  ResourceModel({
    required this.uuid,
    required this.title,
    required this.type,
    this.classroom,
    this.notes,
    this.createdTime,
    this.modifiedTime,
    this.links = const [],
  });

  factory ResourceModel.fromJson(dynamic json) {
    final createdTime = json['created_time'];
    final modifiedTime = json['modified_time'];

    return ResourceModel(
      uuid: json['uuid'],
      title: json['title'],
      type: ResourceType.decode(json['type']),
      classroom: ClassroomModel.fromJson(json['classroom']),
      notes: json['notes'],
      createdTime: createdTime != null ? DateTime.parse(createdTime) : null,
      modifiedTime: modifiedTime != null ? DateTime.parse(modifiedTime) : null,
      links: LinkModel.listFromJson(json['links'] ?? []),
    );
  }

  static List<ResourceModel> listFromJson(List resources) {
    return resources
        .map((resource) => ResourceModel.fromJson(resource))
        .toList();
  }
}

enum ResourceType {
  midtermExam,
  finalExam,
  project,
  homework,
  quiz,
  other;

  static ResourceType decode(int rawType) => switch (rawType) {
        1 => midtermExam,
        2 => finalExam,
        3 => project,
        4 => homework,
        5 => quiz,
        _ => other, // https://github.com/dart-lang/language/issues/3083
      };

  int encode() => switch (this) {
        midtermExam => 1,
        finalExam => 2,
        project => 3,
        homework => 4,
        quiz => 5,
        other => 6,
      };
}
