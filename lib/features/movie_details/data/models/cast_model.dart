import '../../domain/entities/cast_entity.dart';

class CastModel extends CastEntity {
  const CastModel({
    required super.adult,
    required super.gender,
    required super.id,
    required super.knownForDepartment,
    required super.name,
    required super.originalName,
    required super.popularity,
    super.profilePath,
    required super.castId,
    required super.character,
    required super.creditId,
    required super.order,
  });

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      adult: json['adult'] as bool? ?? false,
      gender: (json['gender'] as num?)?.toInt() ?? 0,
      id: (json['id'] as num?)?.toInt() ?? 0,
      knownForDepartment: json['known_for_department'] as String? ?? '',
      name: json['name'] as String? ?? '',
      originalName: json['original_name'] as String? ?? '',
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0,
      profilePath: json['profile_path'] as String?,
      castId: (json['cast_id'] as num?)?.toInt() ?? 0,
      character: json['character'] as String? ?? '',
      creditId: json['credit_id'] as String? ?? '',
      order: (json['order'] as num?)?.toInt() ?? 0,
    );
  }

  factory CastModel.fromEntity(CastEntity entity) {
    return CastModel(
      adult: entity.adult,
      gender: entity.gender,
      id: entity.id,
      knownForDepartment: entity.knownForDepartment,
      name: entity.name,
      originalName: entity.originalName,
      popularity: entity.popularity,
      profilePath: entity.profilePath,
      castId: entity.castId,
      character: entity.character,
      creditId: entity.creditId,
      order: entity.order,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'gender': gender,
      'id': id,
      'known_for_department': knownForDepartment,
      'name': name,
      'original_name': originalName,
      'popularity': popularity,
      'profile_path': profilePath,
      'cast_id': castId,
      'character': character,
      'credit_id': creditId,
      'order': order,
    };
  }

  CastEntity toEntity() {
    return CastEntity(
      adult: adult,
      gender: gender,
      id: id,
      knownForDepartment: knownForDepartment,
      name: name,
      originalName: originalName,
      popularity: popularity,
      profilePath: profilePath,
      castId: castId,
      character: character,
      creditId: creditId,
      order: order,
    );
  }
}
