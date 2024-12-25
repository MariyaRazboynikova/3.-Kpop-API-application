import 'dart:convert';

import 'package:kpop_application/data/models/group_model.dart';
import 'package:kpop_application/data/models/idol_member.dart';

Groups groupsFromJson(String str) => Groups.fromJson(json.decode(str));
String groupsToJson(Groups data) => json.encode(data.toJson());

class Groups {
  final List<Group> groups;
  final List<Idol> idols;

  Groups({required this.groups, required this.idols});

  factory Groups.fromJson(Map<String, dynamic> json) => Groups(
        groups: List<Group>.from(json["groups"].map((x) => Group.fromJson(x))),
        idols: List<Idol>.from(json["idols"].map((x) => Idol.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "groups": List<dynamic>.from(groups.map((x) => x.toJson())),
        "idols": List<dynamic>.from(idols.map((x) => x.toJson())),
      };
}
