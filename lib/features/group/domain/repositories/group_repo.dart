import 'dart:ffi';

import 'package:ilmnur_mobile/features/group/data/models/group.dart';
import 'package:ilmnur_mobile/core/resources/data_state.dart';

abstract class GroupRepo {
  Future<DataState<List<Group>>> getGroups(int id);
}
