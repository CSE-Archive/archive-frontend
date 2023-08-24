class LinkModel {
  final String title;
  final Uri uri;

  LinkModel({
    required this.title,
    required this.uri,
  });

  factory LinkModel.fromJson(dynamic json) {
    return LinkModel(
      title: json['title'],
      uri: Uri.parse(json['url']),
    );
  }

  static List<LinkModel> listFromJson(List links) {
    return links.map((link) => LinkModel.fromJson(link)).toList();
  }
}
