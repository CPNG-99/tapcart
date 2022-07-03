import 'package:equatable/equatable.dart';
import 'package:tapcart/domain/entities/product/createDTO.dart';

class CreateProductModel extends Equatable {
  final CreateDTO _createDTO;

  const CreateProductModel(this._createDTO);

  Map<String, dynamic> toJson() => {
        "product_name": _createDTO.productName,
        "price": _createDTO.price,
        "is_available": _createDTO.isAvailable,
        "image": _createDTO.image,
      };

  @override
  List<Object?> get props => [_createDTO];
}
