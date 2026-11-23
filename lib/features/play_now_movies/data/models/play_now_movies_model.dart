import '../../domain/entities/play_now_movies_entity.dart';
import 'play_now_dates_model.dart';
import 'play_now_movie_model.dart';

class PlayNowMoviesModel extends PlayNowMoviesEntity {
  const PlayNowMoviesModel({
    super.dates,
    required super.page,
    required super.results,
    required super.totalPages,
    required super.totalResults,
  });

  factory PlayNowMoviesModel.fromJson(Map<String, dynamic> json) {
    return PlayNowMoviesModel(
      dates: json['dates'] == null
          ? null
          : PlayNowDatesModel.fromJson(json['dates'] as Map<String, dynamic>),
      page: (json['page'] as num?)?.toInt() ?? 0,
      results: (json['results'] as List<dynamic>? ?? const [])
          .map(
            (movie) =>
                PlayNowMovieModel.fromJson(movie as Map<String, dynamic>),
          )
          .toList(),
      totalPages: (json['total_pages'] as num?)?.toInt() ?? 0,
      totalResults: (json['total_results'] as num?)?.toInt() ?? 0,
    );
  }

  factory PlayNowMoviesModel.fromEntity(PlayNowMoviesEntity entity) {
    return PlayNowMoviesModel(
      dates: entity.dates == null
          ? null
          : PlayNowDatesModel.fromEntity(entity.dates!),
      page: entity.page,
      results: entity.results
          .map((movie) => PlayNowMovieModel.fromEntity(movie))
          .toList(),
      totalPages: entity.totalPages,
      totalResults: entity.totalResults,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dates': (dates as PlayNowDatesModel?)?.toJson(),
      'page': page,
      'results': results
          .cast<PlayNowMovieModel>()
          .map((movie) => movie.toJson())
          .toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }

  PlayNowMoviesEntity toEntity() {
    return PlayNowMoviesEntity(
      dates: dates is PlayNowDatesModel
          ? (dates as PlayNowDatesModel).toEntity()
          : dates,
      page: page,
      results: results
          .map(
            (movie) => movie is PlayNowMovieModel ? movie.toEntity() : movie,
          )
          .toList(),
      totalPages: totalPages,
      totalResults: totalResults,
    );
  }
}
