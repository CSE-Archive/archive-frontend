import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/models/base_enum.dart';

class ResourceTypeModel extends BaseEnumModel {
  final String? _concatenation;

  const ResourceTypeModel._({
    required int? super.value,
    required super.representation,
    required super.queryParameterValue,
    String? concatenation,
  }) : _concatenation = concatenation;

  String get concatenation => _concatenation ?? representation;

  int? toJson() => value;

  static ResourceTypeModel fromJson(int value) {
    return options.firstWhere(
      (resourceTypeModel) => resourceTypeModel.value == value,
    );
  }

  static const ResourceTypeModel defaultOption = ResourceTypeModel._(
    value: null,
    representation: ArchiveStrings.all,
    queryParameterValue: 'all',
  );

  static const List<ResourceTypeModel> options = [
    defaultOption,
    ResourceTypeModel._(
      value: 1,
      representation: ArchiveStrings.resourceTypeMidterm,
      queryParameterValue: 'midterm',
    ),
    ResourceTypeModel._(
      value: 2,
      representation: ArchiveStrings.resourceTypeFinal,
      queryParameterValue: 'final',
    ),
    ResourceTypeModel._(
      value: 3,
      representation: ArchiveStrings.resourceTypeProject,
      queryParameterValue: 'project',
    ),
    ResourceTypeModel._(
      value: 4,
      representation: ArchiveStrings.resourceTypeHomework,
      concatenation: ArchiveStrings.resourceTypeHomeworkConcatenation,
      queryParameterValue: 'homework',
    ),
    ResourceTypeModel._(
      value: 5,
      representation: ArchiveStrings.resourceTypeQuiz,
      queryParameterValue: 'quiz',
    ),
    ResourceTypeModel._(
      value: 6,
      representation: ArchiveStrings.resourceTypeOther,
      queryParameterValue: 'other',
    ),
  ];
}
