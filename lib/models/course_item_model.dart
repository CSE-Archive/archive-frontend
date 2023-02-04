import 'package:cse_archive/models/course_model.dart';
import 'package:cse_archive/models/reference_model.dart';
import 'package:cse_archive/models/teacher_model.dart';

import 'general.dart';

class CourseItemModel {
  CourseItemModel({
    required this.slug,
    required this.nameEn,
    required this.description,
    required this.requisites,
    required this.references,
    required this.teachers,
    required this.resources,
    required this.records,
    required this.id,
    required this.name,
    required this.type,
    required this.units,
    required this.requisiteFor,
  });

  final int id;
  final int units;
  final String name;
  final String nameEn;
  final String slug;
  final String description;
  final CourseType type;
  final Map<CourseModel, RequisiteType> requisites;
  final List<CourseModel> requisiteFor;
  final List<ReferenceModel> references;
  final List<TeacherModel> teachers;
  final List<Map> resources;
  final List<Map> records;
}
