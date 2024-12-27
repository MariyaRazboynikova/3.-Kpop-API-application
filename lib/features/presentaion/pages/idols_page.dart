import 'package:flutter/material.dart';
import 'package:kpop_application/features/data/models/idol_member.dart';

import 'package:flutter/material.dart';
import 'package:kpop_application/features/data/models/group_model.dart';
import 'package:kpop_application/features/data/models/idol_member.dart';
import 'package:kpop_application/features/data/models/member_model.dart';

class IdolsPage extends StatelessWidget {
  final String memberId; // ID участника
  final List<Idol> idols; // Список идолов
  final List<Group> groups; // Список групп

  const IdolsPage({
    super.key,
    required this.memberId,
    required this.idols,
    required this.groups, // Добавляем список групп
  });

  @override
  Widget build(BuildContext context) {
    // Получаем данные о члене по его ID
    Idol member = getMemberData(memberId, idols);

    // Получаем первую группу участника (если есть)
    Group memberGroup = groups.firstWhere(
      (group) => member.groups.isNotEmpty && group.id == member.groups[0],
      orElse:
          () => throw Exception('Группа не найдена для участника ${member.id}'),
    );

    return Scaffold(
      appBar: AppBar(title: Text(member.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (member.thumbUrl.isNotEmpty)
              Image.network(member.thumbUrl, height: 150, fit: BoxFit.cover),
            Text(
              'Имя: ${member.name}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Настоящее имя: ${member.realName}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Дата рождения: ${member.birthDate.toLocal().toString().split(' ')[0]}',
              style: const TextStyle(fontSize: 16),
            ),
            if (member.debutDate != null)
              Text(
                'Дата дебюта: ${member.debutDate!.toLocal().toString().split(' ')[0]}',
                style: const TextStyle(fontSize: 16),
              ),
            if (member.height != null)
              Text(
                'Рост: ${member.height} см',
                style: const TextStyle(fontSize: 16),
              ),
            if (member.weight != null)
              Text(
                'Вес: ${member.weight} кг',
                style: const TextStyle(fontSize: 16),
              ),
            if (memberGroup != null) ...[
              Text(
                'Группа: ${memberGroup.name}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Агентство: ${memberGroup.agencyName}',
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                'Позиция в группе: ${getMemberRole(member.id, memberGroup.members)}', // Используем id вместо idolId
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Idol getMemberData(String memberId, List<Idol> idols) {
    return idols.firstWhere(
      (idol) => idol.id == memberId,
      orElse: () => throw Exception('Idol with id $memberId not found'),
    );
  }

  String getMemberRole(String idolId, List<Member> members) {
    Member? member = members.firstWhere(
      (m) => m.idolId == idolId,
      orElse:
          () => Member(
            current: false,
            idolId: idolId,
            roles: null, // Указываем null или значение по умолчанию
          ),
    );
    return member.roles ??
        "Роль не указана"; // Возвращаем роль или сообщение о ее отсутствии
  }
}
