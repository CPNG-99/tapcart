import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final List<CartItems> products;

  const Cart(this.products);

  @override
  List<Object?> get props => [products];
}

class CartItems extends Equatable {
  final int quantity;
  final String productId;

  const CartItems(this.quantity, this.productId);

  @override
  List<Object?> get props => [quantity, productId];
}

class PostCartResponse extends Equatable {
  final String purhaseId;
  final String qrCode;

  const PostCartResponse(this.purhaseId, this.qrCode);

  @override
  List<Object?> get props => [purhaseId, qrCode];
}
