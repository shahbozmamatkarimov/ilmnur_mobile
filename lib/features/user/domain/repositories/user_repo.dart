import 'package:ilmnur_mobile/features/user/data/models/user.dart';
import 'package:ilmnur_mobile/core/resources/data_state.dart';

abstract class UserRepo {
  Future<DataState<User>> getUser(int id);
}
