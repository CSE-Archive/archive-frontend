class LinkModel {
  final String title;
  final Uri uri;

  LinkModel({
    required this.title,
    required this.uri,
  });

  factory LinkModel.fromJson(dynamic json) => LinkModel(
        title: json['title'],
        uri: Uri.parse(json['url']),
      );

  static List<LinkModel> listFromJson(dynamic links) => List<LinkModel>.from(
        links.map(
          (link) => LinkModel.fromJson(link),
        ),
      );
}
