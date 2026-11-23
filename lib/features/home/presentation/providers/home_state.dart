import 'package:movies_4_all/features/play_now_movies/domain/entities/play_now_movie_entity.dart';
import 'package:movies_4_all/features/series/domain/entities/serie_entity.dart';
import 'package:movies_4_all/features/top_rated_movies/domain/entities/top_rated_movie_entity.dart';
import 'package:movies_4_all/features/trending_movies/domain/entity/trending_movie_entity.dart';

class HomeState {
  final TrendingMovieEntity trendingMovie;
  final List<PlayNowMovieEntity> playNowMovies;
  final List<TopRatedMovieEntity> topRatedMovies;
  final List<SerieEntity> popularSeries;
  final List<SerieEntity> onAirSeries;
  final List<SerieEntity> topSeries;

  const HomeState({
    required this.trendingMovie,
    required this.playNowMovies,
    required this.topRatedMovies,
    required this.popularSeries,
    required this.onAirSeries,
    required this.topSeries,
  });

  HomeState copyWith({
    TrendingMovieEntity? trendingMovie,
    List<PlayNowMovieEntity>? playNowMovies,
    List<TopRatedMovieEntity>? topRatedMovies,
    List<SerieEntity>? popularSeries,
    List<SerieEntity>? onAirSeries,
    List<SerieEntity>? topSeries,
  }) {
    return HomeState(
      trendingMovie: trendingMovie ?? this.trendingMovie,
      playNowMovies: playNowMovies ?? this.playNowMovies,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      popularSeries: popularSeries ?? this.popularSeries,
      onAirSeries: onAirSeries ?? this.onAirSeries,
      topSeries: topSeries ?? this.topSeries,
    );
  }
}
