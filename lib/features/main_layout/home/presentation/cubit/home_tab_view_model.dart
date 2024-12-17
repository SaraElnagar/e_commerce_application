import 'package:e_commerce_app/domain/use_cases/get_all_brands_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/get_all_categories_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../domain/entities/CategoryOrBrandResponseEntity.dart';
import 'home_tab_states.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabStates> {
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetAllBrandsUseCase getAllBrandsUseCase;

  HomeTabViewModel(
      {required this.getAllCategoriesUseCase,
      required this.getAllBrandsUseCase})
      : super(HomeTabInitialState());

  /// todo: hold data - handle logic
  List<CategoryOrBrandEntity> categoriesList = [];
  List<CategoryOrBrandEntity> brandsList = [];
  List<String> sliderImages = [
    ImageAssets.carouselSlider1,
    ImageAssets.carouselSlider2,
    ImageAssets.carouselSlider3,
  ];

  static HomeTabViewModel get(context) => BlocProvider.of(context);

  void getAllCategories() async {
    emit(HomeCategoriesLoadingState());
    var either = await getAllCategoriesUseCase.invoke();
    either.fold((error) {
      emit(HomeCategoriesErrorState(failures: error));
    }, (response) {
      categoriesList = response.data!;
      if (brandsList.isNotEmpty) {
        emit(HomeCategoriesSuccessState(categoryResponseEntity: response));
      }
    });
  }

  void getAllBrands() async {
    emit(HomeBrandsLoadingState());
    var either = await getAllBrandsUseCase.invoke();
    either.fold((error) {
      emit(HomeBrandsErrorState(failures: error));
    }, (response) {
      brandsList = response.data!;
      if (categoriesList.isNotEmpty) {
        emit(HomeBrandsSuccessState(brandResponseEntity: response));
      }
    });
  }
}
