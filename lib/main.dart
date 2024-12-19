import 'package:e_commerce_app/core/routes_manager/route_generator.dart';
import 'package:e_commerce_app/core/widget/shared_preference_utils.dart';
import 'package:e_commerce_app/features/cart/presentations/cubit/cart_screen_view_model.dart';
import 'package:e_commerce_app/features/main_layout/home/presentation/cubit/home_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/my_bloc_observer.dart';
import 'core/routes_manager/routes.dart';
import 'di/di.dart';
import 'features/main_layout/products_screen/presentation/cubit/product_screen_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// بنعملها عشان عملنا الفانكشن async عشان نتاكد ان كل Widgets اشتغلت تمام
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  await SharedPreferenceUtils.init();
  var user = SharedPreferenceUtils.getData(key: "token");
  String route;
  if (user == null) {
    route = Routes.signInRoute;
  } else {
    route = Routes.mainRoute;
  }
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<HomeTabViewModel>()),
        BlocProvider(create: (context) => getIt<ProductScreenViewModel>()),
        BlocProvider(create: (context) => getIt<CartScreenViewModel>())
      ],
      child: MainApp(
        route: route,
      )));
}

class MainApp extends StatelessWidget {
  String route;

  MainApp({required this.route});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: route,
      ),
    );
  }
}
