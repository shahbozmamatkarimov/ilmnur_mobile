import 'package:ilmnur_mobile/features/lessons/data/models/courseDto.dart';
import 'package:ilmnur_mobile/features/lessons/data/models/lessons.dart';
import 'package:ilmnur_mobile/core/resources/data_state.dart';

abstract class LessonsRepo {
  Future<DataState<CourseDto>> getLessonss(int id);
}
