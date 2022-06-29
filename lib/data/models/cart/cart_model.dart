import 'package:equatable/equatable.dart';
import 'package:tapcart/domain/entities/cart/cart.dart';

class CartModel extends Equatable {
  final Cart cart;

  const CartModel({required this.cart});

  Map<String, dynamic> toJson() => {"products": cart};

  @override
  List<Object?> get props => [cart];
}

class PurchaseResponseModel extends Equatable {
  final String purchaseId;
  final String qrCode;

  const PurchaseResponseModel({required this.purchaseId, required this.qrCode});

  factory PurchaseResponseModel.fromJson(Map<String, dynamic> json) =>
      PurchaseResponseModel(
          purchaseId: json["purchase_id"], qrCode: json["qr_code"]);

  @override
  List<Object?> get props => [purchaseId, qrCode];
}
