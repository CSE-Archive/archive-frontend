import 'course.dart';
import 'course_type.dart';
import 'course_units.dart';

class ChartNodeModel {
  final int semester;
  final int column;
  final CourseModel? course;
  final CourseTypeModel? courseType;
  final CourseUnitsModel? courseUnits;

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
          : CourseTypeModel.fromJson(
              courseType,
            ),
      courseUnits: courseUnits == null
          ? null
          : CourseUnitsModel.fromJson(
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
