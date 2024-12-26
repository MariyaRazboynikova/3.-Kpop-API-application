import 'package:kpop_application/features/data/models/groups_model.dart';

abstract class GroupsRepository {
  Future<Groups> getAllGroups();
}
