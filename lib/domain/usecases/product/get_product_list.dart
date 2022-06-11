import 'package:dartz/dartz.dart';
import 'package:tapcart/common/failure.dart';
import 'package:tapcart/domain/entities/product/product.dart';
import 'package:tapcart/domain/repositories/product/product_repository.dart';

class GetProductList {
  final ProductRepository repository;

  GetProductList(this.repository);

  Future<Either<Failure, List<Product>>> execute(String storeId) {
    return repository.getProductList(storeId);
  }
}
