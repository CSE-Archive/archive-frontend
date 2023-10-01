import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/models/base_enum.dart';

class CourseUnitsEnumModel extends BaseEnumModel {
  const CourseUnitsEnumModel._({
    required int? super.value,
    required super.representation,
    required super.queryParameterValue,
  });

  int? toJson() => value;

  static CourseUnitsEnumModel fromJson(int value) {
    return values.firstWhere(
      (courseUnitsModel) => courseUnitsModel.value == value,
    );
  }

  static const none = CourseUnitsEnumModel._(
    value: null,
    representation: ArchiveStrings.none,
    queryParameterValue: '',
  );

  static const one = CourseUnitsEnumModel._(
    value: 1,
    representation: ArchiveStrings.courseUnits1,
    queryParameterValue: '1',
  );

  static const two = CourseUnitsEnumModel._(
    value: 2,
    representation: ArchiveStrings.courseUnits2,
    queryParameterValue: '2',
  );

  static const three = CourseUnitsEnumModel._(
    value: 3,
    representation: ArchiveStrings.courseUnits3,
    queryParameterValue: '3',
  );

  static const values = [none, one, two, three];
}
