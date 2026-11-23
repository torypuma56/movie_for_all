import 'package:flutter/foundation.dart';

class SerieEntity {
  const SerieEntity({
    this.backdropPath,
    this.firstAirDate,
    required this.genreIds,
    required this.id,
    required this.name,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    this.posterPath,
    required this.voteAverage,
    required this.voteCount,
  });

  final String? backdropPath;
  final DateTime? firstAirDate;
  final List<int> genreIds;
  final int id;
  final String name;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String? posterPath;
  final double voteAverage;
  final int voteCount;

  int? get firstAirYear => firstAirDate?.year;

  SerieEntity copyWith({
    String? backdropPath,
    DateTime? firstAirDate,
    List<int>? genreIds,
    int? id,
    String? name,
    List<String>? originCountry,
    String? originalLanguage,
    String? originalName,
    String? overview,
    double? popularity,
    String? posterPath,
    double? voteAverage,
    int? voteCount,
  }) {
    return SerieEntity(
      backdropPath: backdropPath ?? this.backdropPath,
      firstAirDate: firstAirDate ?? this.firstAirDate,
      genreIds: genreIds ?? this.genreIds,
      id: id ?? this.id,
      name: name ?? this.name,
      originCountry: originCountry ?? this.originCountry,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalName: originalName ?? this.originalName,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
    );
  }

  @override
  String toString() {
    return 'SerieEntity(backdropPath: $backdropPath, '
        'firstAirDate: $firstAirDate, genreIds: $genreIds, id: $id, '
        'name: $name, originCountry: $originCountry, '
        'originalLanguage: $originalLanguage, originalName: $originalName, '
        'overview: $overview, popularity: $popularity, '
        'posterPath: $posterPath, voteAverage: $voteAverage, '
        'voteCount: $voteCount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SerieEntity &&
        other.backdropPath == backdropPath &&
        other.firstAirDate == firstAirDate &&
        listEquals(other.genreIds, genreIds) &&
        other.id == id &&
        other.name == name &&
        listEquals(other.originCountry, originCountry) &&
        other.originalLanguage == originalLanguage &&
        other.originalName == originalName &&
        other.overview == overview &&
        other.popularity == popularity &&
        other.posterPath == posterPath &&
        other.voteAverage == voteAverage &&
        other.voteCount == voteCount;
  }

  @override
  int get hashCode => Object.hashAll([
        backdropPath,
        firstAirDate,
        Object.hashAll(genreIds),
        id,
        name,
        Object.hashAll(originCountry),
        originalLanguage,
        originalName,
        overview,
        popularity,
        posterPath,
        voteAverage,
        voteCount,
      ]);
}
