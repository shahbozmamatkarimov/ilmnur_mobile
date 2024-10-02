import 'package:ilmnur_mobile/features/tests/data/models/test.dart';
import 'package:ilmnur_mobile/core/resources/data_state.dart';

abstract class TestsRepo {
  Future<DataState<List<Tests>>> getTests(int id);
}
