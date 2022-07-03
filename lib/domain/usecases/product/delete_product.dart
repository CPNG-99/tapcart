import 'package:dartz/dartz.dart';
import 'package:tapcart/common/failure.dart';
import 'package:tapcart/domain/repositories/product/crud_product_repository.dart';

class DeleteProduct {
  final CrudRepository repository;

  const DeleteProduct(this.repository);

  Future<Either<Failure, void>> execute(String productId) {
    return repository.deleteProduct(productId);
  }
}
