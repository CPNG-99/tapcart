import 'package:equatable/equatable.dart';
import 'package:tapcart/domain/entities/cart/cart.dart';
import 'package:tapcart/domain/entities/cart/get_cart.dart';

class CartModel extends Equatable {
  final Cart cart;

  const CartModel({required this.cart});

  Map<String, dynamic> toJson() =>
      {"products": cart.products.map((item) => encodeItem(item)).toList()};

  static Map<String, dynamic> encodeItem(CartItems item) {
    return {"quantity": item.quantity, "product_id": item.productId};
  }

  @override
  List<Object?> get props => [cart];
}

class PurchaseResponseModel extends Equatable {
  final String purchaseId;
  final String qrCode;

  const PurchaseResponseModel({required this.purchaseId, required this.qrCode});

  factory PurchaseResponseModel.fromJson(Map<String, dynamic> json) =>
      PurchaseResponseModel(
          purchaseId: json["purchase_id"], qrCode: json["qrCode"]);

  @override
  List<Object?> get props => [purchaseId, qrCode];
}
class ScanCartModel extends Equatable {

  final GetScanCartModel data;

  const ScanCartModel ({required this.data});

  factory ScanCartModel.fromJson(Map<String, dynamic> json) =>
      ScanCartModel(data: json["data"]);

  @override
  List<Object?> get props => [data];
}

class GetScanCartModel extends Equatable {
  final List<ScanCartModelData> items;
  final int total;

  const GetScanCartModel({required this.items, required this.total});

  factory GetScanCartModel.fromJson(Map<String, dynamic> json) =>
      GetScanCartModel(
        items: List<ScanCartModelData>.from((json["items"] as List)
          .map((cartItems) => ScanCartModelData.fromJson(cartItems))),
        total: json["total_price"]);

  @override
  List<Object?> get props => [items, total];
}

class ScanCartModelData extends Equatable {
  final int quantity;
  final int price;
  final String productName;
  final String image;
  final bool isAvailable;

  const ScanCartModelData({
      required this.quantity,
      required this.productName,
      required this.image,
      required this.isAvailable,
      required this.price
  });

  factory ScanCartModelData.fromJson(Map<String, dynamic> json) =>
      ScanCartModelData(
          productName: json["product_name"],
          image: json["image"],
          price: json["price"],
          isAvailable: json["is_available"],
          quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
    "product_name": productName,
    "image": image,
    "price": price,
    "is_available": isAvailable,
    "quantity": quantity,
  };

  GetCartItems toEntity() => GetCartItems(
      quantity: quantity,
      productName: productName,
      image: image,
      price: price,
      isAvailable: isAvailable,);

  @override
  List<Object?> get props =>
      [quantity, productName, image, price, isAvailable];
}