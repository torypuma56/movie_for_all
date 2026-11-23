import 'package:movies_4_all/features/play_now_movies/domain/entities/play_now_movie_entity.dart';

abstract class PlayNowMovieRepo {
  Future<List<PlayNowMovieEntity>> getPlayNowMovies();
}
