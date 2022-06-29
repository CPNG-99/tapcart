import 'package:dartz/dartz.dart';
import 'package:tapcart/common/failure.dart';
import 'package:tapcart/domain/entities/cart/cart.dart';
import 'package:tapcart/domain/repositories/cart/cart_repository.dart';

class CartPurchase {
  final CartRepository repository;

  CartPurchase(this.repository);

  Future<Either<Failure, PostCartResponse>> execute(Cart cart) {
    return repository.purchase(cart);
  }
}
