import 'package:e_commerce_app/domain/failures.dart';

import '../../../../../domain/entities/CategoryOrBrandResponseEntity.dart';

abstract class HomeTabStates {}

class HomeTabInitialState extends HomeTabStates {}

class HomeCategoriesLoadingState extends HomeTabStates {}

class HomeCategoriesErrorState extends HomeTabStates {
  Failures failures;

  HomeCategoriesErrorState({required this.failures});
}

class HomeCategoriesSuccessState extends HomeTabStates {
  CategoryOrBrandResponseEntity categoryResponseEntity;

  HomeCategoriesSuccessState({required this.categoryResponseEntity});
}

class HomeBrandsLoadingState extends HomeTabStates {}

class HomeBrandsErrorState extends HomeTabStates {
  Failures failures;

  HomeBrandsErrorState({required this.failures});
}

class HomeBrandsSuccessState extends HomeTabStates {
  CategoryOrBrandResponseEntity brandResponseEntity;

  HomeBrandsSuccessState({required this.brandResponseEntity});
}
