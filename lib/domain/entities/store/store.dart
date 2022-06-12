import 'package:equatable/equatable.dart';

class Store extends Equatable {
  final String storeId;
  final String storeName;
  final String storeAddress;
  final String description;
  final bool isOpen;
  final String qrCode;

  const Store(
      {required this.storeId,
      required this.storeName,
      required this.storeAddress,
      required this.description,
      required this.isOpen,
      required this.qrCode});

  @override
  List<Object?> get props =>
      [storeId, storeName, storeAddress, description, isOpen, qrCode];
}
