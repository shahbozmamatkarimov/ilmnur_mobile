import 'package:ilmnur_mobile/core/resources/data_state.dart';
import 'package:ilmnur_mobile/features/home/data/models/category/category.dart';


abstract class CategoryRepo {
  Future<DataState<List<Category>>> getCategory();
}
