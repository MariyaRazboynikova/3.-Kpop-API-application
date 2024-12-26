import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:kpop_application/features/data/models/groups_model.dart';

part 'groups_event.dart';
part 'groups_state.dart';

class GroupsBloc extends Bloc<GroupsEvent, GroupsState> {
  GroupsBloc() : super(GroupsInitial());

  @override
  Stream<GroupsState> mapEventToState(GroupsEvent event) async* {
    // TODO: implement mapEventToState
  }
}
