import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ilmnur_mobile/core/resources/data_state.dart';
import 'package:ilmnur_mobile/core/resources/state_status.dart';
import 'package:ilmnur_mobile/features/group/data/models/group.dart';
import 'package:ilmnur_mobile/features/group/domain/repositories/group_repo.dart';
part 'group_event.dart';
part 'group_state.dart';

class GroupBloc extends Bloc<GroupEvent, GroupState> {
  final GroupRepo groupRepo;
  int activeTabIndex = 0;
  late List<Group> group;
  late int id;

  GroupBloc({
    required this.groupRepo,
    required this.id,
  }) : super(GroupInitial()) {
    on<GetGroups>((event, emit) async {
      emit(Loading());
      try {
        final response = await groupRepo.getGroups(id);
        print("==$response");
        if (response is DataSuccess) {
          // group = response.data;
          List<Group>? group = response.data;
          if (group != null) {
            emit(LoadedGroupData(
              group: group,
              status: StateStatus.loaded,
            ));
          } else {
            emit(ErrorLoadingGroupData("Failed to load group data"));
          }
        }
      } catch (e) {
        print("==$e");
        final errorMessage = 'Failed to load group data: $e';
        emit(ErrorLoadingGroupData(errorMessage));
      }
    });

    add(GetGroups());
  }
}
