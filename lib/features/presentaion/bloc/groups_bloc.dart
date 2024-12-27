import 'package:bloc/bloc.dart';
import 'package:kpop_application/features/data/models/groups_model.dart';
import 'package:kpop_application/features/domain/repository/groups_repository.dart';

part 'groups_event.dart';
part 'groups_state.dart';

class GroupsBloc extends Bloc<GroupsEvent, GroupsState> {
  final GroupsRepository groupsRepository;

  GroupsBloc(this.groupsRepository) : super(GroupsInitial()) {
    on<FetchGroup>((event, emit) async {
      emit(GroupsLoading());
      try {
        Groups groups = await groupsRepository.getAllGroups();
        emit(GroupsLoaded(groups));
      } catch (e) {
        emit(GroupsError(e.toString()));
      }
    });
  }
}
