import 'course.dart';

class ChartNodeModel {
  final int semester;
  final int order;
  final CourseModel? course;
  final CourseType? courseType;
  final int? courseUnits;

  ChartNodeModel({
    required this.semester,
    required this.order,
    required this.course,
    required this.courseType,
    required this.courseUnits,
  });

  factory ChartNodeModel.fromJson(dynamic json) => ChartNodeModel(
        semester: json['semester'],
        order: json['column'],
        course: json['course'] == null
            ? null
            : CourseModel.fromJson(json['course']),
        courseType:
            json['type'] == null ? null : CourseType.decode(json['type']),
        courseUnits: json['unit'],
      );

  static List<ChartNodeModel> listFromJson(dynamic chartNodes) =>
      List<ChartNodeModel>.from(
        chartNodes.map(
          (chartNode) => ChartNodeModel.fromJson(chartNode),
        ),
      );
}
