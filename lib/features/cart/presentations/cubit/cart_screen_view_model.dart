import 'package:e_commerce_app/domain/entities/GetCartResponseEntity.dart';
import 'package:e_commerce_app/domain/use_cases/get_cart_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/update_count_in_cart_use_case.dart';
import 'package:e_commerce_app/features/cart/presentations/cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/use_cases/delete_item_in_cart_use_case.dart';

@injectable
class CartScreenViewModel extends Cubit<CartStates> {
  GetCartUseCase getCartUseCase;
  DeleteItemInCartUseCase deleteItemInCartUseCase;
  UpdateCountInCartUseCase updateCountInCartUseCase;

  CartScreenViewModel(
      {required this.getCartUseCase,
      required this.deleteItemInCartUseCase,
      required this.updateCountInCartUseCase})
      : super(GetCartInitialState());

  ///todo: hold data - handle logic
  List<GetProductCartEntity> productList = [];

  static CartScreenViewModel get(context) => BlocProvider.of(context);

  void getCart() async {
    emit(GetCartLoadingState());
    var either = await getCartUseCase.invoke();
    either.fold((error) => emit(GetCartErrorState(failures: error)),
        (response) {
      productList = response.data!.products!;
      emit(GetCartSuccessState(getCartResponseEntity: response));
    });
  }

  void deleteItemInCart(String productId) async {
    emit(DeleteItemInCartLoadingState());
    var either = await deleteItemInCartUseCase.invoke(productId);
    either.fold((error) => emit(DeleteItemInCartErrorState(failures: error)),
        (response) {
      // productList = response.data!.products!;
      /// مش محتاجين الليست لاننا هناديها عن طريق ال state و ليس ال view model لزلك مش محتاجينها لكن احنا محتاجينها عشان نجدد ال list كل شوية لما بنمسح منها فبتقل
      // print("delete item in cart: $productId");
      emit(GetCartSuccessState(getCartResponseEntity: response));
    });
  }

  void updateCountInCart(String productId, int count) async {
    emit(UpdateCountInCartLoadingState());
    var either = await updateCountInCartUseCase.invoke(productId, count);
    either.fold((error) {
      // print(error.errorMessage);
      emit(UpdateCountInCartErrorState(failures: error));
    }, (response) {
      // productList = response.data!.products!;
      /// مش محتاجين الليست لاننا هناديها عن طريق ال state و ليس ال view model لزلك مش محتاجينها
      emit(GetCartSuccessState(getCartResponseEntity: response));
    });
  }
}
