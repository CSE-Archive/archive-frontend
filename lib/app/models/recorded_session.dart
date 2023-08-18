import 'link.dart';

class RecordedSessionModel {
  final String title;
  final List<LinkModel> links;

  RecordedSessionModel({
    required this.title,
    this.links = const [],
  });

  factory RecordedSessionModel.fromJson(dynamic json) => RecordedSessionModel(
        title: json['title'],
        links: LinkModel.listFromJson(json['links']),
      );

  static List<RecordedSessionModel> listFromJson(dynamic sessions) =>
      List<RecordedSessionModel>.from(
        sessions.map(
          (session) => RecordedSessionModel.fromJson(session),
        ),
      );
}
