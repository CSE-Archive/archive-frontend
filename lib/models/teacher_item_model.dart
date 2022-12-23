class TeacherItemModel {
  TeacherItemModel({
    required this.id,
    required this.honorific,
    required this.description,
    required this.firstName,
    required this.lastName,
    required this.department,
    required this.image,
    required this.slug,
    required this.emails,
    required this.relatedLinks,
    required this.courses,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String honorific;
  final String description;
  final String department;
  final String image;
  final String slug;
  final List<String> emails;
  final List<String> relatedLinks;
  final List<Map> courses;

  String get fullName {
    return '$firstName $lastName';
  }
}
