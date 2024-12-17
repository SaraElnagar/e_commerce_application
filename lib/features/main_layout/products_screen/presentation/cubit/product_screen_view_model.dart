import 'package:e_commerce_app/domain/use_cases/add_to_cart_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/get_all_products_use_case.dart';
import 'package:e_commerce_app/features/main_layout/products_screen/presentation/cubit/product_screen_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/entities/ProductResponseEntity.dart';

@injectable
class ProductScreenViewModel extends Cubit<ProductScreenStates> {
  GetAllProductUseCase getAllProductUseCase;
  AddToCartUseCase addToCartUseCase;

  ProductScreenViewModel(
      {required this.getAllProductUseCase, required this.addToCartUseCase})
      : super(ProductInitialState());

  /// Constructor Injection

  ///todo: hold data - handle logic
  List<ProductEntity> productsList = [];
  int numOfCartItems = 0;

  static ProductScreenViewModel get(context) => BlocProvider.of(context);

  /// Create Object from ViewModel is Shared With All Screens.

  void getAllProducts() async {
    emit(ProductLoadingState());
    var either = await getAllProductUseCase.invoke();
    either.fold((error) {
      // print(error.errorMessage);
      emit(ProductErrorState(failures: error));
    }, (response) {
      productsList = response.data!;
      emit(ProductSuccessState(productResponseEntity: response));
    });
  }

  void addToCart(String productId) async {
    emit(AddToCartLoadingState());
    var either = await addToCartUseCase.invoke(productId);
    either.fold((error) => {emit(AddToCartErrorState(failures: error))},
        (response) {
      numOfCartItems = response.numOfCartItems!.toInt();
      // print("numOfCartItems: $numOfCartItems");
      emit(AddToCartSuccessState(addToCartResponseEntity: response));
    });
  }
}
