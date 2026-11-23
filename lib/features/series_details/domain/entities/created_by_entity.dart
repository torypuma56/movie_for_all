class CreatedByEntity {
  const CreatedByEntity({
    required this.id,
    required this.creditId,
    required this.name,
    required this.gender,
    this.profilePath,
  });

  final int id;
  final String creditId;
  final String name;
  final int gender;
  final String? profilePath;

  CreatedByEntity copyWith({
    int? id,
    String? creditId,
    String? name,
    int? gender,
    String? profilePath,
  }) {
    return CreatedByEntity(
      id: id ?? this.id,
      creditId: creditId ?? this.creditId,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      profilePath: profilePath ?? this.profilePath,
    );
  }

  @override
  String toString() =>
      'CreatedByEntity(id: $id, creditId: $creditId, name: $name, gender: $gender, profilePath: $profilePath)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreatedByEntity &&
        other.id == id &&
        other.creditId == creditId &&
        other.name == name &&
        other.gender == gender &&
        other.profilePath == profilePath;
  }

  @override
  int get hashCode => Object.hash(id, creditId, name, gender, profilePath);
}
