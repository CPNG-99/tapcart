import 'package:equatable/equatable.dart';

class CreateDTO extends Equatable {

  final String productName;
  final String? image;
  final int price;
  final bool isAvailable;

  const CreateDTO(
      {
        required this.productName,
        required this.image,
        required this.price,
        required this.isAvailable,
      });

  @override
  List<Object?> get props =>
      [productName, image, price, isAvailable];
}
