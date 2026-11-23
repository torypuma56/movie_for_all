import '../../domain/entities/belongs_to_collection_entity.dart';

class BelongsToCollectionModel extends BelongsToCollectionEntity {
  const BelongsToCollectionModel({
    required super.id,
    required super.name,
    super.posterPath,
    super.backdropPath,
  });

  factory BelongsToCollectionModel.fromJson(Map<String, dynamic> json) {
    return BelongsToCollectionModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
    );
  }

  factory BelongsToCollectionModel.fromEntity(
    BelongsToCollectionEntity entity,
  ) {
    return BelongsToCollectionModel(
      id: entity.id,
      name: entity.name,
      posterPath: entity.posterPath,
      backdropPath: entity.backdropPath,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
    };
  }

  BelongsToCollectionEntity toEntity() {
    return BelongsToCollectionEntity(
      id: id,
      name: name,
      posterPath: posterPath,
      backdropPath: backdropPath,
    );
  }
}
