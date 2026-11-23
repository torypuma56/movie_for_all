import '../../domain/entities/movie_details_entity.dart';
import 'belongs_to_collection_model.dart';
import 'genre_model.dart';
import 'production_company_model.dart';
import 'production_country_model.dart';
import 'spoken_language_model.dart';

class MovieDetailsModel extends MovieDetailsEntity {
  const MovieDetailsModel({
    required super.adult,
    super.backdropPath,
    super.belongsToCollection,
    required super.budget,
    required super.genres,
    super.homepage,
    required super.id,
    super.imdbId,
    required super.originCountry,
    required super.originalLanguage,
    required super.originalTitle,
    required super.overview,
    required super.popularity,
    super.posterPath,
    required super.productionCompanies,
    required super.productionCountries,
    super.releaseDate,
    required super.revenue,
    super.runtime,
    required super.spokenLanguages,
    required super.status,
    super.tagline,
    required super.title,
    required super.video,
    required super.voteAverage,
    required super.voteCount,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      adult: json['adult'] as bool? ?? false,
      backdropPath: json['backdrop_path'] as String?,
      belongsToCollection: json['belongs_to_collection'] == null
          ? null
          : BelongsToCollectionModel.fromJson(
              json['belongs_to_collection'] as Map<String, dynamic>,
            ),
      budget: (json['budget'] as num?)?.toInt() ?? 0,
      genres: (json['genres'] as List<dynamic>? ?? const [])
          .map((genre) => GenreModel.fromJson(genre as Map<String, dynamic>))
          .toList(),
      homepage: json['homepage'] as String?,
      id: (json['id'] as num?)?.toInt() ?? 0,
      imdbId: json['imdb_id'] as String?,
      originCountry: List<String>.from(
        json['origin_country'] as List<dynamic>? ?? const [],
      ),
      originalLanguage: json['original_language'] as String? ?? '',
      originalTitle: json['original_title'] as String? ?? '',
      overview: json['overview'] as String? ?? '',
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0,
      posterPath: json['poster_path'] as String?,
      productionCompanies:
          (json['production_companies'] as List<dynamic>? ?? const [])
              .map(
                (company) => ProductionCompanyModel.fromJson(
                  company as Map<String, dynamic>,
                ),
              )
              .toList(),
      productionCountries:
          (json['production_countries'] as List<dynamic>? ?? const [])
              .map(
                (country) => ProductionCountryModel.fromJson(
                  country as Map<String, dynamic>,
                ),
              )
              .toList(),
      releaseDate: DateTime.tryParse(json['release_date'] as String? ?? ''),
      revenue: (json['revenue'] as num?)?.toInt() ?? 0,
      runtime: (json['runtime'] as num?)?.toInt(),
      spokenLanguages: (json['spoken_languages'] as List<dynamic>? ?? const [])
          .map(
            (language) =>
                SpokenLanguageModel.fromJson(language as Map<String, dynamic>),
          )
          .toList(),
      status: json['status'] as String? ?? '',
      tagline: json['tagline'] as String?,
      title: json['title'] as String? ?? '',
      video: json['video'] as bool? ?? false,
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0,
      voteCount: (json['vote_count'] as num?)?.toInt() ?? 0,
    );
  }

  factory MovieDetailsModel.fromEntity(MovieDetailsEntity entity) {
    return MovieDetailsModel(
      adult: entity.adult,
      backdropPath: entity.backdropPath,
      belongsToCollection: entity.belongsToCollection == null
          ? null
          : BelongsToCollectionModel.fromEntity(entity.belongsToCollection!),
      budget: entity.budget,
      genres: entity.genres
          .map((genre) => GenreModel.fromEntity(genre))
          .toList(),
      homepage: entity.homepage,
      id: entity.id,
      imdbId: entity.imdbId,
      originCountry: entity.originCountry,
      originalLanguage: entity.originalLanguage,
      originalTitle: entity.originalTitle,
      overview: entity.overview,
      popularity: entity.popularity,
      posterPath: entity.posterPath,
      productionCompanies: entity.productionCompanies
          .map((company) => ProductionCompanyModel.fromEntity(company))
          .toList(),
      productionCountries: entity.productionCountries
          .map((country) => ProductionCountryModel.fromEntity(country))
          .toList(),
      releaseDate: entity.releaseDate,
      revenue: entity.revenue,
      runtime: entity.runtime,
      spokenLanguages: entity.spokenLanguages
          .map((language) => SpokenLanguageModel.fromEntity(language))
          .toList(),
      status: entity.status,
      tagline: entity.tagline,
      title: entity.title,
      video: entity.video,
      voteAverage: entity.voteAverage,
      voteCount: entity.voteCount,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'belongs_to_collection':
          (belongsToCollection as BelongsToCollectionModel?)?.toJson(),
      'budget': budget,
      'genres': genres.cast<GenreModel>().map((genre) => genre.toJson()).toList(),
      'homepage': homepage,
      'id': id,
      'imdb_id': imdbId,
      'origin_country': originCountry,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'production_companies': productionCompanies
          .cast<ProductionCompanyModel>()
          .map((company) => company.toJson())
          .toList(),
      'production_countries': productionCountries
          .cast<ProductionCountryModel>()
          .map((country) => country.toJson())
          .toList(),
      'release_date': releaseDate?.toIso8601String().split('T').first,
      'revenue': revenue,
      'runtime': runtime,
      'spoken_languages': spokenLanguages
          .cast<SpokenLanguageModel>()
          .map((language) => language.toJson())
          .toList(),
      'status': status,
      'tagline': tagline,
      'title': title,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }

  MovieDetailsEntity toEntity() {
    return MovieDetailsEntity(
      adult: adult,
      backdropPath: backdropPath,
      belongsToCollection: belongsToCollection is BelongsToCollectionModel
          ? (belongsToCollection as BelongsToCollectionModel).toEntity()
          : belongsToCollection,
      budget: budget,
      genres: genres
          .map((genre) => genre is GenreModel ? genre.toEntity() : genre)
          .toList(),
      homepage: homepage,
      id: id,
      imdbId: imdbId,
      originCountry: originCountry,
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath,
      productionCompanies: productionCompanies
          .map(
            (company) =>
                company is ProductionCompanyModel ? company.toEntity() : company,
          )
          .toList(),
      productionCountries: productionCountries
          .map(
            (country) =>
                country is ProductionCountryModel ? country.toEntity() : country,
          )
          .toList(),
      releaseDate: releaseDate,
      revenue: revenue,
      runtime: runtime,
      spokenLanguages: spokenLanguages
          .map(
            (language) =>
                language is SpokenLanguageModel ? language.toEntity() : language,
          )
          .toList(),
      status: status,
      tagline: tagline,
      title: title,
      video: video,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }
}
