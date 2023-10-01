import 'classroom.dart';
import 'link.dart';
import 'recorded_session.dart';

class RecordedClassroomModel {
  final String uuid;
  final ClassroomModel classroom;
  final String? notes;
  final DateTime? createdTime;
  final DateTime? modifiedTime;
  final List<RecordedSessionModel> sessions;
  final List<LinkModel> links;

  RecordedClassroomModel({
    required this.uuid,
    required this.classroom,
    this.notes,
    this.createdTime,
    this.modifiedTime,
    this.sessions = const [],
    this.links = const [],
  });

  static RecordedClassroomModel? fromJson(dynamic json) {
    if (json == null) return null;

    final createdTime = json['created_time'];
    final modifiedTime = json['modified_time'];

    return RecordedClassroomModel(
      uuid: json['uuid'],
      classroom: ClassroomModel.fromJson(json['classroom'])!,
      notes: json['notes'],
      createdTime: createdTime == null ? null : DateTime.parse(createdTime),
      modifiedTime: modifiedTime == null ? null : DateTime.parse(modifiedTime),
      sessions: RecordedSessionModel.listFromJson(json['sessions']),
      links: LinkModel.listFromJson(json['links']),
    );
  }

  static List<RecordedClassroomModel> listFromJson(List? recordings) {
    if (recordings == null) return [];

    return recordings
        .map((recording) => RecordedClassroomModel.fromJson(recording)!)
        .toList();
  }
}
