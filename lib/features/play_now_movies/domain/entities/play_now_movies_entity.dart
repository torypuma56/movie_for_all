import 'package:flutter/foundation.dart';

import 'play_now_dates_entity.dart';
import 'play_now_movie_entity.dart';

class PlayNowMoviesEntity {
  const PlayNowMoviesEntity({
    this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final PlayNowDatesEntity? dates;
  final int page;
  final List<PlayNowMovieEntity> results;
  final int totalPages;
  final int totalResults;

  PlayNowMoviesEntity copyWith({
    PlayNowDatesEntity? dates,
    int? page,
    List<PlayNowMovieEntity>? results,
    int? totalPages,
    int? totalResults,
  }) {
    return PlayNowMoviesEntity(
      dates: dates ?? this.dates,
      page: page ?? this.page,
      results: results ?? this.results,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
    );
  }

  @override
  String toString() =>
      'PlayNowMoviesEntity(dates: $dates, page: $page, results: $results, '
      'totalPages: $totalPages, totalResults: $totalResults)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PlayNowMoviesEntity &&
        other.dates == dates &&
        other.page == page &&
        listEquals(other.results, results) &&
        other.totalPages == totalPages &&
        other.totalResults == totalResults;
  }

  @override
  int get hashCode => Object.hashAll([
        dates,
        page,
        Object.hashAll(results),
        totalPages,
        totalResults,
      ]);
}
