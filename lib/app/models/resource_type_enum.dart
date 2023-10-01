import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/models/base_enum.dart';

class ResourceTypeEnumModel extends BaseEnumModel {
  final String? _concatenation;

  const ResourceTypeEnumModel._({
    required int? super.value,
    required super.representation,
    required super.queryParameterValue,
    String? concatenation,
  }) : _concatenation = concatenation;

  String get concatenation => _concatenation ?? representation;

  int? toJson() => value;

  static ResourceTypeEnumModel fromJson(int value) {
    return values.firstWhere(
      (resourceTypeModel) => resourceTypeModel.value == value,
    );
  }

  static const none = ResourceTypeEnumModel._(
    value: null,
    representation: ArchiveStrings.none,
    queryParameterValue: '',
  );

  static const midterm = ResourceTypeEnumModel._(
    value: 1,
    representation: ArchiveStrings.resourceTypeMidterm,
    queryParameterValue: 'midterm',
  );

  static const finalExam = ResourceTypeEnumModel._(
    value: 2,
    representation: ArchiveStrings.resourceTypeFinal,
    queryParameterValue: 'final',
  );

  static const project = ResourceTypeEnumModel._(
    value: 3,
    representation: ArchiveStrings.resourceTypeProject,
    queryParameterValue: 'project',
  );

  static const homework = ResourceTypeEnumModel._(
    value: 4,
    representation: ArchiveStrings.resourceTypeHomework,
    concatenation: ArchiveStrings.resourceTypeHomeworkConcatenation,
    queryParameterValue: 'homework',
  );

  static const quiz = ResourceTypeEnumModel._(
    value: 5,
    representation: ArchiveStrings.resourceTypeQuiz,
    queryParameterValue: 'quiz',
  );

  static const other = ResourceTypeEnumModel._(
    value: 6,
    representation: ArchiveStrings.resourceTypeOther,
    queryParameterValue: 'other',
  );

  static const values = [
    none,
    midterm,
    finalExam,
    project,
    homework,
    quiz,
    other
  ];
}
