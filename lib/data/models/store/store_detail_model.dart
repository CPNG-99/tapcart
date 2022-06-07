import 'package:equatable/equatable.dart';
import 'package:tapcart/domain/entities/store/store.dart';

class StoreModel extends Equatable {
  final StoreModelData data;

  const StoreModel({required this.data});

  factory StoreModel.fromJson(Map<String, dynamic> json) =>
      StoreModel(data: StoreModelData.fromJson(json["data"]));

  @override
  List<Object?> get props => [data];
}

class StoreModelData extends Equatable {
  final String storeId;
  final String storeName;
  final String storeAddress;
  final String openHours;
  final bool isOpen;
  final String qrCode;

  const StoreModelData(
      {required this.storeId,
      required this.storeName,
      required this.storeAddress,
      required this.openHours,
      required this.isOpen,
      required this.qrCode});

  factory StoreModelData.fromJson(Map<String, dynamic> json) => StoreModelData(
      storeId: json["store_id"],
      storeName: json["store_name"],
      storeAddress: json["store_address"],
      openHours: json["open_hours"],
      isOpen: json["is_open"],
      qrCode: json["qr_code"]);

  Map<String, dynamic> toJson() => {
        "store_id": storeId,
        "store_name": storeName,
        "store_address": storeAddress,
        "open_hours": openHours,
        "is_open": isOpen,
        "qr_code": qrCode,
      };

  Store toEntity() => Store(
      storeId: storeId,
      storeName: storeName,
      storeAddress: storeAddress,
      openHours: openHours,
      isOpen: isOpen,
      qrCode: qrCode);

  @override
  List<Object?> get props =>
      [storeId, storeName, storeAddress, openHours, isOpen, qrCode];
}
