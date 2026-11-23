import 'package:flutter/foundation.dart';
import 'package:movies_4_all/features/movie_details/domain/entities/cast_entity.dart';
import 'package:movies_4_all/features/movie_details/domain/entities/genre_entity.dart';
import 'package:movies_4_all/features/movie_details/domain/entities/movie_details_entity.dart';

class MovieDetailsState {
  final int movieId;
  final MovieDetailsEntity movieDetails;
  final List<CastEntity> cast;

  const MovieDetailsState({
    required this.movieId,
    required this.movieDetails,
    this.cast = const <CastEntity>[],
  });

  MovieDetailsState copyWith({
    int? movieId,
    MovieDetailsEntity? movieDetails,
    List<CastEntity>? cast,
  }) {
    return MovieDetailsState(
      movieId: movieId ?? this.movieId,
      movieDetails: movieDetails ?? this.movieDetails,
      cast: cast ?? this.cast,
    );
  }

  @override
  String toString() {
    return 'MovieDetailsState(movieId: $movieId, '
        'movieDetails: $movieDetails, cast: $cast)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MovieDetailsState &&
        other.movieId == movieId &&
        other.movieDetails == movieDetails &&
        listEquals(other.cast, cast);
  }

  @override
  int get hashCode => Object.hash(movieId, movieDetails, Object.hashAll(cast));

  List<GenreEntity> get genres => movieDetails.genres;
}
