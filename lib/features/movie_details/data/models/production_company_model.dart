import '../../domain/entities/production_company_entity.dart';

class ProductionCompanyModel extends ProductionCompanyEntity {
  const ProductionCompanyModel({
    required super.id,
    required super.name,
    super.logoPath,
    super.originCountry,
  });

  factory ProductionCompanyModel.fromJson(Map<String, dynamic> json) {
    return ProductionCompanyModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      logoPath: json['logo_path'] as String?,
      originCountry: json['origin_country'] as String?,
    );
  }

  factory ProductionCompanyModel.fromEntity(ProductionCompanyEntity entity) {
    return ProductionCompanyModel(
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

  ProductionCompanyEntity toEntity() {
    return ProductionCompanyEntity(
      id: id,
      name: name,
      logoPath: logoPath,
      originCountry: originCountry,
    );
  }
}
