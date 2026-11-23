import '../../domain/entities/movie_credits_entity.dart';
import 'cast_model.dart';

class MovieCreditsModel extends MovieCreditsEntity {
  const MovieCreditsModel({required super.id, required super.cast});

  factory MovieCreditsModel.fromJson(Map<String, dynamic> json) {
    return MovieCreditsModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      cast: (json['cast'] as List<dynamic>? ?? const [])
          .map((cast) => CastModel.fromJson(cast as Map<String, dynamic>))
          .toList(),
    );
  }

  factory MovieCreditsModel.fromEntity(MovieCreditsEntity entity) {
    return MovieCreditsModel(
      id: entity.id,
      cast: entity.cast.map((cast) => CastModel.fromEntity(cast)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cast': cast.cast<CastModel>().map((item) => item.toJson()).toList(),
    };
  }

  MovieCreditsEntity toEntity() {
    return MovieCreditsEntity(
      id: id,
      cast: cast
          .map((cast) => cast is CastModel ? cast.toEntity() : cast)
          .toList(),
    );
  }
}
