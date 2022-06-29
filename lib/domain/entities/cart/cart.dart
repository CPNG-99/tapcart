import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final List<CartItems> products;

  const Cart(this.products);

  @override
  List<Object?> get props => [products];
}

class CartItems extends Equatable {
  final int quantity;
  final int total;
  final String productName;
  final String image;
  final String productId;

  const CartItems(
      this.quantity, this.total, this.productName, this.image, this.productId);

  @override
  List<Object?> get props => [quantity, productName, image, productId, total];
}

class PostCartResponse extends Equatable {
  final String purhaseId;
  final String qrCode;

  const PostCartResponse(this.purhaseId, this.qrCode);

  @override
  List<Object?> get props => [purhaseId, qrCode];
}
