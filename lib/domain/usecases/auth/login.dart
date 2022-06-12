import 'package:dartz/dartz.dart';
import 'package:tapcart/common/failure.dart';
import 'package:tapcart/domain/entities/Auth/auth.dart';
import 'package:tapcart/domain/repositories/auth/auth_repository.dart';

class Login {
  final AuthRepository repository;

  const Login(this.repository);

  Future<Either<Failure, AccessToken>> execute(LoginDTO payload) {
    return repository.login(payload);
  }
}
