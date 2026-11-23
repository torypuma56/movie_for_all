import '../../domain/entities/play_now_dates_entity.dart';

class PlayNowDatesModel extends PlayNowDatesEntity {
  const PlayNowDatesModel({required super.maximum, required super.minimum});

  factory PlayNowDatesModel.fromJson(Map<String, dynamic> json) {
    return PlayNowDatesModel(
      maximum: json['maximum'] as String? ?? '',
      minimum: json['minimum'] as String? ?? '',
    );
  }

  factory PlayNowDatesModel.fromEntity(PlayNowDatesEntity entity) {
    return PlayNowDatesModel(maximum: entity.maximum, minimum: entity.minimum);
  }

  Map<String, dynamic> toJson() {
    return {'maximum': maximum, 'minimum': minimum};
  }

  PlayNowDatesEntity toEntity() {
    return PlayNowDatesEntity(maximum: maximum, minimum: minimum);
  }
}
