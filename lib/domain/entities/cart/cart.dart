import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final String productId;
  final int qty;

  const Cart(this.productId, this.qty);

  @override
  List<Object?> get props => [productId, qty];

}