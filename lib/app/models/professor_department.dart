import 'package:cse_archive/app/constants/strings.dart';

import 'base_enum.dart';

class ProfessorDepartmentModel extends BaseEnumModel {
  const ProfessorDepartmentModel({
    required String? super.value,
    required super.representation,
    required super.queryParameterValue,
  });

  String? toJson() => value;

  static ProfessorDepartmentModel fromJson(dynamic json) {
    return ProfessorDepartmentModel(
      value: json['uuid'],
      representation: json['name'],
      queryParameterValue: json['tag'],
    );
  }

  static List<ProfessorDepartmentModel> listFromJson(
      List? professorDepartments) {
    if (professorDepartments == null) return [];

    return professorDepartments
        .map(
          (professorDepartment) =>
              ProfessorDepartmentModel.fromJson(professorDepartment),
        )
        .toList();
  }

  static const ProfessorDepartmentModel defaultOption =
      ProfessorDepartmentModel(
    value: null,
    representation: ArchiveStrings.all,
    queryParameterValue: 'all',
  );
}
