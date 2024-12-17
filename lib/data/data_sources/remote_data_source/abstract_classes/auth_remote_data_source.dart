import 'package:dartz/dartz.dart';

import '../../../../domain/entities/LoginResponseEntity.dart';
import '../../../../domain/entities/RegisterResponseEntity.dart';
import '../../../../domain/failures.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failures, RegisterResponseEntity>> register(String name,
      String email, String password, String rePassword, String phone);

  Future<Either<Failures, LoginResponseEntity>> login(
      String email, String password);
}
