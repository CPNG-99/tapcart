import 'package:dartz/dartz.dart';
import 'package:tapcart/common/failure.dart';
import 'package:tapcart/domain/entities/product/createDTO.dart';

abstract class CrudRepository {
  Future<Either<Failure, void>> createProduct(CreateDTO payload);
  Future<Either<Failure, void>> updateProduct(
      CreateDTO payload, String productId);
}
