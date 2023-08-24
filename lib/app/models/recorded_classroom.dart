import 'classroom.dart';
import 'link.dart';
import 'recorded_session.dart';

class RecordedClassroomModel {
  final String uuid;
  final ClassroomModel? classroom;
  final DateTime? createdTime;
  final DateTime? modifiedTime;
  final List<RecordedSessionModel> sessions;
  final List<LinkModel> links;

  RecordedClassroomModel({
    required this.uuid,
    this.classroom,
    this.createdTime,
    this.modifiedTime,
    this.sessions = const [],
    this.links = const [],
  });

  factory RecordedClassroomModel.fromJson(dynamic json) {
    final classroom = json['classroom'];
    final createdTime = json['created_time'];
    final modifiedTime = json['modified_time'];

    return RecordedClassroomModel(
      uuid: json['uuid'],
      classroom: classroom != null ? ClassroomModel.fromJson(classroom) : null,
      createdTime: createdTime != null ? DateTime.parse(createdTime) : null,
      modifiedTime: modifiedTime != null ? DateTime.parse(modifiedTime) : null,
      sessions: RecordedSessionModel.listFromJson(json['sessions'] ?? []),
      links: LinkModel.listFromJson(json['links'] ?? []),
    );
  }

  static List<RecordedClassroomModel> listFromJson(List recordings) {
    return recordings
        .map((recording) => RecordedClassroomModel.fromJson(recording))
        .toList();
  }
}
