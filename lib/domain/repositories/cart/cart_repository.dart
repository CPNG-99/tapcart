import 'package:dartz/dartz.dart';
import 'package:tapcart/common/failure.dart';
import 'package:tapcart/domain/entities/cart/cart.dart';
import 'package:tapcart/domain/entities/cart/get_cart.dart';

abstract class CartRepository {
  Future<Either<Failure, PostCartResponse>> purchase(Cart cart);
  Future<Either<Failure, GetCart>> getScanCart(String purchaseId);
}
