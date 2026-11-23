import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_4_all/features/movie_details/data/repo_impl/movie_details_repo_impl.dart';
import 'package:movies_4_all/features/movie_details/domain/entities/cast_entity.dart';
import 'package:movies_4_all/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:movies_4_all/features/movie_details/presentation/providers/movie_details_state.dart';

class MovieDetailsNotifier extends AsyncNotifier<MovieDetailsState> {
  MovieDetailsNotifier(this.movieId);

  final int movieId;

  Future<MovieDetailsState> _fetch() async {
    final repo = ref.read(movieDetailsProvider);
    final results = await Future.wait<dynamic>([
      repo.getMovieDetails(movieId),
      repo.getMovieCredits(movieId),
    ]);
    return MovieDetailsState(
      movieId: movieId,
      movieDetails: results[0] as MovieDetailsEntity,
      cast: results[1] as List<CastEntity>,
    );
  }

  @override
  Future<MovieDetailsState> build() => _fetch();

  Future<void> reload() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_fetch);
  }
}

final movieDetailsNotifierProvider =
    AsyncNotifierProvider.family<MovieDetailsNotifier, MovieDetailsState, int>(
      MovieDetailsNotifier.new,
    );
