import 'package:cse_archive/app/constants/strings.dart';

import 'reference.dart';
import 'professor.dart';

enum CourseType {
  basic,
  general,
  optional,
  specialized;

  @override
  String toString() => switch (this) {
        basic => ArchiveStrings.chartBasic,
        general => ArchiveStrings.chartGeneral,
        optional => ArchiveStrings.chartOptional,
        specialized => ArchiveStrings.chartSpecialized,
      };
}

enum RequisiteType { co, pre }

class CourseModel {
  CourseModel({
    required this.id,
    required this.name,
    required this.type,
    required this.units,
    required this.slug,
    this.nameEn,
    this.description,
    this.requisites = const {},
    this.references = const [],
    this.professors = const [],
    this.resources = const [],
    this.records = const [],
    this.requisiteFor = const [],
  });

  final int id;
  final String name;
  final CourseType type;
  final int units;
  final String slug;
  final String? nameEn;
  final String? description;
  final Map<CourseModel, RequisiteType> requisites;
  final List<CourseModel> requisiteFor;
  final List<ReferenceModel> references;
  final List<ProfessorModel> professors;
  final List<Map> resources;
  final List<Map> records;
}
