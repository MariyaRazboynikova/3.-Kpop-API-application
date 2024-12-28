import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kpop_application/features/data/models/group_model.dart';
import 'package:kpop_application/features/data/models/idol_member.dart';
import 'package:kpop_application/features/presentaion/pages/idols_page.dart';

class MembersPage extends StatelessWidget {
  final Group group;
  final List<Idol> idols;

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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Агентство: ${group.agencyName}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 8),

            Text(
              'Дата дебюта: ${group.debutDate != null ? group.debutDate!.toLocal().toString().split(' ')[0] : "Не указана"}',
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: group.members.length,
                itemBuilder: (context, index) {
                  var member = group.members[index];

                  String idolName = getIdolName(member.idolId, idols);

                  return ListTile(
                    title: Text(idolName),
                    subtitle: Text(member.roles ?? "Роль не указана"),
                    onTap: () {
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
    Idol idol = idols.firstWhere(
      (idol) => idol.id == idolId,
      orElse: () => throw Exception('Idol with id $idolId not found'),
    );
    return idol.name;
  }
}
