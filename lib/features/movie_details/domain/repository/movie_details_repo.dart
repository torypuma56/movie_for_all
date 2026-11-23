import 'package:movies_4_all/features/movie_details/domain/entities/cast_entity.dart';
import 'package:movies_4_all/features/movie_details/domain/entities/movie_details_entity.dart';

abstract class MovieDetailsRepo {
  Future<MovieDetailsEntity> getMovieDetails(int id);
  Future<List<CastEntity>> getMovieCredits(int id);
}
