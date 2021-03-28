class SpaceLaunch {
  final int id;

  SpaceLaunch({
    required this.id,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpaceLaunch &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'SpaceLaunch{id: $id}';

  SpaceLaunch copyWith({
    int? id,
  }) =>
      SpaceLaunch(
        id: id ?? this.id,
      );

  factory SpaceLaunch.fromJson(Map<String, dynamic> json) =>
      SpaceLaunch(id: json['id']);
}
