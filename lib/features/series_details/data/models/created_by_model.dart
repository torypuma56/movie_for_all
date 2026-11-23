import '../../domain/entities/created_by_entity.dart';

class CreatedByModel extends CreatedByEntity {
  const CreatedByModel({
    required super.id,
    required super.creditId,
    required super.name,
    required super.gender,
    super.profilePath,
  });

  factory CreatedByModel.fromJson(Map<String, dynamic> json) {
    return CreatedByModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      creditId: json['credit_id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      gender: (json['gender'] as num?)?.toInt() ?? 0,
      profilePath: json['profile_path'] as String?,
    );
  }

  factory CreatedByModel.fromEntity(CreatedByEntity entity) {
    return CreatedByModel(
      id: entity.id,
      creditId: entity.creditId,
      name: entity.name,
      gender: entity.gender,
      profilePath: entity.profilePath,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'credit_id': creditId,
      'name': name,
      'gender': gender,
      'profile_path': profilePath,
    };
  }

  CreatedByEntity toEntity() {
    return CreatedByEntity(
      id: id,
      creditId: creditId,
      name: name,
      gender: gender,
      profilePath: profilePath,
    );
  }
}
