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

  factory RecordedClassroomModel.fromJson(dynamic json) =>
      RecordedClassroomModel(
        uuid: json['uuid'],
        classroom: ClassroomModel.fromJson(json['classroom']),
        createdTime: DateTime.parse(json['created_time']),
        modifiedTime: DateTime.parse(json['modified_time']),
        sessions: RecordedSessionModel.listFromJson(json['sessions']),
        links: LinkModel.listFromJson(json['links']),
      );

  static List<RecordedClassroomModel> listFromJson(dynamic recordings) =>
      List<RecordedClassroomModel>.from(
        recordings.map(
          (recording) => RecordedClassroomModel.fromJson(recording),
        ),
      );
}
