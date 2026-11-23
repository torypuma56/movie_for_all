import '../../domain/entities/episode_entity.dart';

class EpisodeModel extends EpisodeEntity {
  const EpisodeModel({
    required super.id,
    required super.name,
    required super.overview,
    required super.voteAverage,
    required super.voteCount,
    super.airDate,
    required super.episodeNumber,
    required super.productionCode,
    super.runtime,
    required super.seasonNumber,
    required super.showId,
    super.stillPath,
  });

  factory EpisodeModel.fromJson(Map<String, dynamic> json) {
    return EpisodeModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      overview: json['overview'] as String? ?? '',
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0,
      voteCount: (json['vote_count'] as num?)?.toInt() ?? 0,
      airDate: DateTime.tryParse(json['air_date'] as String? ?? ''),
      episodeNumber: (json['episode_number'] as num?)?.toInt() ?? 0,
      productionCode: json['production_code'] as String? ?? '',
      runtime: (json['runtime'] as num?)?.toInt(),
      seasonNumber: (json['season_number'] as num?)?.toInt() ?? 0,
      showId: (json['show_id'] as num?)?.toInt() ?? 0,
      stillPath: json['still_path'] as String?,
    );
  }

  factory EpisodeModel.fromEntity(EpisodeEntity entity) {
    return EpisodeModel(
      id: entity.id,
      name: entity.name,
      overview: entity.overview,
      voteAverage: entity.voteAverage,
      voteCount: entity.voteCount,
      airDate: entity.airDate,
      episodeNumber: entity.episodeNumber,
      productionCode: entity.productionCode,
      runtime: entity.runtime,
      seasonNumber: entity.seasonNumber,
      showId: entity.showId,
      stillPath: entity.stillPath,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'overview': overview,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'air_date': airDate?.toIso8601String().split('T').first,
      'episode_number': episodeNumber,
      'production_code': productionCode,
      'runtime': runtime,
      'season_number': seasonNumber,
      'show_id': showId,
      'still_path': stillPath,
    };
  }

  EpisodeEntity toEntity() {
    return EpisodeEntity(
      id: id,
      name: name,
      overview: overview,
      voteAverage: voteAverage,
      voteCount: voteCount,
      airDate: airDate,
      episodeNumber: episodeNumber,
      productionCode: productionCode,
      runtime: runtime,
      seasonNumber: seasonNumber,
      showId: showId,
      stillPath: stillPath,
    );
  }
}
