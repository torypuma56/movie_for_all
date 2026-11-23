import '../../domain/entity/trending_movies_entity.dart';
import 'trending_movie_model.dart';

class TrendingMoviesModel extends TrendingMoviesEntity {
  const TrendingMoviesModel({
    required super.page,
    required super.results,
    required super.totalPages,
    required super.totalResults,
  });

  factory TrendingMoviesModel.fromJson(Map<String, dynamic> json) {
    return TrendingMoviesModel(
      page: (json['page'] as num?)?.toInt() ?? 0,
      results: (json['results'] as List<dynamic>? ?? const [])
          .map(
            (movie) =>
                TrendingMovieModel.fromJson(movie as Map<String, dynamic>),
          )
          .toList(),
      totalPages: (json['total_pages'] as num?)?.toInt() ?? 0,
      totalResults: (json['total_results'] as num?)?.toInt() ?? 0,
    );
  }

  factory TrendingMoviesModel.fromEntity(TrendingMoviesEntity entity) {
    return TrendingMoviesModel(
      page: entity.page,
      results: entity.results
          .map((movie) => TrendingMovieModel.fromEntity(movie))
          .toList(),
      totalPages: entity.totalPages,
      totalResults: entity.totalResults,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'results': results
          .cast<TrendingMovieModel>()
          .map((movie) => movie.toJson())
          .toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }

  TrendingMoviesEntity toEntity() {
    return TrendingMoviesEntity(
      page: page,
      results: results
          .map(
            (movie) => movie is TrendingMovieModel ? movie.toEntity() : movie,
          )
          .toList(),
      totalPages: totalPages,
      totalResults: totalResults,
    );
  }
}
