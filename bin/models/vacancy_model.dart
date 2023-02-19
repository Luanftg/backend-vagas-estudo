import 'dart:convert';

class VacancyModel {
  final int? id;
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

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'title': title});
    result.addAll({'description': description});
    result.addAll({'image': image});
    result.addAll({'createdAt': createdAt.millisecondsSinceEpoch});
    if (updatedAt != null) {
      result.addAll({'updatedAt': updatedAt!.millisecondsSinceEpoch});
    }

    return result;
  }

  factory VacancyModel.fromMap(Map<String, dynamic> map) {
    return VacancyModel(
      map['id']?.toInt() ?? 0,
      map['title'] ?? '',
      map['description'] ?? '',
      map['image'] ?? '',
      DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      map['updatedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['updatedAt'])
          : null,
    );
  }

  Map toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'createdAt': createdAt.millisecondsSinceEpoch,
        if (updatedAt != null) 'updatedAt': updatedAt!.millisecondsSinceEpoch,
      };

  factory VacancyModel.fromJson(String source) =>
      VacancyModel.fromMap(json.decode(source));
}
