import 'package:movies_4_all/features/top_rated_movies/domain/entities/top_rated_movie_entity.dart';

abstract class TopRatedMovieRepo {
  Future<List<TopRatedMovieEntity>> getTopRatedMovies();
}
