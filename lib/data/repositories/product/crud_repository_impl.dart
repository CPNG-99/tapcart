import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:tapcart/common/constants.dart';
import 'package:tapcart/common/exception.dart';
import 'package:tapcart/common/failure.dart';
import 'package:tapcart/data/datasources/product/prodcut_crud_helper.dart';
import 'package:tapcart/domain/entities/product/createDTO.dart';
import 'package:tapcart/domain/repositories/product/crud_product_repository.dart';

class CrudRepositoryImpl implements CrudRepository {
  final ProductCrudHelper productCrudHelper;

  CrudRepositoryImpl(this.productCrudHelper);

  @override
  Future<Either<Failure, void>> createProduct(CreateDTO payload) async {
    try {
      final result = await productCrudHelper.create(payload);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure(""));
    } on SocketException {
      return const Left(ConnectionFailure(CONNECTION_FAILED));
    }
  }

  @override
  Future<Either<Failure, void>> updateProduct(
      CreateDTO payload, String productId) async {
    try {
      final result = await productCrudHelper.update(payload, productId);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure(""));
    } on SocketException {
      return const Left(ConnectionFailure(CONNECTION_FAILED));
    }
  }
}
