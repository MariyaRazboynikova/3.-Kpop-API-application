import 'package:kpop_application/features/data/models/member_model.dart';

class Group {
  final String agencyName;
  final DateTime? debutDate;
  final DateTime? disbandDate;
  final String id;
  final List<Member> members;
  final String name;
  final String? nameAlias;
  final String nameOriginal;
  final String? parentId;
  final String? thumbUrl;
  final List<String> urls;

  Group({
    required this.agencyName,
    required this.debutDate,
    required this.disbandDate,
    required this.id,
    required this.members,
    required this.name,
    required this.nameAlias,
    required this.nameOriginal,
    required this.parentId,
    required this.thumbUrl,
    required this.urls,
  });

  factory Group.fromJson(Map<String, dynamic> json) => Group(
    agencyName: json["agency_name"],
    debutDate:
        json["debut_date"] == null ? null : DateTime.parse(json["debut_date"]),
    disbandDate:
        json["disband_date"] == null
            ? null
            : DateTime.parse(json["disband_date"]),
    id: json["id"],
    members: List<Member>.from(json["members"].map((x) => Member.fromJson(x))),
    name: json["name"],
    nameAlias: json["name_alias"],
    nameOriginal: json["name_original"],
    parentId: json["parent_id"],
    thumbUrl: json["thumb_url"],
    urls: List<String>.from(json["urls"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "agency_name": agencyName,
    "debut_date": debutDate?.toIso8601String(),
    "disband_date": disbandDate?.toIso8601String(),
    "id": id,
    "members": List<dynamic>.from(members.map((x) => x.toJson())),
    "name": name,
    "name_alias": nameAlias,
    "name_original": nameOriginal,
    "parent_id": parentId,
    "thumb_url": thumbUrl,
    "urls": List<dynamic>.from(urls.map((x) => x)),
  };
}
