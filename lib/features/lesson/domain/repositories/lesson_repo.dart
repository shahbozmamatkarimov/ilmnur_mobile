import 'package:ilmnur_mobile/features/lesson/data/models/lesson.dart';
import 'package:ilmnur_mobile/core/resources/data_state.dart';

abstract class LessonRepo {
  Future<DataState<Lesson>> getLesson(int id);
}
