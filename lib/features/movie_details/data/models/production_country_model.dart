import '../../domain/entities/production_country_entity.dart';

class ProductionCountryModel extends ProductionCountryEntity {
  const ProductionCountryModel({required super.iso31661, required super.name});

  factory ProductionCountryModel.fromJson(Map<String, dynamic> json) {
    return ProductionCountryModel(
      iso31661: json['iso_3166_1'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );
  }

  factory ProductionCountryModel.fromEntity(ProductionCountryEntity entity) {
    return ProductionCountryModel(iso31661: entity.iso31661, name: entity.name);
  }

  Map<String, dynamic> toJson() {
    return {'iso_3166_1': iso31661, 'name': name};
  }

  ProductionCountryEntity toEntity() {
    return ProductionCountryEntity(iso31661: iso31661, name: name);
  }
}
