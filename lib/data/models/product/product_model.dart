import 'package:equatable/equatable.dart';
import 'package:tapcart/domain/entities/product/product.dart';

class ProductModel extends Equatable {
  final List<ProductModelData> data;

  const ProductModel({required this.data});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      data: List<ProductModelData>.from((json["data"] as List)
          .map((product) => ProductModelData.fromJson(product))));

  @override
  List<Object?> get props => [data];
}

class ProductModelData extends Equatable {
  final String productId;
  final String productName;
  final String image;
  final int price;
  final bool isAvailable;
  final String storeId;

  const ProductModelData(
      {required this.productId,
      required this.productName,
      required this.image,
      required this.price,
      required this.isAvailable,
      required this.storeId});

  factory ProductModelData.fromJson(Map<String, dynamic> json) =>
      ProductModelData(
          productId: json["product_id"],
          productName: json["product_name"],
          image: json["image"],
          price: json["price"],
          isAvailable: json["is_available"],
          storeId: json["store_id"]);

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "image": image,
        "price": price,
        "is_available": isAvailable,
        "store_id": storeId,
      };

  Product toEntity() => Product(
      productId: productId,
      productName: productName,
      image: image,
      price: price,
      isAvailable: isAvailable,
      storeId: storeId);

  @override
  List<Object?> get props =>
      [productId, productName, image, price, isAvailable, storeId];
}
