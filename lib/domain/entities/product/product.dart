import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String productId;
  final String productName;
  final String? image;
  final int price;
  final bool isAvailable;
  final String storeId;

  const Product(
      {required this.productId,
      required this.productName,
      this.image,
      required this.price,
      required this.isAvailable,
      required this.storeId});

  @override
  List<Object?> get props =>
      [productId, productName, image, price, isAvailable, storeId];
}
