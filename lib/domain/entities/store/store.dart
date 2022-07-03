import 'package:equatable/equatable.dart';

class Store extends Equatable {
  final String storeId;
  final String storeName;
  final String? storeAddress;
  final String? openHours;
  final String qrCode;
  final String image;

  const Store(
      {required this.storeId,
      required this.storeName,
      this.storeAddress,
      required this.image,
      required this.openHours,
      required this.qrCode});

  @override
  List<Object?> get props =>
      [storeId, storeName, storeAddress, openHours, qrCode, image];
}
