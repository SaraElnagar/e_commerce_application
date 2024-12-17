import 'package:e_commerce_app/core/routes_manager/routes.dart';
import 'package:e_commerce_app/core/widget/dialog_utils.dart';
import 'package:e_commerce_app/features/cart/presentations/cubit/cart_screen_view_model.dart';
import 'package:e_commerce_app/features/cart/presentations/cubit/cart_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widget/badges.dart';
import '../widgets/cart_item_widget.dart';
import '../widgets/total_price_and_checkout_botton.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartScreenViewModel, CartStates>(
      bloc: CartScreenViewModel.get(context)..getCart(),
      listener: (context, state) {
        if (state is UpdateCountInCartErrorState) {
          return DialogUtils.showMessage(
              context: context, message: state.failures.errorMessage);
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: ColorManager.primary),
              title: Text(
                'Cart',
                style:
                    getMediumStyle(fontSize: 20, color: ColorManager.textColor),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: ImageIcon(
                    AssetImage(
                      IconsAssets.icSearch,
                    ),
                    color: ColorManager.primary,
                  ),
                ),
                Badges(
                  onPressed: () =>
                      Navigator.pushNamed(context, Routes.productsScreenRoute),
                ),
              ],
            ),
            body: state is GetCartSuccessState
                ? Padding(
                    padding: const EdgeInsets.all(AppPadding.p14),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                              itemBuilder: (context, index) => CartItemWidget(
                                  productCartEntity: state.getCartResponseEntity
                                      .data!.products![index]
                                  // CartScreenViewModel.get(context).productList[index]
                                  ),
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: AppSize.s12.h),
                              itemCount: state
                                  .getCartResponseEntity.data!.products!.length
                              // CartScreenViewModel.get(context).productList.length
                              ),
                        ),
                        // the total price and checkout button========
                        TotalPriceAndCheckoutBotton(
                          totalPrice: state
                              .getCartResponseEntity.data!.totalCartPrice!
                              .toInt(),
                          checkoutButtonOnTap: () {},
                        ),
                        SizedBox(height: 10.h),
                      ],
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(
                    color: ColorManager.primary,
                  )));
      },
    );
  }
}
