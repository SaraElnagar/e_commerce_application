import 'package:connectivity/connectivity.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/widget/shared_preference_utils.dart';
import 'package:e_commerce_app/data/api_manager.dart';
import 'package:e_commerce_app/data/end_points.dart';
import 'package:e_commerce_app/data/model/AddToCartResponseDto.dart';
import 'package:e_commerce_app/data/model/ProductResponseDto.dart';
import 'package:e_commerce_app/domain/failures.dart';
import 'package:injectable/injectable.dart';

import '../../../model/CategoryOrBrandResponseDto.dart';
import '../abstract_classes/home_remote_data_source.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiManager apiManager;

  HomeRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, CategoryOrBrandResponseDto>>
      getAllCategories() async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        var response =
            await apiManager.getData(EndPoints.getAllCategories); // جيلي JSON
        var getAllCategoriesResponse = CategoryOrBrandResponseDto.fromJson(
            response.data); // حولته الي Object
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          /// success
          return right(getAllCategoriesResponse);
        } else {
          return left(
              ServerError(errorMessage: getAllCategoriesResponse.message!));
        }
      } else {
        /// no internet connection
        return left(NetworkError(
            errorMessage:
                "No Internet Connection, Please' 'check internet connection")); // NetworkError, Left
      }
    } catch (e) {
      return left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseDto>> getAllBrands() async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        var response = await apiManager.getData(EndPoints.getAllBrands);
        var getAllBrandsResponse =
            CategoryOrBrandResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          /// success
          return right(getAllBrandsResponse);
        } else {
          return left(ServerError(errorMessage: getAllBrandsResponse.message!));
        }
      } else {
        /// no internet connection
        return left(NetworkError(
            errorMessage:
                "No Internet Connection, Please' 'check internet connection")); // NetworkError, Left
      }
    } catch (e) {
      return left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, ProductResponseDto>> getAllProducts() async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult == ConnectivityResult.mobile ||
          checkResult == ConnectivityResult.wifi) {
        var response = await apiManager.getData(EndPoints.getAllProducts);
        var getAllProductsResponse = ProductResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          /// success
          return right(getAllProductsResponse);
        } else {
          // print(
          //     "server: ${left(ServerError(errorMessage: getAllProductsResponse.message!))}");
          return left(
              ServerError(errorMessage: getAllProductsResponse.message!));
        }
      } else {
        /// no internet connection
        // print("network: ${left(NetworkError(errorMessage: "No internet connection"))}");
        return left(NetworkError(
            errorMessage:
                "No Internet Connection, Please' 'check internet connection")); // NetworkError, Left
      }
    } catch (e) {
      // print("Exception catch: ${e.toString()}");
      // List<ProductEntity>? productsList;
      // print("Exception catch: $productsList");
      return left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, AddToCartResponseDto>> addToCart(
      String productId) async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult == ConnectivityResult.mobile ||
          checkResult == ConnectivityResult.wifi) {
        var token = SharedPreferenceUtils.getData(key: "token");
        var response = await apiManager.postData(EndPoints.addToCart,
            body: {"productId": productId}, headers: {"token": token});
        var addToCartResponse = AddToCartResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          /// success
          return right(addToCartResponse);
        } else {
          // print(
          //     "server: ${left(ServerError(errorMessage: addToCartResponse.message!))}");
          return left(ServerError(errorMessage: addToCartResponse.message!));
        }
      } else {
        /// no internet connection
        // print("network: ${left(NetworkError(errorMessage: "errorMessage"))}");
        return left(NetworkError(
            errorMessage:
                "No Internet Connection, Please' 'check internet connection")); // NetworkError, Left
      }
    } catch (e) {
      // print("Exception Catch: ${e.toString()}");
      // List<ProductEntity>? productsList;
      // print("Exception Catch: $productsList");
      return left(Failures(errorMessage: e.toString()));
    }
  }
}
