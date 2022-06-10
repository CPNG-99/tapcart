import 'package:dartz/dartz.dart';
import 'package:tapcart/common/failure.dart';
import 'package:tapcart/domain/entities/product/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProductList(String storeId);
}
