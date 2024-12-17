import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

import '../../features/main_layout/products_screen/presentation/cubit/product_screen_view_model.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';

class Badges extends StatelessWidget {
  Function() onPressed;

  Badges({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      badgeContent: Text(
        ProductScreenViewModel.get(context).numOfCartItems.toString(),
        style: TextStyle(color: Colors.white),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: ImageIcon(
          AssetImage(IconsAssets.icCart),
          color: ColorManager.primary,
        ),
      ),
    );
  }
}
