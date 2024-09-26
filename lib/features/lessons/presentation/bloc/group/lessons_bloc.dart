import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ilmnur_mobile/core/resources/data_state.dart';
import 'package:ilmnur_mobile/core/resources/state_status.dart';
import 'package:ilmnur_mobile/features/course/data/models/course.dart';
import 'package:ilmnur_mobile/features/lessons/data/models/lessons.dart';
import 'package:ilmnur_mobile/features/lessons/domain/repositories/lessons_repo.dart';
part 'lessons_event.dart';
part 'lessons_state.dart';

class LessonsBloc extends Bloc<LessonsEvent, LessonsState> {
  final LessonsRepo lessonsRepo;
  int activeTabIndex = 0;
  late List<Lessons> lessons;
  late int id;

  LessonsBloc({
    required this.lessonsRepo,
    required this.id,
  }) : super(LessonsInitial()) {
    on<GetLessonss>((event, emit) async {
      emit(Loading());
      try {
        final response = await lessonsRepo.getLessonss(id);
        print("==$response");
        if (response is DataSuccess) {
          // lessons = response.data;
          List<Lessons>? lessons = response.data!.lessons;
          Course course = response.data!.course;
          if (lessons != null) {
            emit(LoadedLessonsData(
              lessons: lessons,
              course: course,
              status: StateStatus.loaded,
            ));
          } else {
            emit(ErrorLoadingLessonsData("Failed to load lessons data"));
          }
        }
      } catch (e) {
        print("==$e");
        final errorMessage = 'Failed to load lessons data: $e';
        emit(ErrorLoadingLessonsData(errorMessage));
      }
    });

    add(GetLessonss());
  }
}
