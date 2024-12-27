import 'package:flutter/material.dart';
import 'package:kpop_application/features/data/models/idol_member.dart';

class IdolsPage extends StatelessWidget {
  final String memberId; // ID участника
  final List<Idol> idols; // Список идолов
  const IdolsPage({super.key, required this.memberId, required this.idols});

  @override
  Widget build(BuildContext context) {
    // Получаем данные о члене по его ID
    Idol member = getMemberData(memberId, idols);

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
            // Отображение групп, в которых участвует участник
            const Text(
              'Группы:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ...member.groups.map((group) => Text('- $group')).toList(),
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
}
