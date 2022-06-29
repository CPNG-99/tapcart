import 'dart:io';

import 'package:tapcart/common/constants.dart';
import 'package:tapcart/common/exception.dart';
import 'package:tapcart/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:tapcart/data/datasources/cart/cart_remote_datasource.dart';
import 'package:tapcart/domain/entities/cart/cart.dart';
import 'package:tapcart/domain/repositories/cart/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource remoteDataSource;

  CartRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, PostCartResponse>> purchase(Cart payload) async {
    try {
      final result = await remoteDataSource.purchase(payload);
      return Right(PostCartResponse(result.purchaseId, result.qrCode));
    } on ServerException {
      return const Left(ServerFailure(""));
    } on SocketException {
      return const Left(ConnectionFailure(CONNECTION_FAILED));
    }
  }
}
