import '../../domain/entities/network_entity.dart';

class NetworkModel extends NetworkEntity {
  const NetworkModel({
    required super.id,
    required super.name,
    super.logoPath,
    super.originCountry,
  });

  factory NetworkModel.fromJson(Map<String, dynamic> json) {
    return NetworkModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      logoPath: json['logo_path'] as String?,
      originCountry: json['origin_country'] as String?,
    );
  }

  factory NetworkModel.fromEntity(NetworkEntity entity) {
    return NetworkModel(
      id: entity.id,
      name: entity.name,
      logoPath: entity.logoPath,
      originCountry: entity.originCountry,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'logo_path': logoPath,
      'origin_country': originCountry,
    };
  }

  NetworkEntity toEntity() {
    return NetworkEntity(
      id: id,
      name: name,
      logoPath: logoPath,
      originCountry: originCountry,
    );
  }
}
