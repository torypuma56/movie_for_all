import '../../domain/entities/genre_entity.dart';

class GenreModel extends GenreEntity {
  const GenreModel({required super.id, required super.name});

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
    );
  }

  factory GenreModel.fromEntity(GenreEntity entity) {
    return GenreModel(id: entity.id, name: entity.name);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }

  GenreEntity toEntity() {
    return GenreEntity(id: id, name: name);
  }
}
