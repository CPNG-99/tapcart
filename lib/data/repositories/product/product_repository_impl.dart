import 'dart:io';

import 'package:tapcart/common/exception.dart';
import 'package:tapcart/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:tapcart/data/datasources/product/product_remote_datasource.dart';
import 'package:tapcart/domain/entities/product/product.dart';
import 'package:tapcart/domain/repositories/product/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Product>>> getProductList(String storeId) async {
    try {
      final result = await remoteDataSource.getProductList(storeId);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(""));
    } on SocketException {
      return const Left(ConnectionFailure("Connection failed"));
    }
  }
}
