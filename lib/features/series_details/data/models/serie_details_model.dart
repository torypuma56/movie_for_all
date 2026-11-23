import '../../domain/entities/serie_details_entity.dart';
import 'created_by_model.dart';
import 'episode_model.dart';
import 'network_model.dart';
import 'season_model.dart';
import 'package:movies_4_all/features/movie_details/data/models/genre_model.dart';
import 'package:movies_4_all/features/movie_details/data/models/production_company_model.dart';
import 'package:movies_4_all/features/movie_details/data/models/production_country_model.dart';
import 'package:movies_4_all/features/movie_details/data/models/spoken_language_model.dart';

class SerieDetailsModel extends SerieDetailsEntity {
  const SerieDetailsModel({
    required super.adult,
    super.backdropPath,
    required super.createdBy,
    required super.episodeRunTime,
    super.firstAirDate,
    required super.genres,
    super.homepage,
    required super.id,
    required super.inProduction,
    required super.languages,
    super.lastAirDate,
    super.lastEpisodeToAir,
    required super.name,
    super.nextEpisodeToAir,
    required super.networks,
    required super.numberOfEpisodes,
    required super.numberOfSeasons,
    required super.originCountry,
    required super.originalLanguage,
    required super.originalName,
    required super.overview,
    required super.popularity,
    super.posterPath,
    required super.productionCompanies,
    required super.productionCountries,
    required super.seasons,
    required super.spokenLanguages,
    required super.status,
    super.tagline,
    required super.type,
    required super.voteAverage,
    required super.voteCount,
  });

  factory SerieDetailsModel.fromJson(Map<String, dynamic> json) {
    return SerieDetailsModel(
      adult: json['adult'] as bool? ?? false,
      backdropPath: json['backdrop_path'] as String?,
      createdBy: (json['created_by'] as List<dynamic>? ?? const [])
          .map((item) => CreatedByModel.fromJson(item as Map<String, dynamic>))
          .toList(),
      episodeRunTime: List<int>.from(
        json['episode_run_time'] as List<dynamic>? ?? const [],
      ),
      firstAirDate: DateTime.tryParse(json['first_air_date'] as String? ?? ''),
      genres: (json['genres'] as List<dynamic>? ?? const [])
          .map((genre) => GenreModel.fromJson(genre as Map<String, dynamic>))
          .toList(),
      homepage: json['homepage'] as String?,
      id: (json['id'] as num?)?.toInt() ?? 0,
      inProduction: json['in_production'] as bool? ?? false,
      languages: List<String>.from(
        json['languages'] as List<dynamic>? ?? const [],
      ),
      lastAirDate: DateTime.tryParse(json['last_air_date'] as String? ?? ''),
      lastEpisodeToAir: json['last_episode_to_air'] == null
          ? null
          : EpisodeModel.fromJson(
              json['last_episode_to_air'] as Map<String, dynamic>,
            ),
      name: json['name'] as String? ?? '',
      nextEpisodeToAir: json['next_episode_to_air'] == null
          ? null
          : EpisodeModel.fromJson(
              json['next_episode_to_air'] as Map<String, dynamic>,
            ),
      networks: (json['networks'] as List<dynamic>? ?? const [])
          .map((item) => NetworkModel.fromJson(item as Map<String, dynamic>))
          .toList(),
      numberOfEpisodes: (json['number_of_episodes'] as num?)?.toInt() ?? 0,
      numberOfSeasons: (json['number_of_seasons'] as num?)?.toInt() ?? 0,
      originCountry: List<String>.from(
        json['origin_country'] as List<dynamic>? ?? const [],
      ),
      originalLanguage: json['original_language'] as String? ?? '',
      originalName: json['original_name'] as String? ?? '',
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
      seasons: (json['seasons'] as List<dynamic>? ?? const [])
          .map((item) => SeasonModel.fromJson(item as Map<String, dynamic>))
          .toList(),
      spokenLanguages: (json['spoken_languages'] as List<dynamic>? ?? const [])
          .map(
            (language) =>
                SpokenLanguageModel.fromJson(language as Map<String, dynamic>),
          )
          .toList(),
      status: json['status'] as String? ?? '',
      tagline: json['tagline'] as String?,
      type: json['type'] as String? ?? '',
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0,
      voteCount: (json['vote_count'] as num?)?.toInt() ?? 0,
    );
  }

