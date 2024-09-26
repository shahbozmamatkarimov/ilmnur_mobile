part of 'lessons_bloc.dart';

abstract class LessonsState extends Equatable {
  const LessonsState();
}

class LessonsInitial extends LessonsState {
  @override
  List<Object> get props => [];
}

class Loading extends LessonsState {
  @override
  List<Object> get props => [];
}

class LoggedOut extends LessonsState {
  @override
  List<Object> get props => [];
}

class LoadedLessonsData extends LessonsState {
  final List<Lessons> lessons;
  final Course course;
  final StateStatus status;
  final String? error;
  final int tabIndex;
  const LoadedLessonsData({
    required this.lessons,
    required this.course,
    this.error,
    this.status = StateStatus.normal,
    this.tabIndex = 0,
  });

  @override
  List<Object> get props => [lessons, status, tabIndex];
}

class SuccessUpdate extends LessonsState {
  @override
  List<Object> get props => [];
}

class Error extends LessonsState {
  final String? error;

  const Error({this.error});
  @override
  List<Object> get props => [];
}

class ErrorLoadingLessonsData extends LessonsState {
  final String errorMessage;

  ErrorLoadingLessonsData(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
