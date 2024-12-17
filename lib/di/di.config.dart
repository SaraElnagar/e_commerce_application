// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/api_manager.dart' as _i704;
import '../data/data_sources/remote_data_source/abstract_classes/auth_remote_data_source.dart'
    as _i358;
import '../data/data_sources/remote_data_source/abstract_classes/cart_remote_data_source.dart'
    as _i990;
import '../data/data_sources/remote_data_source/abstract_classes/home_remote_data_source.dart'
    as _i951;
import '../data/data_sources/remote_data_source/implentation_classes/auth_remote_data_source_impl.dart'
    as _i1033;
import '../data/data_sources/remote_data_source/implentation_classes/cart_remote_data_source_impl.dart'
    as _i500;
import '../data/data_sources/remote_data_source/implentation_classes/home_remote_data_source_impl.dart'
    as _i124;
import '../data/repository/auth_repository_impl.dart' as _i461;
import '../data/repository/cart_repository_impl.dart' as _i47;
import '../data/repository/home_repository_impl.dart' as _i723;
import '../domain/repository/auth_repository.dart' as _i306;
import '../domain/repository/cart_repository.dart' as _i130;
import '../domain/repository/home_repository.dart' as _i250;
import '../domain/use_cases/add_to_cart_use_case.dart' as _i994;
import '../domain/use_cases/delete_item_in_cart_use_case.dart' as _i1013;
import '../domain/use_cases/get_all_brands_use_case.dart' as _i823;
import '../domain/use_cases/get_all_categories_use_case.dart' as _i557;
import '../domain/use_cases/get_all_products_use_case.dart' as _i960;
import '../domain/use_cases/get_cart_use_case.dart' as _i487;
import '../domain/use_cases/login_use_case.dart' as _i826;
import '../domain/use_cases/register_use_case.dart' as _i772;
import '../domain/use_cases/update_count_in_cart_use_case.dart' as _i668;
import '../features/auth/presentations/screens/sign_in/cubit/sign_in_view_model.dart'
    as _i423;
import '../features/auth/presentations/screens/sign_up/cubit/sign_up_view_model.dart'
    as _i570;
import '../features/cart/presentations/cubit/cart_screen_view_model.dart'
    as _i304;
import '../features/main_layout/home/presentation/cubit/home_tab_view_model.dart'
    as _i247;
import '../features/main_layout/products_screen/presentation/cubit/product_screen_view_model.dart'
    as _i667;
import '../features/main_layout/products_screen/presentation/screens/products_screen.dart'
    as _i688;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i704.ApiManager>(() => _i704.ApiManager());
    gh.factory<_i951.HomeRemoteDataSource>(() =>
        _i124.HomeRemoteDataSourceImpl(apiManager: gh<_i704.ApiManager>()));
    gh.factory<_i990.CartRemoteDataSource>(() =>
        _i500.CartRemoteDataSourceImpl(apiManager: gh<_i704.ApiManager>()));
    gh.factory<_i688.ProductsScreen>(
        () => _i688.ProductsScreen(automaticallyImplyLeading: gh<bool>()));
    gh.factory<_i358.AuthRemoteDataSource>(() =>
        _i1033.AuthRemoteDataSourceImpl(apiManager: gh<_i704.ApiManager>()));
    gh.factory<_i306.AuthRepository>(() => _i461.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i358.AuthRemoteDataSource>()));
    gh.factory<_i250.HomeRepository>(() => _i723.HomeRepositoryImpl(
        homeRemoteDataSource: gh<_i951.HomeRemoteDataSource>()));
    gh.factory<_i994.AddToCartUseCase>(() =>
        _i994.AddToCartUseCase(homeRepository: gh<_i250.HomeRepository>()));
    gh.factory<_i823.GetAllBrandsUseCase>(() =>
        _i823.GetAllBrandsUseCase(homeRepository: gh<_i250.HomeRepository>()));
    gh.factory<_i557.GetAllCategoriesUseCase>(() =>
        _i557.GetAllCategoriesUseCase(
            homeRepository: gh<_i250.HomeRepository>()));
    gh.factory<_i960.GetAllProductUseCase>(() =>
        _i960.GetAllProductUseCase(homeRepository: gh<_i250.HomeRepository>()));
    gh.factory<_i130.CartRepository>(() => _i47.CartRepositoryImpl(
        cartRemoteDataSource: gh<_i990.CartRemoteDataSource>()));
    gh.factory<_i826.LoginUseCase>(
        () => _i826.LoginUseCase(authRepository: gh<_i306.AuthRepository>()));
    gh.factory<_i772.RegisterUseCase>(() =>
        _i772.RegisterUseCase(authRepository: gh<_i306.AuthRepository>()));
    gh.factory<_i487.GetCartUseCase>(
        () => _i487.GetCartUseCase(cartRepository: gh<_i130.CartRepository>()));
    gh.factory<_i1013.DeleteItemInCartUseCase>(() =>
        _i1013.DeleteItemInCartUseCase(
            cartRepository: gh<_i130.CartRepository>()));
    gh.factory<_i668.UpdateCountInCartUseCase>(() =>
        _i668.UpdateCountInCartUseCase(
            cartRepository: gh<_i130.CartRepository>()));
    gh.factory<_i423.LoginScreenViewModel>(() =>
        _i423.LoginScreenViewModel(loginUseCase: gh<_i826.LoginUseCase>()));
    gh.factory<_i247.HomeTabViewModel>(() => _i247.HomeTabViewModel(
          getAllCategoriesUseCase: gh<_i557.GetAllCategoriesUseCase>(),
          getAllBrandsUseCase: gh<_i823.GetAllBrandsUseCase>(),
        ));
    gh.factory<_i304.CartScreenViewModel>(() => _i304.CartScreenViewModel(
          getCartUseCase: gh<_i487.GetCartUseCase>(),
          deleteItemInCartUseCase: gh<_i1013.DeleteItemInCartUseCase>(),
          updateCountInCartUseCase: gh<_i668.UpdateCountInCartUseCase>(),
        ));
    gh.factory<_i667.ProductScreenViewModel>(() => _i667.ProductScreenViewModel(
          getAllProductUseCase: gh<_i960.GetAllProductUseCase>(),
          addToCartUseCase: gh<_i994.AddToCartUseCase>(),
        ));
    gh.factory<_i570.RegisterScreenViewModel>(() =>
        _i570.RegisterScreenViewModel(
            registerUseCase: gh<_i772.RegisterUseCase>()));
    return this;
  }
}
