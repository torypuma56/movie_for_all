import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_4_all/features/movie_details/domain/entities/cast_entity.dart';
import 'package:movies_4_all/features/series_details/data/repo_impl/series_details_repo_impl.dart';
import 'package:movies_4_all/features/series_details/domain/entities/serie_details_entity.dart';
import 'package:movies_4_all/features/series_details/presentation/providers/series_details_state.dart';

class SeriesDetailsNotifier extends AsyncNotifier<SeriesDetailsState> {
  SeriesDetailsNotifier(this.seriesId);

  final int seriesId;

  Future<SeriesDetailsState> _fetch() async {
    final repo = ref.read(seriesDetailsProvider);
    final results = await Future.wait<dynamic>([
      repo.getSeriesDetails(seriesId),
      repo.getSeriesCredits(seriesId),
    ]);
    return SeriesDetailsState(
      seriesId: seriesId,
      serieDetails: results[0] as SerieDetailsEntity,
      cast: results[1] as List<CastEntity>,
    );
  }

  @override
  Future<SeriesDetailsState> build() => _fetch();

  /// Recarga los datos de la serie
  Future<void> reload() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_fetch);
  }
}

/// Uso: ref.watch(seriesDetailsNotifierProvider(seriesId))
final seriesDetailsNotifierProvider = AsyncNotifierProvider.family<
  SeriesDetailsNotifier,
  SeriesDetailsState,
  int
>(SeriesDetailsNotifier.new);
