import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/widget/badges.dart';
import 'package:e_commerce_app/features/main_layout/products_screen/presentation/cubit/product_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/styles_manager.dart';
import '../../../../../core/widget/custom_elevated_button.dart';
import '../../../../core/routes_manager/routes.dart';
import '../../../../domain/entities/ProductResponseEntity.dart';
import '../widgets/product_description.dart';
import '../widgets/product_label.dart';
import '../widgets/product_rating.dart';

class ProductDetails extends StatelessWidget {
  ProductEntity? productEntity;

  ProductDetails({required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorManager.primary),
        centerTitle: true,
        title: Text(
          'Product Details',
          style: getMediumStyle(color: ColorManager.appBarTitleColor)
              .copyWith(fontSize: 20.sp),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: ImageIcon(
                AssetImage(IconsAssets.icSearch),
                color: ColorManager.primary,
              )),
          Badges(
            onPressed: () => Navigator.pushNamed(context, Routes.cartRoute),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 50.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSlideshow(
                initialPage: 0,
                indicatorColor: ColorManager.primaryDark,
                indicatorBackgroundColor: ColorManager.white,
                indicatorBottomPadding: 20.h,
                autoPlayInterval: 3000,
                isLoop: true,
                // children: productEntity?.images?.map((url) => CachedNetworkImage(imageUrl: url)).toList() ?? [],
                children: productEntity!.images!
                    .map((url) => Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              border: Border.all(
                                  color: ColorManager.primary.withOpacity(0.3),
                                  width: 1.w)),
                          child: CachedNetworkImage(
                            imageUrl: url,
                            fit: BoxFit.cover,
                            height: 300.h,
                            width: double.infinity,
                            placeholder: (context, url) => Center(
                                child: CircularProgressIndicator(
                              color: ColorManager.primaryDark,
                            )),
                            errorWidget: (context, url, error) =>
                                Center(child: Icon(Icons.error)),
                          ),
                        ))
                    .toList(),
              ),
              SizedBox(
                height: 24.h,
              ),
              ProductLabel(
                  productName: productEntity?.title ?? "",
                  productPrice: 'EGP ${productEntity?.price ?? ""}'),
              SizedBox(
                height: 16.h,
              ),
              ProductRating(
                  productBuyers: '${productEntity?.sold ?? ""}',
                  productRating: '${productEntity?.ratingsAverage ?? ""}'),
              SizedBox(
                height: 16.h,
              ),
              ProductDescription(
                  productDescription: productEntity?.description ?? ""),
              SizedBox(
                height: 48.h,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "Total Price",
                        style: getMediumStyle(
                                color: ColorManager.primary.withOpacity(.6))
                            .copyWith(fontSize: 18.sp),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Text(
                        'EGP ${productEntity?.price ?? ""}',
                        style:
                            getMediumStyle(color: ColorManager.appBarTitleColor)
                                .copyWith(fontSize: 18.sp),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 33.w,
                  ),
                  Expanded(
                    child: CustomElevatedButton(
                      label: 'Add to cart',
                      onTap: () {
                        ProductScreenViewModel.get(context)
                            .addToCart(productEntity?.id ?? "");
                      },
                      prefixIcon: Icon(
                        Icons.add_shopping_cart_outlined,
                        color: ColorManager.white,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
