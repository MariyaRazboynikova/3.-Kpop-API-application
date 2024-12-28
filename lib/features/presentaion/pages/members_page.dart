import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kpop_application/features/data/models/group_model.dart';
import 'package:kpop_application/features/data/models/idol_member.dart';
import 'package:kpop_application/features/presentaion/pages/idols_page.dart';

class MembersPage extends StatelessWidget {
  final Group group; // Группа, к которой принадлежат участники
  final List<Idol> idols; // Список идолов

  const MembersPage({Key? key, required this.group, required this.idols})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          group.name,
          style: GoogleFonts.kaiseiTokumin(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
      ), // Название группы в заголовке
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Отображение названия агентства
            Text(
              'Агентство: ${group.agencyName}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 8), // Отступ между текстами
            // Отображение даты дебюта
            Text(
              'Дата дебюта: ${group.debutDate != null ? group.debutDate!.toLocal().toString().split(' ')[0] : "Не указана"}',
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16), // Отступ перед списком участников
            Expanded(
              child: ListView.builder(
                itemCount: group.members.length,
                itemBuilder: (context, index) {
                  var member = group.members[index];
                  // Получаем имя айдола по его idolId
                  String idolName = getIdolName(member.idolId, idols);

                  return ListTile(
                    title: Text(idolName), // Отображаем имя айдола
                    subtitle: Text(
                      member.roles ?? "Роль не указана",
                    ), // Отображение роли участника
                    onTap: () {
                      // Переход к странице с деталями участника
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => IdolsPage(
                                memberId: member.idolId,
                                idols: idols,
                                group: group,
                              ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getIdolName(String idolId, List<Idol> idols) {
    // Находим и возвращаем имя айдола по его id
    Idol idol = idols.firstWhere(
      (idol) => idol.id == idolId,
      orElse: () => throw Exception('Idol with id $idolId not found'),
    );
    return idol.name; // Возвращаем имя найденного айдола
  }
}
