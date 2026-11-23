import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_4_all/core/data/data_sources/end_points.dart';
import 'package:movies_4_all/core/dio_options/dio_conector.dart';
import 'package:movies_4_all/features/movie_details/data/models/movie_credits_model.dart';
import 'package:movies_4_all/features/movie_details/domain/entities/cast_entity.dart';
import 'package:movies_4_all/features/series_details/data/models/serie_details_model.dart';
import 'package:movies_4_all/features/series_details/domain/entities/serie_details_entity.dart';
import 'package:movies_4_all/features/series_details/domain/repository/series_details_repo.dart';

class SeriesDetailsRepoImpl implements SeriesDetailsRepo {
  SeriesDetailsRepoImpl({DioConnector? dioConnector})
    : _dioConnector = dioConnector ?? DioConnector();

  final DioConnector _dioConnector;

  @override
  Future<SerieDetailsEntity> getSeriesDetails(int id) async {
    try {
      final response = await _dioConnector.get(EndPoints.seriesDetails(id));
      final serieDetailsModel = SerieDetailsModel.fromJson(
        response.data as Map<String, dynamic>,
      );
      return serieDetailsModel.toEntity();
    } catch (e) {
      throw Exception('Error fetching series details: $e');
    }
  }

  @override
  Future<List<CastEntity>> getSeriesCredits(int id) async {
    try {
      final response = await _dioConnector.get(EndPoints.seriesCredits(id));
      final credits = MovieCreditsModel.fromJson(
        response.data as Map<String, dynamic>,
      ).toEntity();
      return credits.filteredActingCast.take(10).toList();
    } catch (e) {
      return const <CastEntity>[];
    }
  }
}

final seriesDetailsProvider = Provider<SeriesDetailsRepo>((ref) {
  final dioConnector = ref.watch(dioConnectorProvider);
  return SeriesDetailsRepoImpl(dioConnector: dioConnector);
}); // Provider
