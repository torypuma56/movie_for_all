import 'package:movies_4_all/features/series/domain/entities/serie_entity.dart';

abstract class SeriesRepo {
  Future<List<SerieEntity>> getPopularSeries();
  Future<List<SerieEntity>> getOnAirSeries();
  Future<List<SerieEntity>> getTopSeries();
}
