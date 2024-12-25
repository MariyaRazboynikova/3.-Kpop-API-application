import 'package:kpop_application/domain/entity/members_entity.dart';

class GroupEntity {
  final String id;
  final String name;
  final String agencyName;
  final DateTime? debutDate;
  final DateTime? disbandDate;
  final List<MemberEntity> members;
  final String? thumbUrl;
  final List<String> urls;

  GroupEntity({
    required this.id,
    required this.name,
    required this.agencyName,
    this.debutDate,
    this.disbandDate,
    required this.members,
    this.thumbUrl,
    required this.urls,
  });

  GroupEntity copyWith({
    String? id,
    String? name,
    String? agencyName,
    DateTime? debutDate,
    DateTime? disbandDate,
    List<MemberEntity>? members,
    String? thumbUrl,
    List<String>? urls,
  }) {
    return GroupEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      agencyName: agencyName ?? this.agencyName,
      debutDate: debutDate ?? this.debutDate,
      disbandDate: disbandDate ?? this.disbandDate,
      members: members ?? this.members,
      thumbUrl: thumbUrl ?? this.thumbUrl,
      urls: urls ?? this.urls,
    );
  }
}
