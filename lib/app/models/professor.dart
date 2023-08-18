import 'course.dart';
import 'link.dart';

class ProfessorModel {
  final String uuid;
  final String department;
  final String? honorific;
  final String? firstName;
  final String? lastName;
  final Uri? image;
  final String? about;
  final bool hasDetail;
  final List<String> emails;
  final List<LinkModel> links;
  final List<CourseModel> courses;

  String get fullName => switch ((firstName, lastName)) {
        (!= null, != null) => '$firstName $lastName',
        (null, != null) => lastName!,
        (!= null, null) => firstName!,
        _ => '',
      };

  String get fullNameWithHonorific =>
      '${honorific != null ? '$honorific ' : ''}$fullName';

  ProfessorModel({
    required this.uuid,
    required this.department,
    this.honorific,
    this.firstName,
    this.lastName,
    this.image,
    this.about,
    this.hasDetail = false,
    this.emails = const [],
    this.links = const [],
    this.courses = const [],
  });

  factory ProfessorModel.fromJson(dynamic json) => ProfessorModel(
        uuid: json['uuid'],
        department: json['department'],
        honorific: json['honorific'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        image: json['image'],
        about: json['about'],
        hasDetail: json['has_detail'],
        emails: json['emails'],
        links: LinkModel.listFromJson(json['links']),
        courses: CourseModel.listFromJson(json['courses']),
      );

  static List<ProfessorModel> listFromJson(dynamic professors) =>
      List<ProfessorModel>.from(
        professors.map(
          (professor) => ProfessorModel.fromJson(professor),
        ),
      );
}
