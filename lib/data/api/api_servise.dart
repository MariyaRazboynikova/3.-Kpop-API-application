import 'package:kpop_application/data/models/groups_model.dart';
import 'package:http/http.dart' as http;

class ApiServise {
  Future<Groups> getGroups() async {
    const URL = 'https://unpkg.com/kpopnet.json@2.0.5/kpopnet.json';
    final response = await http.get(Uri.parse(URL));

    if (response.statusCode == 200) {
      return groupsFromJson(response.body);
    } else {
      throw Exception('Failed to load groups');
    }
  }
}
