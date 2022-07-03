import 'package:equatable/equatable.dart';

class GetCart extends Equatable {
  final List<GetCartItems> getCartItems;
  final int total;

  const GetCart(this.getCartItems,this.total);

  @override
  List<Object?> get props => [getCartItems, total];
}

class GetCartItems extends Equatable{
  final int quantity;
  final String productName;
  final String image;
  final int price;
  final bool isAvailable;

  const GetCartItems({
    required this.quantity,
    required this.productName,
    required this.image,
    required this.price,
    required this.isAvailable});

  @override
  List<Object?> get props => [quantity, productName, image, price, isAvailable];
}
