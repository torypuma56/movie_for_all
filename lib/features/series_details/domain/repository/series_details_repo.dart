import 'package:movies_4_all/features/movie_details/domain/entities/cast_entity.dart';
import 'package:movies_4_all/features/series_details/domain/entities/serie_details_entity.dart';

abstract class SeriesDetailsRepo {
  Future<SerieDetailsEntity> getSeriesDetails(int id);
  Future<List<CastEntity>> getSeriesCredits(int id);
}
