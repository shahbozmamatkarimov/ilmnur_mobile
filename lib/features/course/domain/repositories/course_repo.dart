import 'package:ilmnur_mobile/features/course/data/models/course.dart';
import 'package:ilmnur_mobile/core/resources/data_state.dart';

abstract class CourseRepo {
  Future<DataState<List<Course>>> getCourses(int id);
}
