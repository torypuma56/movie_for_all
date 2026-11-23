import 'package:movies_4_all/features/trending_movies/domain/entity/trending_movie_entity.dart';

abstract class TrendingMoviesRepo {
  Future<TrendingMovieEntity> getTrendingMovie();
}
