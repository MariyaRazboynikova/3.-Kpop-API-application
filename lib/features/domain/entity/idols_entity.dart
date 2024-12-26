class IdolEntity {
  final String id;
  final String name;
  final String realName;
  final DateTime birthDate;
  final double? height;
  final double? weight;
  final List<String> groups;
  final String? thumbUrl;

  IdolEntity({
    required this.id,
    required this.name,
    required this.realName,
    required this.birthDate,
    this.height,
    this.weight,
    required this.groups,
    this.thumbUrl,
  });

  IdolEntity copyWith({
    String? id,
    String? name,
    String? realName,
    DateTime? birthDate,
    double? height,
    double? weight,
    List<String>? groups,
    String? thumbUrl,
  }) {
    return IdolEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      realName: realName ?? this.realName,
      birthDate: birthDate ?? this.birthDate,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      groups: groups ?? this.groups,
      thumbUrl: thumbUrl ?? this.thumbUrl,
    );
  }
}
