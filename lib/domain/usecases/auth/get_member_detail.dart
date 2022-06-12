import 'package:dartz/dartz.dart';
import 'package:tapcart/common/failure.dart';
import 'package:tapcart/domain/entities/store/store.dart';
import 'package:tapcart/domain/repositories/auth/auth_repository.dart';

class GetMemberDetail {
  final AuthRepository repository;

  const GetMemberDetail(this.repository);

  Future<Either<Failure, Store>> execute() {
    return repository.getUserInfo();
  }
}
