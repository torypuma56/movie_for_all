import '../../domain/entities/season_entity.dart';

class SeasonModel extends SeasonEntity {
  const SeasonModel({
    super.airDate,
    required super.episodeCount,
    required super.id,
    required super.name,
    required super.overview,
    super.posterPath,
    required super.seasonNumber,
    required super.voteAverage,
  });

  factory SeasonModel.fromJson(Map<String, dynamic> json) {
    return SeasonModel(
      airDate: DateTime.tryParse(json['air_date'] as String? ?? ''),
      episodeCount: (json['episode_count'] as num?)?.toInt() ?? 0,
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      overview: json['overview'] as String? ?? '',
      posterPath: json['poster_path'] as String?,
      seasonNumber: (json['season_number'] as num?)?.toInt() ?? 0,
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0,
    );
  }

  factory SeasonModel.fromEntity(SeasonEntity entity) {
    return SeasonModel(
      airDate: entity.airDate,
      episodeCount: entity.episodeCount,
      id: entity.id,
      name: entity.name,
      overview: entity.overview,
      posterPath: entity.posterPath,
      seasonNumber: entity.seasonNumber,
      voteAverage: entity.voteAverage,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'air_date': airDate?.toIso8601String().split('T').first,
      'episode_count': episodeCount,
      'id': id,
      'name': name,
      'overview': overview,
      'poster_path': posterPath,
      'season_number': seasonNumber,
      'vote_average': voteAverage,
    };
  }

  SeasonEntity toEntity() {
    return SeasonEntity(
      airDate: airDate,
      episodeCount: episodeCount,
      id: id,
      name: name,
      overview: overview,
      posterPath: posterPath,
      seasonNumber: seasonNumber,
      voteAverage: voteAverage,
    );
  }
}
