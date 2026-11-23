import 'package:flutter/foundation.dart';

import 'trending_movie_entity.dart';

class TrendingMoviesEntity {
  const TrendingMoviesEntity({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final int page;
  final List<TrendingMovieEntity> results;
  final int totalPages;
  final int totalResults;

  TrendingMoviesEntity copyWith({
    int? page,
    List<TrendingMovieEntity>? results,
    int? totalPages,
    int? totalResults,
  }) {
    return TrendingMoviesEntity(
      page: page ?? this.page,
      results: results ?? this.results,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
    );
  }

  @override
  String toString() =>
      'TrendingMoviesEntity(page: $page, results: $results, '
      'totalPages: $totalPages, totalResults: $totalResults)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TrendingMoviesEntity &&
        other.page == page &&
        listEquals(other.results, results) &&
        other.totalPages == totalPages &&
        other.totalResults == totalResults;
  }

  @override
  int get hashCode => Object.hashAll([
        page,
        Object.hashAll(results),
        totalPages,
        totalResults,
      ]);
}
