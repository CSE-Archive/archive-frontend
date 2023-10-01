import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/services/api.dart';

import 'base_enum.dart';

class ProfessorDepartmentEnumModel extends BaseEnumModel {
  const ProfessorDepartmentEnumModel({
    required String? super.value,
    required super.representation,
    required super.queryParameterValue,
  });

  String? toJson() => value;

  static ProfessorDepartmentEnumModel fromJson(dynamic json) {
    return ProfessorDepartmentEnumModel(
      value: json['uuid'],
      representation: json['name'],
      queryParameterValue: json['tag'],
    );
  }

  static List<ProfessorDepartmentEnumModel> listFromJson(
    List? professorDepartments,
  ) {
    if (professorDepartments == null) return [];

    return professorDepartments
        .map(
          (professorDepartment) =>
              ProfessorDepartmentEnumModel.fromJson(professorDepartment),
        )
        .toList();
  }

  static const none = ProfessorDepartmentEnumModel(
    value: null,
    representation: ArchiveStrings.none,
    queryParameterValue: '',
  );

  static Future<List<ProfessorDepartmentEnumModel>?> get values async {
    final result = await APIService.to.professorDepartments();

    if (result == null) return null;
    return [none, ...result];
  }
}
