class SpokenLanguageEntity {
  const SpokenLanguageEntity({
    required this.englishName,
    required this.name,
    this.iso6391,
  });

  final String englishName;
  final String name;
  final String? iso6391;

  SpokenLanguageEntity copyWith({
    String? englishName,
    String? name,
    String? iso6391,
  }) {
    return SpokenLanguageEntity(
      englishName: englishName ?? this.englishName,
      name: name ?? this.name,
      iso6391: iso6391 ?? this.iso6391,
    );
  }

  @override
  String toString() =>
      'SpokenLanguageEntity(englishName: $englishName, name: $name, iso6391: $iso6391)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SpokenLanguageEntity &&
        other.englishName == englishName &&
        other.name == name &&
        other.iso6391 == iso6391;
  }

  @override
  int get hashCode => Object.hash(englishName, name, iso6391);
}
