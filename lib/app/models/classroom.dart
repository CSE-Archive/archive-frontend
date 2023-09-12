import 'package:cse_archive/app/constants/strings.dart';

import 'course.dart';
import 'professor.dart';
import 'recorded_classroom.dart';
import 'resource.dart';

class ClassroomModel {
  final String uuid;
  final int year;
  final ClassroomSemester semester;
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

  static ClassroomModel? fromJson(dynamic json) {
    if (json == null) return null;

    return ClassroomModel(
      uuid: json['uuid'],
      year: json['year'],
      semester: ClassroomSemester.decode(json['semester']),
      course: CourseModel.fromJson(json['course'])!,
      recordings: RecordedClassroomModel.fromJson(json['recordings']),
      professors: ProfessorModel.listFromJson(json['professors']),
      resources: ResourceModel.listFromJson(json['resources']),
      tas: List<String>.from(json['tas'] ??= []),
    );
  }

  static List<ClassroomModel> listFromJson(List? classrooms) {
    if (classrooms == null) return [];

    return classrooms
        .map((classroom) => ClassroomModel.fromJson(classroom)!)
        .toList();
  }
}

enum ClassroomSemester {
  first,
  second,
  summer;

  static ClassroomSemester decode(int rawType) {
    return switch (rawType) {
      1 => first,
      2 => second,
      _ => summer, // https://github.com/dart-lang/language/issues/3083
    };
  }

  @override
  String toString() {
    return switch (this) {
      first => ArchiveStrings.classroomSemesterFirst,
      second => ArchiveStrings.classroomSemesterSecond,
      summer => ArchiveStrings.classroomSemesterSummer,
    };
  }
}
