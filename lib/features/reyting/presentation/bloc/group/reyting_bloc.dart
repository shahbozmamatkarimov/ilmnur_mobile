import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ilmnur_mobile/core/resources/data_state.dart';
import 'package:ilmnur_mobile/core/resources/state_status.dart';
import 'package:ilmnur_mobile/features/reyting/data/models/reyting.dart';
import 'package:ilmnur_mobile/features/reyting/domain/repositories/reyting_repo.dart';
part 'reyting_event.dart';
part 'reyting_state.dart';

class ReytingBloc extends Bloc<ReytingEvent, ReytingState> {
  final ReytingRepo lessonRepo;
  int activeTabIndex = 0;
  late Reyting lesson;
  late int id;

  ReytingBloc({
    required this.lessonRepo,
    required this.id,
  }) : super(ReytingInitial()) {
    on<GetReytings>((event, emit) async {
      emit(Loading());
      try {
        final response = await lessonRepo.getReyting(id);
        if (response is DataSuccess) {
          // lesson = response.data;
          Reyting? lesson = response.data;
          if (lesson != null) {
            emit(LoadedReytingData(
              lesson: lesson,
              status: StateStatus.loaded,
            ));
          } else {
            emit(ErrorLoadingReytingData("Failed to load lesson data"));
          }
        }
      } catch (e) {
        print("==$e");
        final errorMessage = 'Failed to load lesson data: $e';
        emit(ErrorLoadingReytingData(errorMessage));
      }
    });

    add(GetReytings());
  }
}
