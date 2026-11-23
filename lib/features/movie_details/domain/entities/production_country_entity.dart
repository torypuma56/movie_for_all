class ProductionCountryEntity {
  const ProductionCountryEntity({required this.iso31661, required this.name});

  final String iso31661;
  final String name;

  ProductionCountryEntity copyWith({String? iso31661, String? name}) {
    return ProductionCountryEntity(
      iso31661: iso31661 ?? this.iso31661,
      name: name ?? this.name,
    );
  }

  @override
  String toString() =>
      'ProductionCountryEntity(iso31661: $iso31661, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProductionCountryEntity &&
        other.iso31661 == iso31661 &&
        other.name == name;
  }

  @override
  int get hashCode => Object.hash(iso31661, name);
}
