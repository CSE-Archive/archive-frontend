import 'classroom.dart';
import 'link.dart';
import 'resource_type_enum.dart';

class ResourceModel {
  final String uuid;
  final ResourceTypeEnumModel type;
  final ClassroomModel? classroom;
  final bool isSolution;
  final Uri? file;
  final String? title;
  final String? notes;
  final DateTime? createdTime;
  final DateTime? modifiedTime;
  final List<LinkModel> links;

  ResourceModel({
    required this.uuid,
    required this.type,
    required this.classroom,
    required this.isSolution,
    this.file,
    this.title,
    this.notes,
    this.createdTime,
    this.modifiedTime,
    this.links = const [],
  });

  static ResourceModel? fromJson(dynamic json) {
    if (json == null) return null;

    final file = json['file'];
    final createdTime = json['created_time'];
    final modifiedTime = json['modified_time'];
    final type = ResourceTypeEnumModel.fromJson(json['type']);

    return ResourceModel(
      uuid: json['uuid'],
      title: json['title'],
      type: type,
      classroom: ClassroomModel.fromJson(json['classroom']),
      isSolution: json['is_solution'],
      file: file == null ? null : Uri.parse(file),
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
