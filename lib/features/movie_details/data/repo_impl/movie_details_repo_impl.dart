import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_4_all/core/data/data_sources/end_points.dart';
import 'package:movies_4_all/core/dio_options/dio_conector.dart';
import 'package:movies_4_all/features/movie_details/data/models/movie_credits_model.dart';
import 'package:movies_4_all/features/movie_details/data/models/movie_details_model.dart';
import 'package:movies_4_all/features/movie_details/domain/entities/cast_entity.dart';
import 'package:movies_4_all/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:movies_4_all/features/movie_details/domain/repository/movie_details_repo.dart';

class MovieDetailsRepoImp implements MovieDetailsRepo {
  MovieDetailsRepoImp({DioConnector? dioConnector})
    : _dioConnector = dioConnector ?? DioConnector();

  final DioConnector _dioConnector;
  @override
  Future<MovieDetailsEntity> getMovieDetails(int id) async {
    try {
      final response = await _dioConnector.get(EndPoints.movieDetails(id));
      final movieDetailsModel = MovieDetailsModel.fromJson(
        response.data as Map<String, dynamic>,
      );
      return movieDetailsModel.toEntity();
    } catch (e) {
      throw Exception('Error fetching movie details: $e');
    }
  }

  @override
  Future<List<CastEntity>> getMovieCredits(int id) async {
    try {
      final response = await _dioConnector.get(EndPoints.movieCredits(id));
      final credits = MovieCreditsModel.fromJson(
        response.data as Map<String, dynamic>,
      ).toEntity();
      return credits.filteredActingCast.take(10).toList();
    } catch (e) {
      return const <CastEntity>[];
    }
  }
}

final movieDetailsProvider = Provider<MovieDetailsRepo>((ref) {
  final dioConnector = ref.watch(dioConnectorProvider);
  return MovieDetailsRepoImp(dioConnector: dioConnector);
}); // Provider
