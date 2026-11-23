import 'package:flutter/foundation.dart';

import 'belongs_to_collection_entity.dart';
import 'genre_entity.dart';
import 'production_company_entity.dart';
import 'production_country_entity.dart';
import 'spoken_language_entity.dart';

class MovieDetailsEntity {
  const MovieDetailsEntity({
    required this.adult,
    this.backdropPath,
    this.belongsToCollection,
    required this.budget,
    required this.genres,
    this.homepage,
    required this.id,
    this.imdbId,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    this.releaseDate,
    required this.revenue,
    this.runtime,
    required this.spokenLanguages,
    required this.status,
    this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool adult;
  final String? backdropPath;
  final BelongsToCollectionEntity? belongsToCollection;
  final int budget;
  final List<GenreEntity> genres;
  final String? homepage;
  final int id;
  final String? imdbId;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String? posterPath;
  final List<ProductionCompanyEntity> productionCompanies;
  final List<ProductionCountryEntity> productionCountries;
  final DateTime? releaseDate;
  final int revenue;
  final int? runtime;
  final List<SpokenLanguageEntity> spokenLanguages;
  final String status;
  final String? tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  int? get releaseYear => releaseDate?.year;

  MovieDetailsEntity copyWith({
    bool? adult,
    String? backdropPath,
    BelongsToCollectionEntity? belongsToCollection,
    int? budget,
    List<GenreEntity>? genres,
    String? homepage,
    int? id,
    String? imdbId,
    List<String>? originCountry,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    List<ProductionCompanyEntity>? productionCompanies,
    List<ProductionCountryEntity>? productionCountries,
    DateTime? releaseDate,
    int? revenue,
    int? runtime,
    List<SpokenLanguageEntity>? spokenLanguages,
    String? status,
    String? tagline,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) {
    return MovieDetailsEntity(
      adult: adult ?? this.adult,
      backdropPath: backdropPath ?? this.backdropPath,
      belongsToCollection: belongsToCollection ?? this.belongsToCollection,
      budget: budget ?? this.budget,
      genres: genres ?? this.genres,
      homepage: homepage ?? this.homepage,
      id: id ?? this.id,
      imdbId: imdbId ?? this.imdbId,
      originCountry: originCountry ?? this.originCountry,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      productionCompanies: productionCompanies ?? this.productionCompanies,
      productionCountries: productionCountries ?? this.productionCountries,
      releaseDate: releaseDate ?? this.releaseDate,
      revenue: revenue ?? this.revenue,
      runtime: runtime ?? this.runtime,
      spokenLanguages: spokenLanguages ?? this.spokenLanguages,
      status: status ?? this.status,
      tagline: tagline ?? this.tagline,
      title: title ?? this.title,
      video: video ?? this.video,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
    );
  }

  @override
  String toString() {
    return 'MovieDetailsEntity(adult: $adult, backdropPath: $backdropPath, '
        'belongsToCollection: $belongsToCollection, budget: $budget, '
        'genres: $genres, homepage: $homepage, id: $id, imdbId: $imdbId, '
        'originCountry: $originCountry, originalLanguage: $originalLanguage, '
        'originalTitle: $originalTitle, overview: $overview, '
        'popularity: $popularity, posterPath: $posterPath, '
        'productionCompanies: $productionCompanies, '
        'productionCountries: $productionCountries, '
        'releaseDate: $releaseDate, revenue: $revenue, runtime: $runtime, '
        'spokenLanguages: $spokenLanguages, status: $status, tagline: $tagline, '
        'title: $title, video: $video, voteAverage: $voteAverage, '
        'voteCount: $voteCount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MovieDetailsEntity &&
        other.adult == adult &&
        other.backdropPath == backdropPath &&
        other.belongsToCollection == belongsToCollection &&
        other.budget == budget &&
        listEquals(other.genres, genres) &&
        other.homepage == homepage &&
        other.id == id &&
        other.imdbId == imdbId &&
        listEquals(other.originCountry, originCountry) &&
        other.originalLanguage == originalLanguage &&
        other.originalTitle == originalTitle &&
        other.overview == overview &&
        other.popularity == popularity &&
        other.posterPath == posterPath &&
        listEquals(other.productionCompanies, productionCompanies) &&
        listEquals(other.productionCountries, productionCountries) &&
        other.releaseDate == releaseDate &&
        other.revenue == revenue &&
        other.runtime == runtime &&
        listEquals(other.spokenLanguages, spokenLanguages) &&
        other.status == status &&
        other.tagline == tagline &&
        other.title == title &&
        other.video == video &&
        other.voteAverage == voteAverage &&
        other.voteCount == voteCount;
  }

  @override
  int get hashCode => Object.hashAll([
        adult,
        backdropPath,
        belongsToCollection,
        budget,
        Object.hashAll(genres),
        homepage,
        id,
        imdbId,
        Object.hashAll(originCountry),
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        Object.hashAll(productionCompanies),
        Object.hashAll(productionCountries),
        releaseDate,
        revenue,
        runtime,
        Object.hashAll(spokenLanguages),
        status,
        tagline,
        title,
        video,
        voteAverage,
        voteCount,
      ]);
}
