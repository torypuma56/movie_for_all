import '../../domain/entities/serie_entity.dart';

class SerieModel extends SerieEntity {
  const SerieModel({
    super.backdropPath,
    super.firstAirDate,
    required super.genreIds,
    required super.id,
    required super.name,
    required super.originCountry,
    required super.originalLanguage,
    required super.originalName,
    required super.overview,
    required super.popularity,
    super.posterPath,
    required super.voteAverage,
    required super.voteCount,
  });

  factory SerieModel.fromJson(Map<String, dynamic> json) {
    return SerieModel(
      backdropPath: json['backdrop_path'] as String?,
      firstAirDate: DateTime.tryParse(json['first_air_date'] as String? ?? ''),
      genreIds: List<int>.from(json['genre_ids'] as List<dynamic>? ?? const []),
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      originCountry: List<String>.from(
        json['origin_country'] as List<dynamic>? ?? const [],
      ),
      originalLanguage: json['original_language'] as String? ?? '',
      originalName: json['original_name'] as String? ?? '',
      overview: json['overview'] as String? ?? '',
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0,
      posterPath: json['poster_path'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0,
      voteCount: (json['vote_count'] as num?)?.toInt() ?? 0,
    );
  }

  factory SerieModel.fromEntity(SerieEntity entity) {
    return SerieModel(
      backdropPath: entity.backdropPath,
      firstAirDate: entity.firstAirDate,
      genreIds: entity.genreIds,
      id: entity.id,
      name: entity.name,
      originCountry: entity.originCountry,
      originalLanguage: entity.originalLanguage,
      originalName: entity.originalName,
      overview: entity.overview,
      popularity: entity.popularity,
      posterPath: entity.posterPath,
      voteAverage: entity.voteAverage,
      voteCount: entity.voteCount,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'backdrop_path': backdropPath,
      'first_air_date': firstAirDate?.toIso8601String().split('T').first,
      'genre_ids': genreIds,
      'id': id,
      'name': name,
      'origin_country': originCountry,
      'original_language': originalLanguage,
      'original_name': originalName,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }

  SerieEntity toEntity() {
    return SerieEntity(
      backdropPath: backdropPath,
      firstAirDate: firstAirDate,
      genreIds: genreIds,
      id: id,
      name: name,
      originCountry: originCountry,
      originalLanguage: originalLanguage,
      originalName: originalName,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }
}
