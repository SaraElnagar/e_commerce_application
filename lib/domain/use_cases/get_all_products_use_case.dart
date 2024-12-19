import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/ProductResponseEntity.dart';
import '../failures.dart';

@injectable
class GetAllProductUseCase {
  HomeRepository homeRepository;

  GetAllProductUseCase({required this.homeRepository});

  Future<Either<Failures, ProductResponseEntity>> invoke() {
    return homeRepository.getAllProducts();
  }
}
