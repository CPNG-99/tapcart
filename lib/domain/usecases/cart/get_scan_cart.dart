import 'package:dartz/dartz.dart';
import 'package:tapcart/common/failure.dart';
import 'package:tapcart/domain/entities/cart/get_cart.dart';
import 'package:tapcart/domain/repositories/cart/cart_repository.dart';

class GetScanCart {
  final CartRepository repository;

  GetScanCart(this.repository);

  Future<Either<Failure, GetCart>> execute(String purchaseId) {
    return repository.getScanCart(purchaseId);
  }
}
