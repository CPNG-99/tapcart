import 'dart:io';

import 'package:tapcart/common/exception.dart';
import 'package:tapcart/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:tapcart/data/datasources/store/store_remote_datasource.dart';
import 'package:tapcart/domain/entities/store/store.dart';
import 'package:tapcart/domain/repositories/store/store_repository.dart';

class StoreRepositoryImpl implements StoreRepository {
  final StoreRemoteDataSource remoteDataSource;

  StoreRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, Store>> getStoreDetail(String storeId) async {
    try {
      final result = await remoteDataSource.getStoreDetail(storeId);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(""));
    } on SocketException {
      return const Left(ConnectionFailure("Connection failed"));
    }
  }
}
