import 'package:e_commerce_app/core/resources/color_manager.dart';
import 'package:e_commerce_app/core/widget/dialog_utils.dart';
import 'package:e_commerce_app/features/main_layout/home/presentation/cubit/home_tab_states.dart';
import 'package:e_commerce_app/features/main_layout/home/presentation/cubit/home_tab_view_model.dart';
import 'package:e_commerce_app/features/main_layout/home/presentation/widgets/announcement_widget.dart';
import 'package:e_commerce_app/features/main_layout/home/presentation/widgets/custom_category_or_brand_widget.dart';
import 'package:e_commerce_app/features/main_layout/home/presentation/widgets/custom_section_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/routes_manager/routes.dart';
import '../../../../core/widget/badges.dart';

class HomeTab extends StatelessWidget {
  // HomeTabViewModel viewModel = getIt<HomeTabViewModel>();
  bool? automaticallyImplyLeading;

  HomeTab({this.automaticallyImplyLeading});

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: automaticallyImplyLeading ?? false,
        title: SvgPicture.asset(
          SvgAssets.routeLogo,
          height: 25.h,
          width: 25.w,
          colorFilter:
              const ColorFilter.mode(ColorManager.textColor, BlendMode.srcIn),
        ),
        bottom: PreferredSize(
            preferredSize: const Size(AppSize.s100, AppSize.s40),
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      cursorColor: ColorManager.primary,
                      style: getRegularStyle(
                          color: ColorManager.primary, fontSize: FontSize.s16),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: AppMargin.m12.w,
                            vertical: AppMargin.m8.h),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10000),
                            borderSide: BorderSide(
                                width: AppSize.s1,
                                color: ColorManager.primary)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10000),
                            borderSide: BorderSide(
                                width: AppSize.s1,
                                color: ColorManager.primary)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10000),
                            borderSide: BorderSide(
                                width: AppSize.s1,
                                color: ColorManager.primary)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10000),
                            borderSide: BorderSide(
                                width: AppSize.s1,
                                color: ColorManager.primary)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10000),
                            borderSide: BorderSide(
                                width: AppSize.s1, color: ColorManager.error)),
                        prefixIcon: ImageIcon(
                          AssetImage(IconsAssets.icSearch),
                          color: ColorManager.primary,
                        ),
                        hintText: "what do you search for?",
                        hintStyle: getRegularStyle(
                            color: ColorManager.primary,
                            fontSize: FontSize.s16),
                      ),
                    ),
                  ),
                  Badges(
                    onPressed: () =>
                        Navigator.pushNamed(context, Routes.cartRoute),
                  ),
                ],
              ),
            )),
      ),
      body: BlocConsumer(
          bloc: HomeTabViewModel.get(context)
            ..getAllCategories()
            ..getAllBrands(),
          listener: (context, state) {
            if (state is HomeCategoriesErrorState) {
              DialogUtils.showMessage(
                  context: context, message: state.failures.errorMessage);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  AnnouncementWidget(),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomSectionBar(sectionName: 'Categories', function: () {}),
                  // viewModel.categoriesList.isEmpty? OR
                  state is HomeCategoriesLoadingState?
                      ? Center(
                          child: CircularProgressIndicator(
                            color: ColorManager.primaryDark,
                          ),
                        )
                      : SizedBox(
                          height: 270.h,
                          child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CustomCategoryOrBrandWidget(
                                  category: HomeTabViewModel.get(context)
                                      .categoriesList[index]);
                            },
                            itemCount: HomeTabViewModel.get(context)
                                .categoriesList
                                .length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                          ),
                        ),

                  SizedBox(height: 12.h),
                  CustomSectionBar(sectionName: 'Brands', function: () {}),

                  // viewModel.brandsList.isEmpty? OR
                  state is HomeBrandsLoadingState
                      ? Center(
                          child: CircularProgressIndicator(
                          color: ColorManager.primaryDark,
                        ))
                      : SizedBox(
                          height: 270.h,
                          child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CustomCategoryOrBrandWidget(
                                  category: HomeTabViewModel.get(context)
                                      .brandsList[index]);
                            },
                            itemCount:
                                HomeTabViewModel.get(context).brandsList.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                          ),
                        ),
                ],
              ),
            );
          }),
    );
  }

  Size get preferredSize => Size(0, 130.h);
}
