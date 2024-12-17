import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerce_app/features/cart/presentations/cubit/cart_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../domain/entities/GetCartResponseEntity.dart';

class CartItemWidget extends StatelessWidget {
  GetProductCartEntity productCartEntity;
  ProductEntity? productEntity;

  CartItemWidget({required this.productCartEntity, this.productEntity});

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: isPortrait ? height * 0.19 : width * 0.23,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: ColorManager.primary.withOpacity(0.3)),
      ),
      child: Row(children: [
        // display image in the container
        Container(
          margin: EdgeInsets.only(left: 10),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(color: ColorManager.primary.withOpacity(0.3)),
          ),
          child: CachedNetworkImage(
            imageUrl: productCartEntity.product?.imageCover ?? "",
            fit: BoxFit.cover,
            height: isPortrait ? height * 0.142 : height * 0.23,
            width: isPortrait ? width * 0.29 : 165.w,
            placeholder: (context, url) => Center(
                child: CircularProgressIndicator(
              color: ColorManager.primaryDark,
            )),
            errorWidget: (context, url, error) =>
                Center(child: Icon(Icons.error)),
          ),
        ),
        // SizedBox(width: 8.w),
        // display details product=========================
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppPadding.p8.w,
              vertical: AppPadding.p8.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // title and delete button ==
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        productCartEntity.product?.title ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: getBoldStyle(
                          color: ColorManager.textColor,
                          fontSize: AppSize.s18.sp,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        /// todo: delete item in cart
                        CartScreenViewModel.get(context).deleteItemInCart(
                            productCartEntity.product?.id ?? "");
                      },
                      child: Image.asset(
                        IconsAssets.icDelete,
                        color: ColorManager.textColor,
                        height: 22.h,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                // display price and quantity =================
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'EGP ${productCartEntity.price ?? ""}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: getBoldStyle(
                            color: ColorManager.textColor,
                            fontSize: AppSize.s18.sp),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: ColorManager.primary,
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 7.h),
                      child: Row(
                        children: [
                          InkWell(
                              onTap: () {
                                /// todo: decrement count
                                int count = productCartEntity.count!.toInt();
                                count--;
                                CartScreenViewModel.get(context)
                                    .updateCountInCart(
                                        productCartEntity.product?.id ?? "",
                                        count);
                              },
                              child: Icon(
                                Icons.remove_circle_outline,
                                size: 20.w,
                                color: ColorManager.white,
                              )),
                          SizedBox(
                            width: 18.w,
                          ),
                          Text(
                            '${productCartEntity.count}',
                            style: getMediumStyle(color: ColorManager.white)
                                .copyWith(fontSize: 18.sp),
                          ),
                          SizedBox(
                            width: 18.w,
                          ),
                          InkWell(
                              onTap: () {
                                /// todo: increment count
                                int count = productCartEntity.count!.toInt();
                                count++;
                                CartScreenViewModel.get(context)
                                    .updateCountInCart(
                                        productCartEntity.product?.id ?? "",
                                        count);
                              },
                              child: Icon(
                                Icons.add_circle_outline,
                                color: ColorManager.white,
                                size: 20.w,
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
