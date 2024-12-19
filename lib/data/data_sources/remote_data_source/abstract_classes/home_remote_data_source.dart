import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/AddToCartResponseEntity.dart';

import '../../../../domain/entities/CategoryOrBrandResponseEntity.dart';
import '../../../../domain/entities/ProductResponseEntity.dart';
import '../../../../domain/failures.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategories();

  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands();

  Future<Either<Failures, ProductResponseEntity>> getAllProducts();

  Future<Either<Failures, AddToCartResponseEntity>> addToCart(String productId);
}
