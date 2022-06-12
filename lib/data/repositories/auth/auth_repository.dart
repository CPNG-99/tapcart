import 'dart:io';

import 'package:tapcart/common/exception.dart';
import 'package:tapcart/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:tapcart/data/datasources/auth/auth_remote_datasource.dart';
import 'package:tapcart/domain/entities/Auth/auth.dart';
import 'package:tapcart/domain/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, AccessToken>> login(LoginDTO payload) async {
    try {
      final result = await remoteDataSource.login(payload);
      return Right(result.data.token);
    } on ServerException {
      return const Left(ServerFailure(""));
    } on SocketException {
      return const Left(ConnectionFailure("Connection failed"));
    }
  }
}
