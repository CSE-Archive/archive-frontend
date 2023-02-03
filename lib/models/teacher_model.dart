class TeacherModel {
  TeacherModel({
    required this.id,
    required this.honorific,
    required this.firstName,
    required this.lastName,
    required this.department,
    required this.image,
    required this.slug,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String honorific;
  final String department;
  final String image;
  final String slug;

  String get fullName {
    return '$firstName $lastName';
  }
}
