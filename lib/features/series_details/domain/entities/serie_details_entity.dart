import 'package:flutter/foundation.dart';

import 'created_by_entity.dart';
import 'episode_entity.dart';
import 'network_entity.dart';
import 'season_entity.dart';
import 'package:movies_4_all/features/movie_details/domain/entities/genre_entity.dart';
import 'package:movies_4_all/features/movie_details/domain/entities/production_company_entity.dart';
import 'package:movies_4_all/features/movie_details/domain/entities/production_country_entity.dart';
import 'package:movies_4_all/features/movie_details/domain/entities/spoken_language_entity.dart';

class SerieDetailsEntity {
  const SerieDetailsEntity({
    required this.adult,
    this.backdropPath,
    required this.createdBy,
    required this.episodeRunTime,
    this.firstAirDate,
    required this.genres,
    this.homepage,
    required this.id,
    required this.inProduction,
    required this.languages,
    this.lastAirDate,
    this.lastEpisodeToAir,
    required this.name,
    this.nextEpisodeToAir,
    required this.networks,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.seasons,
    required this.spokenLanguages,
    required this.status,
    this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool adult;
  final String? backdropPath;
  final List<CreatedByEntity> createdBy;
  final List<int> episodeRunTime;
  final DateTime? firstAirDate;
  final List<GenreEntity> genres;
  final String? homepage;
  final int id;
  final bool inProduction;
  final List<String> languages;
  final DateTime? lastAirDate;
  final EpisodeEntity? lastEpisodeToAir;
  final String name;
  final EpisodeEntity? nextEpisodeToAir;
  final List<NetworkEntity> networks;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String? posterPath;
  final List<ProductionCompanyEntity> productionCompanies;
  final List<ProductionCountryEntity> productionCountries;
  final List<SeasonEntity> seasons;
  final List<SpokenLanguageEntity> spokenLanguages;
  final String status;
  final String? tagline;
  final String type;
  final double voteAverage;
  final int voteCount;

  int? get firstAirYear => firstAirDate?.year;

  SerieDetailsEntity copyWith({
    bool? adult,
    String? backdropPath,
    List<CreatedByEntity>? createdBy,
    List<int>? episodeRunTime,
    DateTime? firstAirDate,
    List<GenreEntity>? genres,
    String? homepage,
    int? id,
    bool? inProduction,
    List<String>? languages,
    DateTime? lastAirDate,
    EpisodeEntity? lastEpisodeToAir,
    String? name,
    EpisodeEntity? nextEpisodeToAir,
    List<NetworkEntity>? networks,
    int? numberOfEpisodes,
    int? numberOfSeasons,
    List<String>? originCountry,
    String? originalLanguage,
    String? originalName,
    String? overview,
    double? popularity,
    String? posterPath,
    List<ProductionCompanyEntity>? productionCompanies,
    List<ProductionCountryEntity>? productionCountries,
    List<SeasonEntity>? seasons,
    List<SpokenLanguageEntity>? spokenLanguages,
    String? status,
    String? tagline,
    String? type,
    double? voteAverage,
    int? voteCount,
  }) {
    return SerieDetailsEntity(
      adult: adult ?? this.adult,
      backdropPath: backdropPath ?? this.backdropPath,
      createdBy: createdBy ?? this.createdBy,
      episodeRunTime: episodeRunTime ?? this.episodeRunTime,
      firstAirDate: firstAirDate ?? this.firstAirDate,
      genres: genres ?? this.genres,
      homepage: homepage ?? this.homepage,
      id: id ?? this.id,
      inProduction: inProduction ?? this.inProduction,
      languages: languages ?? this.languages,
      lastAirDate: lastAirDate ?? this.lastAirDate,
      lastEpisodeToAir: lastEpisodeToAir ?? this.lastEpisodeToAir,
      name: name ?? this.name,
      nextEpisodeToAir: nextEpisodeToAir ?? this.nextEpisodeToAir,
      networks: networks ?? this.networks,
      numberOfEpisodes: numberOfEpisodes ?? this.numberOfEpisodes,
      numberOfSeasons: numberOfSeasons ?? this.numberOfSeasons,
      originCountry: originCountry ?? this.originCountry,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalName: originalName ?? this.originalName,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      productionCompanies: productionCompanies ?? this.productionCompanies,
      productionCountries: productionCountries ?? this.productionCountries,
      seasons: seasons ?? this.seasons,
      spokenLanguages: spokenLanguages ?? this.spokenLanguages,
      status: status ?? this.status,
      tagline: tagline ?? this.tagline,
      type: type ?? this.type,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
    );
  }

  @override
  String toString() {
    return 'SerieDetailsEntity(adult: $adult, backdropPath: $backdropPath, '
        'createdBy: $createdBy, episodeRunTime: $episodeRunTime, '
        'firstAirDate: $firstAirDate, genres: $genres, homepage: $homepage, '
        'id: $id, inProduction: $inProduction, languages: $languages, '
        'lastAirDate: $lastAirDate, lastEpisodeToAir: $lastEpisodeToAir, '
        'name: $name, nextEpisodeToAir: $nextEpisodeToAir, networks: $networks, '
        'numberOfEpisodes: $numberOfEpisodes, '
        'numberOfSeasons: $numberOfSeasons, originCountry: $originCountry, '
        'originalLanguage: $originalLanguage, originalName: $originalName, '
        'overview: $overview, popularity: $popularity, '
        'posterPath: $posterPath, productionCompanies: $productionCompanies, '
        'productionCountries: $productionCountries, seasons: $seasons, '
        'spokenLanguages: $spokenLanguages, status: $status, tagline: $tagline, '
        'type: $type, voteAverage: $voteAverage, voteCount: $voteCount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SerieDetailsEntity &&
        other.adult == adult &&
        other.backdropPath == backdropPath &&
        listEquals(other.createdBy, createdBy) &&
        listEquals(other.episodeRunTime, episodeRunTime) &&
        other.firstAirDate == firstAirDate &&
        listEquals(other.genres, genres) &&
        other.homepage == homepage &&
        other.id == id &&
        other.inProduction == inProduction &&
        listEquals(other.languages, languages) &&
        other.lastAirDate == lastAirDate &&
        other.lastEpisodeToAir == lastEpisodeToAir &&
        other.name == name &&
        other.nextEpisodeToAir == nextEpisodeToAir &&
        listEquals(other.networks, networks) &&
        other.numberOfEpisodes == numberOfEpisodes &&
        other.numberOfSeasons == numberOfSeasons &&
        listEquals(other.originCountry, originCountry) &&
        other.originalLanguage == originalLanguage &&
        other.originalName == originalName &&
        other.overview == overview &&
        other.popularity == popularity &&
        other.posterPath == posterPath &&
        listEquals(other.productionCompanies, productionCompanies) &&
        listEquals(other.productionCountries, productionCountries) &&
        listEquals(other.seasons, seasons) &&
        listEquals(other.spokenLanguages, spokenLanguages) &&
        other.status == status &&
        other.tagline == tagline &&
        other.type == type &&
        other.voteAverage == voteAverage &&
        other.voteCount == voteCount;
  }

  @override
  int get hashCode => Object.hashAll([
        adult,
        backdropPath,
        Object.hashAll(createdBy),
        Object.hashAll(episodeRunTime),
        firstAirDate,
        Object.hashAll(genres),
        homepage,
        id,
        inProduction,
        Object.hashAll(languages),
        lastAirDate,
        lastEpisodeToAir,
        name,
        nextEpisodeToAir,
        Object.hashAll(networks),
        numberOfEpisodes,
        numberOfSeasons,
        Object.hashAll(originCountry),
        originalLanguage,
        originalName,
        overview,
        popularity,
        posterPath,
        Object.hashAll(productionCompanies),
        Object.hashAll(productionCountries),
        Object.hashAll(seasons),
        Object.hashAll(spokenLanguages),
        status,
        tagline,
        type,
        voteAverage,
        voteCount,
      ]);
}
