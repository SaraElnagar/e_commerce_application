import 'package:connectivity/connectivity.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/widget/shared_preference_utils.dart';
import 'package:e_commerce_app/data/api_manager.dart';
import 'package:e_commerce_app/data/end_points.dart';
import 'package:e_commerce_app/data/model/GetCartResponseDto.dart';
import 'package:e_commerce_app/domain/failures.dart';
import 'package:injectable/injectable.dart';

import '../abstract_classes/cart_remote_data_source.dart';

@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  ApiManager apiManager;

  CartRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, GetCartResponseDto>> getCart() async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        var token = SharedPreferenceUtils.getData(key: "token");
        var response = await apiManager.getData(EndPoints.addToCart,
            headers: {"token": token.toString()}); // جيلي JSON
        var getCartResponse =
            GetCartResponseDto.fromJson(response.data); // حولته الي Object
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          /// success
          return right(getCartResponse);
        } else {
          return left(ServerError(errorMessage: getCartResponse.message!));
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
  Future<Either<Failures, GetCartResponseDto>> deleteItemInCart(
      String productId) async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        var token = SharedPreferenceUtils.getData(key: "token");
        var response = await apiManager.deleteData(
            "${EndPoints.addToCart}/$productId",
            headers: {"token": token.toString()}); // جيلي JSON
        var deleteItemInCartResponse =
            GetCartResponseDto.fromJson(response.data); // حولته الي Object
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          /// success
          return right(deleteItemInCartResponse);
        } else {
          return left(
              ServerError(errorMessage: deleteItemInCartResponse.message!));
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
  Future<Either<Failures, GetCartResponseDto>> updateCountInCart(
      String productId, int count) async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        var token = SharedPreferenceUtils.getData(key: "token");

        var response = await apiManager.updateData(
            "${EndPoints.addToCart}/$productId",
            body: {"count": count.toString()},
            headers: {"token": token.toString()}); // جيلي JSON
        // var url = "${EndPoints.addToCart}/$productId";
        // print("Making request to URL: $url with count: $count");
        var updateCountInCartResponse =
            GetCartResponseDto.fromJson(response.data); // حولته الي Object
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          /// success
          return right(updateCountInCartResponse);
        } else {
          "server: ${left(ServerError(errorMessage: updateCountInCartResponse.message!))}";
          return left(
              ServerError(errorMessage: updateCountInCartResponse.message!));
        }
      } else {
        // print(
        //     "network: ${left(NetworkError(errorMessage: "No internet connection"))}");
        /// no internet connection
        return left(NetworkError(
            errorMessage:
                "No Internet Connection, Please' 'check internet connection")); // NetworkError, Left
      }
    } catch (e) {
      // print("Exception Catch: ${e.toString()}");
      return left(Failures(errorMessage: e.toString()));
    }
  }
}
