import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ilmnur_mobile/core/resources/data_state.dart';
import 'package:ilmnur_mobile/core/resources/state_status.dart';
import 'package:ilmnur_mobile/features/home/data/models/category/category.dart';
import 'package:ilmnur_mobile/features/home/domain/repositories/category_repo.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepo categoryRepo;
  int activeTabIndex = 0;
  late List<Category> category;

  CategoryBloc({
    required this.categoryRepo,
  }) : super(CategoryInitial()) {
    on<GetCategory>((event, emit) async {
      emit(Loading());
      try {
        final response = await categoryRepo.getCategory();
        print("==$response");
        if (response is DataSuccess) {
          // category = response.data;
          List<Category>? category = response.data;
          if (category != null) {
            emit(LoadedCategoryData(
              category: category,
              status: StateStatus.loaded,
            ));
          } else {
            emit(ErrorLoadingCategoryData("Failed to load category data"));
          }
        }
      } catch (e) {
        print("==$e");
        final errorMessage = 'Failed to load category data: $e';
        emit(ErrorLoadingCategoryData(errorMessage));
      }
    });

    add(GetCategory());
  }
}
