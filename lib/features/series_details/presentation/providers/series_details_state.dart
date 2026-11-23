import 'package:flutter/foundation.dart';
import 'package:movies_4_all/features/movie_details/domain/entities/cast_entity.dart';
import 'package:movies_4_all/features/series_details/domain/entities/serie_details_entity.dart';

class SeriesDetailsState {
  final int seriesId;
  final SerieDetailsEntity serieDetails;
  final List<CastEntity> cast;

  const SeriesDetailsState({
    required this.seriesId,
    required this.serieDetails,
    this.cast = const <CastEntity>[],
  });

  SeriesDetailsState copyWith({
    int? seriesId,
    SerieDetailsEntity? serieDetails,
    List<CastEntity>? cast,
  }) {
    return SeriesDetailsState(
      seriesId: seriesId ?? this.seriesId,
      serieDetails: serieDetails ?? this.serieDetails,
      cast: cast ?? this.cast,
    );
  }

  @override
  String toString() {
    return 'SeriesDetailsState(seriesId: $seriesId, '
        'serieDetails: $serieDetails, cast: $cast)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SeriesDetailsState &&
        other.seriesId == seriesId &&
        other.serieDetails == serieDetails &&
        listEquals(other.cast, cast);
  }

  @override
  int get hashCode => Object.hash(seriesId, serieDetails, Object.hashAll(cast));
}
