import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_4_all/core/dio_options/dio_conector.dart';
import 'package:movies_4_all/features/trending_movies/data/models/trending_movie_model.dart';
import 'package:movies_4_all/features/trending_movies/domain/entity/trending_movie_entity.dart';
import 'package:movies_4_all/features/trending_movies/domain/repo/trending_movies_repo.dart';

import '../../../../core/data/data_sources/end_points.dart';

class TrendingMovieRepoImpl implements TrendingMoviesRepo {
  TrendingMovieRepoImpl({DioConnector? dioConnector})
    : _dioConnector = dioConnector ?? DioConnector();

  final DioConnector _dioConnector;

  @override
  Future<TrendingMovieEntity> getTrendingMovie() async {
    const String timeWindow = 'day';
    final String url = EndPoints.trendingMoviesUrl(timeWindow);

    final response = await _dioConnector.get(url);
    final data = response.data as Map<String, dynamic>;
    final results = data['results'] as List<dynamic>?;

    if (results == null || results.isEmpty) {
      throw Exception('No trending movies found in results');
    }

    final firstMovieJson = results.first as Map<String, dynamic>;
    final movieModel = TrendingMovieModel.fromJson(firstMovieJson);

    return movieModel.toEntity();
  }
}

final trendingMovieRepoProvider = Provider<TrendingMoviesRepo>((ref) {
  final dioConnector = ref.watch(dioConnectorProvider);
  return TrendingMovieRepoImpl(dioConnector: dioConnector);
});
