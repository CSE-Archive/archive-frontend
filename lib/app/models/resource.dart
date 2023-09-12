import 'classroom.dart';
import 'link.dart';
import 'resource_type.dart';

class ResourceModel {
  final String uuid;
  final ResourceTypeModel type;
  final ClassroomModel? classroom;
  final String? title;
  final String? notes;
  final DateTime? createdTime;
  final DateTime? modifiedTime;
  final List<LinkModel> links;

  ResourceModel({
    required this.uuid,
    required this.type,
    required this.classroom,
    this.title,
    this.notes,
    this.createdTime,
    this.modifiedTime,
    this.links = const [],
  });

  static ResourceModel? fromJson(dynamic json) {
    if (json == null) return null;

    final createdTime = json['created_time'];
    final modifiedTime = json['modified_time'];
    final type = ResourceTypeModel.fromJson(json['type']);

    return ResourceModel(
      uuid: json['uuid'],
      title: json['title'],
      type: type,
      classroom: ClassroomModel.fromJson(json['classroom']),
      notes: json['notes'],
      createdTime: createdTime == null ? null : DateTime.parse(createdTime),
      modifiedTime: modifiedTime == null ? null : DateTime.parse(modifiedTime),
      links: LinkModel.listFromJson(json['links']),
    );
  }

  static List<ResourceModel> listFromJson(List? resources) {
    if (resources == null) return [];

    return resources
        .map((resource) => ResourceModel.fromJson(resource)!)
        .toList();
  }
}