  factory SerieDetailsModel.fromEntity(SerieDetailsEntity entity) {
    return SerieDetailsModel(
      adult: entity.adult,
      backdropPath: entity.backdropPath,
      createdBy: entity.createdBy
          .map((item) => CreatedByModel.fromEntity(item))
          .toList(),
      episodeRunTime: entity.episodeRunTime,
      firstAirDate: entity.firstAirDate,
      genres: entity.genres
          .map((genre) => GenreModel.fromEntity(genre))
          .toList(),
      homepage: entity.homepage,
      id: entity.id,
      inProduction: entity.inProduction,
      languages: entity.languages,
      lastAirDate: entity.lastAirDate,
      lastEpisodeToAir: entity.lastEpisodeToAir == null
          ? null
          : EpisodeModel.fromEntity(entity.lastEpisodeToAir!),
      name: entity.name,
      nextEpisodeToAir: entity.nextEpisodeToAir == null
          ? null
          : EpisodeModel.fromEntity(entity.nextEpisodeToAir!),
      networks: entity.networks
          .map((item) => NetworkModel.fromEntity(item))
          .toList(),
      numberOfEpisodes: entity.numberOfEpisodes,
      numberOfSeasons: entity.numberOfSeasons,
      originCountry: entity.originCountry,
      originalLanguage: entity.originalLanguage,
      originalName: entity.originalName,
      overview: entity.overview,
      popularity: entity.popularity,
      posterPath: entity.posterPath,
      productionCompanies: entity.productionCompanies
          .map((company) => ProductionCompanyModel.fromEntity(company))
          .toList(),
      productionCountries: entity.productionCountries
          .map((country) => ProductionCountryModel.fromEntity(country))
          .toList(),
      seasons: entity.seasons.map((item) => SeasonModel.fromEntity(item)).toList(),
      spokenLanguages: entity.spokenLanguages
          .map((language) => SpokenLanguageModel.fromEntity(language))
          .toList(),
      status: entity.status,
      tagline: entity.tagline,
      type: entity.type,
      voteAverage: entity.voteAverage,
      voteCount: entity.voteCount,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'created_by': createdBy
          .cast<CreatedByModel>()
          .map((item) => item.toJson())
          .toList(),
      'episode_run_time': episodeRunTime,
      'first_air_date': firstAirDate?.toIso8601String().split('T').first,
      'genres': genres.cast<GenreModel>().map((genre) => genre.toJson()).toList(),
      'homepage': homepage,
      'id': id,
      'in_production': inProduction,
      'languages': languages,
      'last_air_date': lastAirDate?.toIso8601String().split('T').first,
      'last_episode_to_air':
          (lastEpisodeToAir as EpisodeModel?)?.toJson(),
      'name': name,
      'next_episode_to_air':
          (nextEpisodeToAir as EpisodeModel?)?.toJson(),
      'networks': networks.cast<NetworkModel>().map((item) => item.toJson()).toList(),
      'number_of_episodes': numberOfEpisodes,
      'number_of_seasons': numberOfSeasons,
      'origin_country': originCountry,
      'original_language': originalLanguage,
      'original_name': originalName,
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
      'seasons': seasons.cast<SeasonModel>().map((item) => item.toJson()).toList(),
      'spoken_languages': spokenLanguages
          .cast<SpokenLanguageModel>()
          .map((language) => language.toJson())
          .toList(),
      'status': status,
      'tagline': tagline,
      'type': type,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }

  SerieDetailsEntity toEntity() {
    return SerieDetailsEntity(
      adult: adult,
      backdropPath: backdropPath,
      createdBy: createdBy
          .map(
            (item) =>
                item is CreatedByModel ? item.toEntity() : item,
          )
          .toList(),
      episodeRunTime: episodeRunTime,
      firstAirDate: firstAirDate,
      genres: genres
          .map((genre) => genre is GenreModel ? genre.toEntity() : genre)
          .toList(),
      homepage: homepage,
      id: id,
      inProduction: inProduction,
      languages: languages,
      lastAirDate: lastAirDate,
      lastEpisodeToAir: lastEpisodeToAir is EpisodeModel
          ? (lastEpisodeToAir as EpisodeModel).toEntity()
          : lastEpisodeToAir,
      name: name,
      nextEpisodeToAir: nextEpisodeToAir is EpisodeModel
          ? (nextEpisodeToAir as EpisodeModel).toEntity()
          : nextEpisodeToAir,
      networks: networks
          .map(
            (item) => item is NetworkModel ? item.toEntity() : item,
          )
          .toList(),
      numberOfEpisodes: numberOfEpisodes,
      numberOfSeasons: numberOfSeasons,
      originCountry: originCountry,
      originalLanguage: originalLanguage,
      originalName: originalName,
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
      seasons: seasons
          .map(
            (item) => item is SeasonModel ? item.toEntity() : item,
          )
          .toList(),
      spokenLanguages: spokenLanguages
          .map(
            (language) =>
                language is SpokenLanguageModel ? language.toEntity() : language,
          )
          .toList(),
      status: status,
      tagline: tagline,
      type: type,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }
}
