import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/resources/color_manager.dart';
import '../../../../../../../core/resources/values_manager.dart';
import '../../../../../core/resources/styles_manager.dart';
import 'favourite_item_details.dart';

class FavoriteItem extends StatelessWidget {
  final Map<String, dynamic> product;

  FavoriteItem({super.key, required this.product});

  bool isWishListed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s160.h,
      padding: EdgeInsets.only(right: AppSize.s8.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s16.r),
          border: Border.all(color: ColorManager.primary.withOpacity(.3))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s16.r),
                border:
                    Border.all(color: ColorManager.primary.withOpacity(.6))),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.s16.r),
              child: CachedNetworkImage(
                width: AppSize.s120.w,
                height: AppSize.s135.h,
                fit: BoxFit.cover,
                imageUrl: product["imageUrl"],
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.primary,
                  ),
                ),
                errorWidget: (context, url, error) => Icon(
                  Icons.error,
                  color: ColorManager.primary,
                ),
              ),
            ),
          ),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: AppSize.s8.w),
                  child: FavouriteItemDetails(
                    product: product,
                  ))),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CircleAvatar(
                backgroundColor: ColorManager.white,
                radius: 15,
                child: IconButton(
                    color: ColorManager.primaryDark,
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      isWishListed = !isWishListed;
                    },
                    icon: isWishListed == true
                        ? const Icon(Icons.favorite_rounded)
                        : const Icon(
                            Icons.favorite_border_rounded,
                          )),
              ),
              SizedBox(height: AppSize.s14.h),
              SizedBox(
                width: 100.w,
                height: 36.h,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSize.s14.r)),
                        padding: EdgeInsets.symmetric(horizontal: AppSize.s1.w),
                        backgroundColor: ColorManager.primary),
                    onPressed: () {},
                    child: Text("Add to Cart",
                        style: getRegularStyle(
                          color: ColorManager.white,
                          fontSize: AppSize.s14.sp,
                        ))),
              )
            ],
          )
        ],
      ),
    );
  }
}
