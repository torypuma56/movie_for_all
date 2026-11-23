import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_4_all/core/data/data_sources/end_points.dart';
import 'package:movies_4_all/core/dio_options/dio_conector.dart';
import 'package:movies_4_all/features/top_rated_movies/data/models/top_rated_movie_model.dart';
import 'package:movies_4_all/features/top_rated_movies/domain/entities/top_rated_movie_entity.dart';
import 'package:movies_4_all/features/top_rated_movies/domain/repo/top_rated_movie_repo.dart';

class TopRatedMovieRepoImpl implements TopRatedMovieRepo {
  TopRatedMovieRepoImpl({DioConnector? dioConnector})
    : _dioConnector = dioConnector ?? DioConnector();

  final DioConnector _dioConnector;

  @override
  Future<List<TopRatedMovieEntity>> getTopRatedMovies() async {
    try {
      final response = await _dioConnector.get(EndPoints.topRatedMoviesUrl);
      final data = response.data as Map<String, dynamic>;
      final results = data['results'] as List<dynamic>?;

      if (results == null || results.isEmpty) {
        throw Exception('No top rated movies found in results');
      }

      final movies = results
          .map<TopRatedMovieEntity>(
            (topRatedMovie) =>
                TopRatedMovieModel.fromJson(
                  topRatedMovie as Map<String, dynamic>,
                ).toEntity(),
          )
          .toList();

      return movies;
    } catch (e) {
      throw Exception('Error fetching top rated movies: $e');
    }
  }
}

final topRatedMovieRepoProvider = Provider<TopRatedMovieRepo>((ref) {
  final dioConnector = ref.watch(dioConnectorProvider);
  return TopRatedMovieRepoImpl(dioConnector: dioConnector);
});
