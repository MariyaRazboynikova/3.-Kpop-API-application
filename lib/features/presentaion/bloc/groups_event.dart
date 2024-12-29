part of 'groups_bloc.dart';

abstract class GroupsEvent {}

class FetchGroup extends GroupsEvent {}

class SearchGroupEvent extends GroupsEvent {
  final String query;

  SearchGroupEvent({required this.query});
}
