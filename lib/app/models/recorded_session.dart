import 'link.dart';

class RecordedSessionModel {
  final String title;
  final List<LinkModel> links;

  RecordedSessionModel({
    required this.title,
    this.links = const [],
  });

  factory RecordedSessionModel.fromJson(dynamic json) {
    return RecordedSessionModel(
      title: json['title'],
      links: LinkModel.listFromJson(json['links'] ?? []),
    );
  }

  static List<RecordedSessionModel> listFromJson(List sessions) {
    return sessions
        .map((session) => RecordedSessionModel.fromJson(session))
        .toList();
  }
}
