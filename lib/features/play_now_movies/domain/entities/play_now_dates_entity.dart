class PlayNowDatesEntity {
  const PlayNowDatesEntity({required this.maximum, required this.minimum});

  final String maximum;
  final String minimum;

  PlayNowDatesEntity copyWith({String? maximum, String? minimum}) {
    return PlayNowDatesEntity(
      maximum: maximum ?? this.maximum,
      minimum: minimum ?? this.minimum,
    );
  }

  @override
  String toString() => 'PlayNowDatesEntity(maximum: $maximum, minimum: $minimum)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PlayNowDatesEntity &&
        other.maximum == maximum &&
        other.minimum == minimum;
  }

  @override
  int get hashCode => Object.hash(maximum, minimum);
}
