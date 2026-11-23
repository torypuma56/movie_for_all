import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_4_all/core/data/data_sources/end_points.dart';
import 'package:movies_4_all/core/dio_options/dio_conector.dart';
import 'package:movies_4_all/features/series/data/models/serie_model.dart';
import 'package:movies_4_all/features/series/domain/entities/serie_entity.dart';
import 'package:movies_4_all/features/series/domain/repo/series_repo.dart';

class SeriesRepoImpl implements SeriesRepo {
  SeriesRepoImpl({DioConnector? dioConnector})
    : _dioConnector = dioConnector ?? DioConnector();

  final DioConnector _dioConnector;

  Future<List<SerieEntity>> _fetchSeries(String url, String label) async {
    try {
      final response = await _dioConnector.get(url);
      final data = response.data as Map<String, dynamic>;
      final results = data['results'] as List<dynamic>?;

      if (results == null || results.isEmpty) {
        throw Exception('No $label series found in results');
      }

      return results
          .map<SerieEntity>(
            (serie) =>
                SerieModel.fromJson(serie as Map<String, dynamic>).toEntity(),
          )
          .toList();
    } catch (e) {
      throw Exception('Error fetching $label series: $e');
    }
  }

  @override
  Future<List<SerieEntity>> getPopularSeries() {
    return _fetchSeries(EndPoints.popularSeriesUrl, 'popular');
  }

  @override
  Future<List<SerieEntity>> getOnAirSeries() {
    return _fetchSeries(EndPoints.onAirSeriesUrl, 'on air');
  }

  @override
  Future<List<SerieEntity>> getTopSeries() {
    return _fetchSeries(EndPoints.topRatedSeriesUrl, 'top rated');
  }
}

final seriesRepoProvider = Provider<SeriesRepo>((ref) {
  final dioConnector = ref.watch(dioConnectorProvider);
  return SeriesRepoImpl(dioConnector: dioConnector);
});
