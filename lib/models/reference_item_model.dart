class ReferenceItemModel {
  ReferenceItemModel({
    required this.id,
    required this.title,
    required this.authors,
    required this.image,
    required this.slug,
    required this.url,
    required this.courses,
  });

  final int id;
  final String title;
  final List<String> authors;
  final String image;
  final String slug;
  final String url;
  final List<Map> courses;
}
