import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ilmnur_mobile/core/resources/data_state.dart';
import 'package:ilmnur_mobile/core/resources/state_status.dart';
import 'package:ilmnur_mobile/features/course/data/models/course.dart';
import 'package:ilmnur_mobile/features/course/domain/repositories/course_repo.dart';
part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final CourseRepo courseRepo;
  int activeTabIndex = 0;
  late List<Course> course;
  late int id;

  CourseBloc({
    required this.courseRepo,
    required this.id,
  }) : super(CourseInitial()) {
    on<GetCourses>((event, emit) async {
      emit(Loading());
      try {
        final response = await courseRepo.getCourses(id);
        print("==$response");
        if (response is DataSuccess) {
          // course = response.data;
          List<Course>? course = response.data;
          print(course);
          if (course != null) {
            emit(LoadedCourseData(
              course: course,
              status: StateStatus.loaded,
            ));
          } else {
            emit(ErrorLoadingCourseData("Failed to load course data"));
          }
        }
      } catch (e) {
        print("==$e");
        final errorMessage = 'Failed to load course data: $e';
        emit(ErrorLoadingCourseData(errorMessage));
      }
    });

    add(GetCourses());
  }
}
