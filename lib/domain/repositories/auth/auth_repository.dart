import 'package:dartz/dartz.dart';
import 'package:tapcart/common/failure.dart';
import 'package:tapcart/domain/entities/Auth/auth.dart';
import 'package:tapcart/domain/entities/store/store.dart';

typedef AccessToken = String;

abstract class AuthRepository {
  Future<Either<Failure, AccessToken>> login(LoginDTO payload);
  Future<Either<Failure, Store>> getUserInfo();
}
