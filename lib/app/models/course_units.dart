import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/models/base_enum.dart';

class CourseUnitsModel extends BaseEnumModel {
  const CourseUnitsModel._({
    required int? super.value,
    required super.representation,
    required super.queryParameterValue,
  });

  int? toJson() => value;

  static CourseUnitsModel fromJson(int value) {
    return options.firstWhere(
      (courseUnitsModel) => courseUnitsModel.value == value,
    );
  }

  static const CourseUnitsModel defaultOption = CourseUnitsModel._(
    value: null,
    representation: ArchiveStrings.all,
    queryParameterValue: 'all',
  );

  static const List<CourseUnitsModel> options = [
    defaultOption,
    CourseUnitsModel._(
      value: 1,
      representation: ArchiveStrings.courseUnits1,
      queryParameterValue: '1',
    ),
    CourseUnitsModel._(
      value: 2,
      representation: ArchiveStrings.courseUnits2,
      queryParameterValue: '2',
    ),
    CourseUnitsModel._(
      value: 3,
      representation: ArchiveStrings.courseUnits3,
      queryParameterValue: '3',
    ),
  ];
}
