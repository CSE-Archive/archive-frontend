import 'package:cse_archive/app/constants/strings.dart';

import 'course.dart';
import 'professor.dart';
import 'recorded_classroom.dart';
import 'resource.dart';

class ClassroomModel {
  final String uuid;
  final int year;
  final SemesterType semester;
  final CourseModel course;
  final RecordedClassroomModel? recordings;
  final List<ProfessorModel> professors;
  final List<ResourceModel> resources;
  final List<String> tas;

  ClassroomModel({
    required this.uuid,
    required this.year,
    required this.semester,
    required this.course,
    this.recordings,
    this.professors = const [],
    this.resources = const [],
    this.tas = const [],
  });

  factory ClassroomModel.fromJson(dynamic json) {
    final recordings = json['recordings'];

    return ClassroomModel(
      uuid: json['uuid'],
      year: json['year'],
      semester: SemesterType.decode(json['semester']),
      course: CourseModel.fromJson(json['course']),
      recordings: recordings != null
          ? RecordedClassroomModel.fromJson(recordings)
          : null,
      professors: ProfessorModel.listFromJson(json['professors'] ?? []),
      resources: ResourceModel.listFromJson(json['resources'] ?? []),
      tas: json['tas'] ?? [],
    );
  }

  static List<ClassroomModel> listFromJson(List classrooms) {
    return classrooms
        .map((classroom) => ClassroomModel.fromJson(classroom))
        .toList();
  }
}

enum SemesterType {
  first,
  second,
  summer;

  static SemesterType decode(int rawType) => switch (rawType) {
        1 => first,
        2 => second,
        _ => summer, // https://github.com/dart-lang/language/issues/3083
      };

  int encode() => switch (this) {
        first => 1,
        second => 2,
        summer => 3,
      };

  @override
  String toString() => switch (this) {
        first => ArchiveStrings.semesterTypeFirst,
        second => ArchiveStrings.semesterTypeSecond,
        summer => ArchiveStrings.semesterTypeSummer,
      };
}
