class LinkModel {
  final String title;
  final Uri uri;

  LinkModel({
    required this.title,
    required this.uri,
  });

  static LinkModel? fromJson(dynamic json) {
    if (json == null) return null;

    return LinkModel(
      title: json['title'],
      uri: Uri.parse(json['url']),
    );
  }

  static List<LinkModel> listFromJson(List? links) {
    if (links == null) return [];

    return links.map((link) => LinkModel.fromJson(link)!).toList();
  }
}
