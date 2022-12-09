class ReferenceModel {
  ReferenceModel({
    required this.id,
    required this.title,
    required this.authors,
    required this.image,
    required this.slug,
  });

  final int id;
  final String title;
  final List<String> authors;
  final String image;
  final String slug;
}
