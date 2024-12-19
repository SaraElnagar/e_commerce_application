import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../favourite/presentation/screens/favourite_screen.dart';
import '../../home/presentation/home_tab.dart';
import '../../products_screen/presentation/screens/products_screen.dart';
import '../../profile_tab/presentation/profile_tab.dart';
import 'home_states.dart';

class HomeViewModel extends Cubit<HomeStates> {
  HomeViewModel() : super(HomeInitialState());

  // todo: hold data - handle logic
  int currentIndex = 0;
  List<Widget> tabs = [
    HomeTab(),
    ProductsScreen(),
    FavouriteScreen(),
    ProfileTab(),
  ];

  void changeSelectedIndex(int selectedIndex) {
    emit(HomeInitialState());
    currentIndex = selectedIndex;
    emit(ChangeSelectedIndexState());
  }
}
