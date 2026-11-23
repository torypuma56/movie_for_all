class SeasonEntity {
  const SeasonEntity({
    this.airDate,
    required this.episodeCount,
    required this.id,
    required this.name,
    required this.overview,
    this.posterPath,
    required this.seasonNumber,
    required this.voteAverage,
  });

  final DateTime? airDate;
  final int episodeCount;
  final int id;
  final String name;
  final String overview;
  final String? posterPath;
  final int seasonNumber;
  final double voteAverage;

  SeasonEntity copyWith({
    DateTime? airDate,
    int? episodeCount,
    int? id,
    String? name,
    String? overview,
    String? posterPath,
    int? seasonNumber,
    double? voteAverage,
  }) {
    return SeasonEntity(
      airDate: airDate ?? this.airDate,
      episodeCount: episodeCount ?? this.episodeCount,
      id: id ?? this.id,
      name: name ?? this.name,
      overview: overview ?? this.overview,
      posterPath: posterPath ?? this.posterPath,
      seasonNumber: seasonNumber ?? this.seasonNumber,
      voteAverage: voteAverage ?? this.voteAverage,
    );
  }

  @override
  String toString() =>
      'SeasonEntity(airDate: $airDate, episodeCount: $episodeCount, id: $id, name: $name, overview: $overview, posterPath: $posterPath, seasonNumber: $seasonNumber, voteAverage: $voteAverage)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SeasonEntity &&
        other.airDate == airDate &&
        other.episodeCount == episodeCount &&
        other.id == id &&
        other.name == name &&
        other.overview == overview &&
        other.posterPath == posterPath &&
        other.seasonNumber == seasonNumber &&
        other.voteAverage == voteAverage;
  }

  @override
  int get hashCode => Object.hash(
        airDate,
        episodeCount,
        id,
        name,
        overview,
        posterPath,
        seasonNumber,
        voteAverage,
      );
}
