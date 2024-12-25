import 'package:kpop_application/data/api/api_service.dart';
import 'package:kpop_application/data/models/groups_model.dart';
import 'package:kpop_application/domain/repository/groups_repository.dart';

class GroupRepositoryImpl implements GroupsRepository {
  final ApiService apiService;

  GroupRepositoryImpl(this.apiService);

  @override
  Future<Groups> getAllGroups() async {
    return await apiService.getGroups();
  }
}
