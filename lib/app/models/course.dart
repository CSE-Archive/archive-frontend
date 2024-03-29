import 'classroom.dart';
import 'course_type_enum.dart';
import 'course_units_enum.dart';
import 'reference.dart';
import 'professor.dart';

class CourseModel {
  final String uuid;
  final String title;
  final CourseUnitsEnumModel units;
  final CourseTypeEnumModel type;
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
  final List<CourseModel> incompatibles;

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
    this.incompatibles = const [],
  });

  static CourseModel? fromJson(dynamic json) {
    if (json == null) return null;

    return CourseModel(
      uuid: json['uuid'],
      title: json['title'],
      titleEn: json['en_title'],
      units: CourseUnitsEnumModel.fromJson(json['units']),
      type: CourseTypeEnumModel.fromJson(json['type']),
      description: json['description'],
      tag: json['tag'],
      knownAs: json['known_as'],
      references: ReferenceModel.listFromJson(json['references']),
      classrooms: ClassroomModel.listFromJson(json['classrooms']),
      professors: ProfessorModel.listFromJson(json['professors']),
      coRequisites: CourseModel.listFromJson(json['co_requisites']),
      preRequisites: CourseModel.listFromJson(json['pre_requisites']),
      requisiteFor: CourseModel.listFromJson(json['requisite_for']),
      incompatibles: CourseModel.listFromJson(json['incompatibles']),
    );
  }

  static List<CourseModel> listFromJson(List? courses) {
    if (courses == null) return [];

    return courses.map((course) => CourseModel.fromJson(course)!).toList();
  }
}
