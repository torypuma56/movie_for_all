import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_4_all/features/home/presentation/providers/home_state.dart';
import 'package:movies_4_all/features/play_now_movies/data/repo_impl/play_now_movie_repo_impl.dart';
import 'package:movies_4_all/features/play_now_movies/domain/entities/play_now_movie_entity.dart';
import 'package:movies_4_all/features/series/data/repo/series_repo_impl.dart';
import 'package:movies_4_all/features/top_rated_movies/data/repo/top_rated_movie_repo_impl.dart';
import 'package:movies_4_all/features/trending_movies/data/repo_impl/trending_movie_repo_impl.dart';

class HomeProvider extends AsyncNotifier<HomeState> {
  @override
  Future<HomeState> build() async {
    return _fetchHomeInfo();
  }

  Future<HomeState> _fetchHomeInfo() async {
    // Se lanzan todos los futures en paralelo y luego se esperan
    final trendingFuture = ref
        .watch(trendingMovieRepoProvider)
        .getTrendingMovie();
    final playNowFuture = ref
        .watch(playNowMovieRepoProvider)
        .getPlayNowMovies();
    final topRatedFuture = ref
        .watch(topRatedMovieRepoProvider)
        .getTopRatedMovies();
    final popularSeriesFuture = ref
        .watch(seriesRepoProvider)
        .getPopularSeries();
    final onAirSeriesFuture = ref
        .watch(seriesRepoProvider)
        .getOnAirSeries();
    final topSeriesFuture = ref.watch(seriesRepoProvider).getTopSeries();

    final trendingMovie = await trendingFuture;
    final playNowMovies = await playNowFuture;
    final topRatedMovies = await topRatedFuture;
    final popularSeries = await popularSeriesFuture;
    final onAirSeries = await onAirSeriesFuture;
    final topSeries = await topSeriesFuture;

    playNowMovies.sort((a, b) {
      if (a.releaseDate != null && b.releaseDate != null) {
        return a.releaseDate!.isBefore(b.releaseDate!) ? -1 : 1;
      }
      if (a.releaseDate == null && b.releaseDate != null) {
        return -1;
      }
      if (a.releaseDate != null && b.releaseDate == null) {
        return 1;
      }
      return 0;
    });

    topRatedMovies.sort((a, b) => b.voteAverage.compareTo(a.voteAverage));
    popularSeries.sort((a, b) => b.popularity.compareTo(a.popularity));
    onAirSeries.sort((a, b) {
      if (a.firstAirDate != null && b.firstAirDate != null) {
        return b.firstAirDate!.compareTo(a.firstAirDate!);
      }
      if (a.firstAirDate == null && b.firstAirDate != null) return 1;
      if (a.firstAirDate != null && b.firstAirDate == null) return -1;
      return 0;
    });
    topSeries.sort((a, b) => b.voteAverage.compareTo(a.voteAverage));

    return HomeState(
      trendingMovie: trendingMovie,
      playNowMovies: playNowMovies.take(10).toList(),
      topRatedMovies: topRatedMovies.take(10).toList(),
      popularSeries: popularSeries.take(10).toList(),
      onAirSeries: onAirSeries.take(10).toList(),
      topSeries: topSeries.take(10).toList(),
    );
  }

  /// Recarga los datos de la pantalla principal
  Future<void> reload() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchHomeInfo());
  }

  List<PlayNowMovieEntity> getTenMovies(List<PlayNowMovieEntity> movies) {
    return movies.take(10).toList();
  }
}

final homeNotifierProvider = AsyncNotifierProvider<HomeProvider, HomeState>(
  HomeProvider.new,
);
