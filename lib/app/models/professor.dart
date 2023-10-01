import 'course.dart';
import 'link.dart';
import 'professor_department_enum.dart';

class ProfessorModel {
  final String uuid;
  final ProfessorDepartmentEnumModel department;
  final String? honorific;
  final String? firstName;
  final String? lastName;
  final Uri? image;
  final String? about;
  final List<String> emails;
  final List<LinkModel> links;
  final List<CourseModel> courses;

  ProfessorModel({
    required this.uuid,
    required this.department,
    this.honorific,
    this.firstName,
    this.lastName,
    this.image,
    this.about,
    this.emails = const [],
    this.links = const [],
    this.courses = const [],
  });

  String get fullName {
    return switch ((firstName, lastName)) {
      (!= null, != null) => '$firstName $lastName',
      (null, != null) => lastName!,
      (!= null, null) => firstName!,
      _ => '',
    };
  }

  String get fullNameWithHonorific {
    return '${honorific ?? '\b'} $fullName';
  }

  static ProfessorModel? fromJson(dynamic json) {
    if (json == null) return null;

    final image = json['image'];

    return ProfessorModel(
      uuid: json['uuid'],
      department: ProfessorDepartmentEnumModel.fromJson(json['department']),
      honorific: json['honorific'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      image: image == null ? null : Uri.parse(image),
      about: json['about'],
      emails: List<String>.from(json['emails'] ??= []),
      links: LinkModel.listFromJson(json['links']),
      courses: CourseModel.listFromJson(json['courses']),
    );
  }

  static List<ProfessorModel> listFromJson(List? professors) {
    if (professors == null) return [];

    return professors
        .map((professor) => ProfessorModel.fromJson(professor)!)
        .toList();
  }
}
