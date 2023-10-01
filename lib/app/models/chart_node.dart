import 'course.dart';
import 'course_type_enum.dart';
import 'course_units_enum.dart';

class ChartNodeModel {
  final int semester;
  final int column;
  final CourseModel? course;
  final CourseTypeEnumModel? courseType;
  final CourseUnitsEnumModel? courseUnits;

  ChartNodeModel({
    required this.semester,
    required this.column,
    required this.course,
    required this.courseType,
    required this.courseUnits,
  });

  static ChartNodeModel? fromJson(dynamic json) {
    if (json == null) return null;

    final courseType = json['type'];
    final courseUnits = json['units'];

    return ChartNodeModel(
      semester: json['semester'],
      column: json['column'],
      course: CourseModel.fromJson(json['course']),
      courseType: courseType == null
          ? null
          : CourseTypeEnumModel.fromJson(
              courseType,
            ),
      courseUnits: courseUnits == null
          ? null
          : CourseUnitsEnumModel.fromJson(
              courseUnits,
            ),
    );
  }

  static List<ChartNodeModel> listFromJson(List? chartNodes) {
    if (chartNodes == null) return [];

    return chartNodes
        .map((chartNode) => ChartNodeModel.fromJson(chartNode)!)
        .toList();
  }
}
