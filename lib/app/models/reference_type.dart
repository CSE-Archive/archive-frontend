import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/models/base_enum.dart';

class ReferenceTypeModel extends BaseEnumModel {
  final String? _concatenation;

  const ReferenceTypeModel._({
    required int? super.value,
    required super.representation,
    required super.queryParameterValue,
    String? concatenation,
  }) : _concatenation = concatenation;

  String get concatenation => _concatenation ?? representation;

  int? toJson() => value;

  static ReferenceTypeModel fromJson(int value) {
    return options.firstWhere(
      (referenceTypeModel) => referenceTypeModel.value == value,
    );
  }

  static const ReferenceTypeModel defaultOption = ReferenceTypeModel._(
    value: null,
    representation: ArchiveStrings.all,
    queryParameterValue: 'all',
  );

  static const List<ReferenceTypeModel> options = [
    defaultOption,
    ReferenceTypeModel._(
      value: 1,
      representation: ArchiveStrings.referenceTypeBook,
      queryParameterValue: 'book',
    ),
    ReferenceTypeModel._(
      value: 2,
      representation: ArchiveStrings.referenceTypeSolution,
      queryParameterValue: 'solution',
    ),
    ReferenceTypeModel._(
      value: 3,
      representation: ArchiveStrings.referenceTypeSlide,
      concatenation: ArchiveStrings.referenceTypeSlideConcatenation,
      queryParameterValue: 'slide',
    ),
    ReferenceTypeModel._(
      value: 4,
      representation: ArchiveStrings.referenceTypeHandout,
      queryParameterValue: 'handout',
    ),
    ReferenceTypeModel._(
      value: 5,
      representation: ArchiveStrings.referenceTypeSummary,
      queryParameterValue: 'summary',
    ),
    ReferenceTypeModel._(
      value: 6,
      representation: ArchiveStrings.referenceTypeOther,
      queryParameterValue: 'other',
    ),
  ];
}
