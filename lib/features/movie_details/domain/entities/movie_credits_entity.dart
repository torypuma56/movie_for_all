import 'package:flutter/foundation.dart';

import 'cast_entity.dart';

class MovieCreditsEntity {
  const MovieCreditsEntity({required this.id, required this.cast});

  final int id;
  final List<CastEntity> cast;

  List<CastEntity> get filteredActingCast {
    final actors = cast
        .where((member) {
          final profilePath = member.profilePath;
          return !member.adult &&
              member.knownForDepartment.toLowerCase() == 'acting' &&
              profilePath != null &&
              profilePath.trim().isNotEmpty &&
              member.name.trim().isNotEmpty &&
              member.character.trim().isNotEmpty;
        })
        .toList()
        ..sort((a, b) => a.order.compareTo(b.order));
    return actors;
  }

  MovieCreditsEntity copyWith({int? id, List<CastEntity>? cast}) {
    return MovieCreditsEntity(
      id: id ?? this.id,
      cast: cast ?? this.cast,
    );
  }

  @override
  String toString() => 'MovieCreditsEntity(id: $id, cast: $cast)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MovieCreditsEntity &&
        other.id == id &&
        listEquals(other.cast, cast);
  }

  @override
  int get hashCode => Object.hash(id, Object.hashAll(cast));
}
