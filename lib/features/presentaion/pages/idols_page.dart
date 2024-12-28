import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kpop_application/features/data/models/group_model.dart';
import 'package:kpop_application/features/data/models/idol_member.dart';

class IdolsPage extends StatelessWidget {
  final String memberId;
  final List<Idol> idols;
  final Group group;

  const IdolsPage({
    Key? key,
    required this.memberId,
    required this.idols,
    required this.group,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Idol member = getMemberData(memberId, idols);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          member.name,
          style: GoogleFonts.kaiseiTokumin(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (member.thumbUrl.isNotEmpty)
              Image.network(member.thumbUrl, height: 150, fit: BoxFit.cover),
            const SizedBox(height: 10),
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

            const SizedBox(height: 20),
            Text(
              'Группа: ${group.name}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

Idol getMemberData(String memberId, List<Idol> idols) {
  return idols.firstWhere(
    (idol) => idol.id == memberId,
    orElse: () => throw Exception('Idol with id $memberId not found'),
  );
}
