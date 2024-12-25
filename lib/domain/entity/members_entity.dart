class MemberEntity {
  final String idolId;
  final bool current;
  final String? roles;

  MemberEntity({
    required this.idolId,
    required this.current,
    this.roles,
  });

  MemberEntity copyWith({
    String? idolId,
    bool? current,
    String? roles,
  }) {
    return MemberEntity(
      idolId: idolId ?? this.idolId,
      current: current ?? this.current,
      roles: roles ?? this.roles,
    );
  }
}
