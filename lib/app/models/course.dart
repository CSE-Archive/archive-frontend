import 'package:cse_archive/app/constants/strings.dart';

import 'classroom.dart';
import 'reference.dart';
import 'professor.dart';

// TODO: Backend had a bug, check again when its fixed

class CourseModel {
  final String uuid;
  final String title;
  final UnitsType units;
  final CourseType type;
  final String? titleEn;
  final String? description;
  final String? tag;
  final String? knownAs;
  final List<ReferenceModel> references;
  final List<ClassroomModel> classrooms;
  final List<ProfessorModel> professors;
  final List<CourseModel> coRequisites;
  final List<CourseModel> preRequisites;
  final List<CourseModel> requisiteFor;

  CourseModel({
    required this.uuid,
    required this.title,
    required this.units,
    required this.type,
    this.titleEn,
    this.description,
    this.tag,
    this.knownAs,
    this.references = const [],
    this.classrooms = const [],
    this.professors = const [],
    this.coRequisites = const [],
    this.preRequisites = const [],
    this.requisiteFor = const [],
  });

  factory CourseModel.fromJson(dynamic json) {
    return CourseModel(
      uuid: json['uuid'],
      title: json['title'],
      titleEn: json['en_title'],
      units: UnitsType.decode(json['unit']),
      type: CourseType.decode(json['type']),
      description: json['description'],
      tag: json['tag'],
      knownAs: json['known_as'],
      references: ReferenceModel.listFromJson(json['references'] ?? []),
      classrooms: ClassroomModel.listFromJson(json['classrooms'] ?? []),
      professors: ProfessorModel.listFromJson(json['professors'] ?? []),
      coRequisites: CourseModel.listFromJson(json['co_requisites'] ?? []),
      preRequisites: CourseModel.listFromJson(json['pre_requisites'] ?? []),
      requisiteFor: CourseModel.listFromJson(json['requisite_for'] ?? []),
    );
  }

  static List<CourseModel> listFromJson(List courses) {
    return courses.map((course) => CourseModel.fromJson(course)).toList();
  }
}

enum CourseType {
  basic,
  general,
  optional,
  specialized;

  static CourseType decode(int rawType) => switch (rawType) {
        1 => specialized,
        2 => optional,
        3 => basic,
        _ => general, // https://github.com/dart-lang/language/issues/3083
      };

  int encode() => switch (this) {
        specialized => 1,
        optional => 2,
        basic => 3,
        general => 4,
      };

  @override
  String toString() => switch (this) {
        basic => ArchiveStrings.courseTypeBasic,
        general => ArchiveStrings.courseTypeGeneral,
        optional => ArchiveStrings.courseTypeOptional,
        specialized => ArchiveStrings.courseTypeSpecialized,
      };
}

enum UnitsType {
  one,
  two,
  three;

  static UnitsType decode(int rawType) => switch (rawType) {
        1 => one,
        2 => two,
        _ => three, // https://github.com/dart-lang/language/issues/3083
      };

  int encode() => switch (this) {
        one => 1,
        two => 2,
        three => 3,
      };

  @override
  String toString() => switch (this) {
        one => '۱',
        two => '۲',
        three => '۳',
      };
}

enum RequisiteType {
  co,
  pre;

  static RequisiteType decode(int rawType) => switch (rawType) {
        1 => co,
        _ => pre, // https://github.com/dart-lang/language/issues/3083
      };

  int encode() => switch (this) {
        co => 1,
        pre => 2,
      };
}
