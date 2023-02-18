class VacancyModel {
  final int id;
  final String title;
  final String description;
  final String image;
  final DateTime createdAt;
  final DateTime? updatedAt;

  VacancyModel(
    this.id,
    this.title,
    this.description,
    this.image,
    this.createdAt,
    this.updatedAt,
  );

  @override
  String toString() {
    return 'VacancyModel(id: $id, title: $title, description: $description, image: $image, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
