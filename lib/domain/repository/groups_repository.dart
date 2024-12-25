import 'package:kpop_application/data/models/groups_model.dart';

abstract class GroupsRepository {
  Future<Groups> getAllGroups();
}
