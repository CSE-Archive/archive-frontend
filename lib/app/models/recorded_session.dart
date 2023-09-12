import 'link.dart';

class RecordedSessionModel {
  final String title;
  final List<LinkModel> links;

  RecordedSessionModel({
    required this.title,
    this.links = const [],
  });

  static RecordedSessionModel? fromJson(dynamic json) {
    if (json == null) return null;

    return RecordedSessionModel(
      title: json['title'],
      links: LinkModel.listFromJson(json['links']),
    );
  }

  static List<RecordedSessionModel> listFromJson(List? sessions) {
    if (sessions == null) return [];

    return sessions
        .map((session) => RecordedSessionModel.fromJson(session)!)
        .toList();
  }
}
