class ChartCourseModel {
  ChartCourseModel({
    required this.id,
    required this.name,
    required this.type,
    required this.units,
    required this.requisites,
    this.doesOpenNewTab = true,
  });

  CourseType type;
  final String id, name;
  final int units;
  final Map<ChartCourseModel, RequisiteType> requisites;
  final bool doesOpenNewTab;
}

enum CourseType {
  basic,
  general,
  optional,
  specialized,
}

enum RequisiteType {
  co,
  pre,
}
