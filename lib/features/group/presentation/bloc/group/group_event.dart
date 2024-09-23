part of 'group_bloc.dart';

abstract class GroupEvent extends Equatable {
  const GroupEvent();
}

class GetGroups extends GroupEvent {
  @override
  List<Object?> get props => [];
}