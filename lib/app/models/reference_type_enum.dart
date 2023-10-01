import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/models/base_enum.dart';

class ReferenceTypeEnumModel extends BaseEnumModel {
  final String? _concatenation;

  const ReferenceTypeEnumModel._({
    required int? super.value,
    required super.representation,
    required super.queryParameterValue,
    String? concatenation,
  }) : _concatenation = concatenation;

  String get concatenation => _concatenation ?? representation;

  int? toJson() => value;

  static ReferenceTypeEnumModel fromJson(int value) {
    return values.firstWhere(
      (referenceTypeModel) => referenceTypeModel.value == value,
    );
  }

  static const none = ReferenceTypeEnumModel._(
    value: null,
    representation: ArchiveStrings.none,
    queryParameterValue: '',
  );

  static const book = ReferenceTypeEnumModel._(
    value: 1,
    representation: ArchiveStrings.referenceTypeBook,
    queryParameterValue: 'book',
  );

  static const solution = ReferenceTypeEnumModel._(
    value: 2,
    representation: ArchiveStrings.referenceTypeSolution,
    queryParameterValue: 'solution',
  );

  static const slide = ReferenceTypeEnumModel._(
    value: 3,
    representation: ArchiveStrings.referenceTypeSlide,
    concatenation: ArchiveStrings.referenceTypeSlideConcatenation,
    queryParameterValue: 'slide',
  );

  static const handout = ReferenceTypeEnumModel._(
    value: 4,
    representation: ArchiveStrings.referenceTypeHandout,
    queryParameterValue: 'handout',
  );

  static const summary = ReferenceTypeEnumModel._(
    value: 5,
    representation: ArchiveStrings.referenceTypeSummary,
    queryParameterValue: 'summary',
  );

  static const other = ReferenceTypeEnumModel._(
    value: 6,
    representation: ArchiveStrings.referenceTypeOther,
    queryParameterValue: 'other',
  );

  static const values = [none, book, solution, slide, handout, summary, other];
}
