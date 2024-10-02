import 'package:ilmnur_mobile/core/resources/data_state.dart';
import 'package:ilmnur_mobile/features/home/data/models/group/GroupDto.dart';
import 'package:ilmnur_mobile/features/home/data/models/group/creategroup.dart';
import 'package:ilmnur_mobile/features/home/data/models/group/group.dart';

abstract class GroupRepo {
  Future<DataState<GroupDto>> getGroup();
  Future<DataState<GroupDto>> createGroup(CreateGroupModel group);
}
