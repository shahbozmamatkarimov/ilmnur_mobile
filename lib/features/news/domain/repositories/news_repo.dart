import 'package:ilmnur_mobile/features/reyting/data/models/reyting.dart';
import 'package:ilmnur_mobile/core/resources/data_state.dart';

abstract class ReytingRepo {
  Future<DataState<Reyting>> getReyting(int id);
}
