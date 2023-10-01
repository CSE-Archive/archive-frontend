import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/models/base_enum.dart';

class CourseTypeEnumModel extends BaseEnumModel {
  const CourseTypeEnumModel._({
    required int? super.value,
    required super.representation,
    required super.queryParameterValue,
  });

  int? toJson() => value;

  static CourseTypeEnumModel fromJson(int value) {
    return values.firstWhere(
      (courseTypeModel) => courseTypeModel.value == value,
    );
  }

  static const none = CourseTypeEnumModel._(
    value: null,
    representation: ArchiveStrings.none,
    queryParameterValue: '',
  );

  static const specialized = CourseTypeEnumModel._(
    value: 1,
    representation: ArchiveStrings.courseTypeSpecialized,
    queryParameterValue: 'specialized',
  );

  static const optional = CourseTypeEnumModel._(
    value: 2,
    representation: ArchiveStrings.courseTypeOptional,
    queryParameterValue: 'optional',
  );

  static const basic = CourseTypeEnumModel._(
    value: 3,
    representation: ArchiveStrings.courseTypeBasic,
    queryParameterValue: 'basic',
  );

  static const general = CourseTypeEnumModel._(
    value: 4,
    representation: ArchiveStrings.courseTypeGeneral,
    queryParameterValue: 'general',
  );

  static const values = [none, specialized, optional, basic, general];
}
