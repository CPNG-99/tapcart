part of 'update_product_bloc.dart';

abstract class UpdateProductEvent extends Equatable {
  const UpdateProductEvent();

  @override
  List<Object> get props => [];
}

class OnUpdateProductEvent extends UpdateProductEvent {
  final CreateDTO payload;
  final String productId;

  const OnUpdateProductEvent(this.payload, this.productId);
}
