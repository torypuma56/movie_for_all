import '../../domain/entities/spoken_language_entity.dart';

class SpokenLanguageModel extends SpokenLanguageEntity {
  const SpokenLanguageModel({
    required super.englishName,
    required super.name,
    super.iso6391,
  });

  factory SpokenLanguageModel.fromJson(Map<String, dynamic> json) {
    return SpokenLanguageModel(
      englishName: json['english_name'] as String? ?? '',
      name: json['name'] as String? ?? '',
      iso6391: json['iso_639_1'] as String?,
    );
  }

  factory SpokenLanguageModel.fromEntity(SpokenLanguageEntity entity) {
    return SpokenLanguageModel(
      englishName: entity.englishName,
      name: entity.name,
      iso6391: entity.iso6391,
    );
  }

  Map<String, dynamic> toJson() {
    return {'english_name': englishName, 'name': name, 'iso_639_1': iso6391};
  }

  SpokenLanguageEntity toEntity() {
    return SpokenLanguageEntity(
      englishName: englishName,
      name: name,
      iso6391: iso6391,
    );
  }
}
