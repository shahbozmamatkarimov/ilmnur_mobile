part of 'lessons_bloc.dart';

abstract class LessonsEvent extends Equatable {
  const LessonsEvent();
}

class GetLessonss extends LessonsEvent {
  @override
  List<Object?> get props => [];
}
