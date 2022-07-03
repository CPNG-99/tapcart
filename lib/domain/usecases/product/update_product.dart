import 'package:dartz/dartz.dart';
import 'package:tapcart/common/failure.dart';
import 'package:tapcart/domain/entities/product/createDTO.dart';
import 'package:tapcart/domain/repositories/product/crud_product_repository.dart';

class UpdateProduct {
  final CrudRepository repository;

  const UpdateProduct(this.repository);

  Future<Either<Failure, void>> execute(CreateDTO payload, String productId) {
    return repository.updateProduct(payload, productId);
  }
}
