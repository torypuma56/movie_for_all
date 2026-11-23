import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_4_all/core/data/data_sources/end_points.dart';
import 'package:movies_4_all/core/dio_options/dio_conector.dart';
import 'package:movies_4_all/features/play_now_movies/data/models/play_now_movie_model.dart';
import 'package:movies_4_all/features/play_now_movies/domain/entities/play_now_movie_entity.dart';
import 'package:movies_4_all/features/play_now_movies/domain/repo/play_now_movie_repo.dart';

class PlayNowMovieRepoImpl implements PlayNowMovieRepo {
  PlayNowMovieRepoImpl({DioConnector? dioConnector})
    : _dioConnector = dioConnector ?? DioConnector();

  final DioConnector _dioConnector;

  @override
  Future<List<PlayNowMovieEntity>> getPlayNowMovies() async {
    try {
      final response = await _dioConnector.get(EndPoints.playNowMoviesUrl);
      final data = response.data as Map<String, dynamic>;
      final results = data['results'] as List<dynamic>?;

      if (results == null || results.isEmpty) {
        throw Exception('No play now movies found in results');
      }

      final movies = results
          .map<PlayNowMovieEntity>(
            (playNowMovie) =>
                PlayNowMovieModel.fromJson(playNowMovie as Map<String, dynamic>)
                    .toEntity(),
          )
          .toList();

      return movies;
    } catch (e) {
      throw Exception('Error fetching now playing movies: $e');
    }
  }
}

final playNowMovieRepoProvider = Provider<PlayNowMovieRepo>((ref) {
  final dioConnector = ref.watch(dioConnectorProvider);
  return PlayNowMovieRepoImpl(dioConnector: dioConnector);
});
