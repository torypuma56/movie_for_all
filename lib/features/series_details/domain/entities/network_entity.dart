class NetworkEntity {
  const NetworkEntity({
    required this.id,
    required this.name,
    this.logoPath,
    this.originCountry,
  });

  final int id;
  final String name;
  final String? logoPath;
  final String? originCountry;

  NetworkEntity copyWith({
    int? id,
    String? name,
    String? logoPath,
    String? originCountry,
  }) {
    return NetworkEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      logoPath: logoPath ?? this.logoPath,
      originCountry: originCountry ?? this.originCountry,
    );
  }

  @override
  String toString() =>
      'NetworkEntity(id: $id, name: $name, logoPath: $logoPath, originCountry: $originCountry)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is NetworkEntity &&
        other.id == id &&
        other.name == name &&
        other.logoPath == logoPath &&
        other.originCountry == originCountry;
  }

  @override
  int get hashCode => Object.hash(id, name, logoPath, originCountry);
}
