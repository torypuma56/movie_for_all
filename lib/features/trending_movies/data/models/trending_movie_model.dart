import '../../domain/entity/trending_movie_entity.dart';

class TrendingMovieModel extends TrendingMovieEntity {
  const TrendingMovieModel({
    required super.adult,
    super.backdropPath,
    required super.id,
    required super.title,
    required super.originalLanguage,
    required super.originalTitle,
    required super.overview,
    super.posterPath,
    required super.mediaType,
    required super.genreIds,
    required super.popularity,
    super.releaseDate,
    required super.video,
    required super.voteAverage,
    required super.voteCount,
  });

  factory TrendingMovieModel.fromJson(Map<String, dynamic> json) {
    return TrendingMovieModel(
      adult: json['adult'] as bool? ?? false,
      backdropPath: json['backdrop_path'] as String?,
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? '',
      originalLanguage: json['original_language'] as String? ?? '',
      originalTitle: json['original_title'] as String? ?? '',
      overview: json['overview'] as String? ?? '',
      posterPath: json['poster_path'] as String?,
      mediaType: json['media_type'] as String? ?? '',
      genreIds: List<int>.from(json['genre_ids'] as List<dynamic>? ?? const []),
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0,
      releaseDate: DateTime.tryParse(json['release_date'] as String? ?? ''),
      video: json['video'] as bool? ?? false,
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0,
      voteCount: (json['vote_count'] as num?)?.toInt() ?? 0,
    );
  }

  factory TrendingMovieModel.fromEntity(TrendingMovieEntity entity) {
    return TrendingMovieModel(
      adult: entity.adult,
      backdropPath: entity.backdropPath,
      id: entity.id,
      title: entity.title,
      originalLanguage: entity.originalLanguage,
      originalTitle: entity.originalTitle,
      overview: entity.overview,
      posterPath: entity.posterPath,
      mediaType: entity.mediaType,
      genreIds: entity.genreIds,
      popularity: entity.popularity,
      releaseDate: entity.releaseDate,
      video: entity.video,
      voteAverage: entity.voteAverage,
      voteCount: entity.voteCount,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'id': id,
      'title': title,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'poster_path': posterPath,
      'media_type': mediaType,
      'genre_ids': genreIds,
      'popularity': popularity,
      'release_date': releaseDate?.toIso8601String().split('T').first,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }

  TrendingMovieEntity toEntity() {
    return TrendingMovieEntity(
      adult: adult,
      backdropPath: backdropPath,
      id: id,
      title: title,
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
      overview: overview,
      posterPath: posterPath,
      mediaType: mediaType,
      genreIds: genreIds,
      popularity: popularity,
      releaseDate: releaseDate,
      video: video,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }
}
