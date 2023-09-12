import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/models/base_enum.dart';

class CourseTypeModel extends BaseEnumModel {
  const CourseTypeModel._({
    required int? super.value,
    required super.representation,
    required super.queryParameterValue,
  });

  int? toJson() => value;

  static CourseTypeModel fromJson(int value) {
    return options.firstWhere(
      (courseTypeModel) => courseTypeModel.value == value,
    );
  }

  static const CourseTypeModel defaultOption = CourseTypeModel._(
    value: null,
    representation: ArchiveStrings.all,
    queryParameterValue: 'all',
  );

  static const List<CourseTypeModel> options = [
    defaultOption,
    CourseTypeModel._(
      value: 1,
      representation: ArchiveStrings.courseTypeSpecialized,
      queryParameterValue: 'specialized',
    ),
    CourseTypeModel._(
      value: 2,
      representation: ArchiveStrings.courseTypeOptional,
      queryParameterValue: 'optional',
    ),
    CourseTypeModel._(
      value: 3,
      representation: ArchiveStrings.courseTypeBasic,
      queryParameterValue: 'basic',
    ),
    CourseTypeModel._(
      value: 4,
      representation: ArchiveStrings.courseTypeGeneral,
      queryParameterValue: 'general',
    ),
  ];
}
