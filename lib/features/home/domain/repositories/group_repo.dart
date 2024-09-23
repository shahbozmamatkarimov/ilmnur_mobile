import 'package:ilmnur_mobile/core/resources/data_state.dart';
import 'package:ilmnur_mobile/features/home/data/models/group/group.dart';


abstract class GroupRepo {
  Future<DataState<List<Group>>> getGroup();
}
