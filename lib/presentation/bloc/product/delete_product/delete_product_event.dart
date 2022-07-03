part of 'delete_product_bloc.dart';

abstract class DeleteProductEvent extends Equatable {
  const DeleteProductEvent();

  @override
  List<Object> get props => [];
}

class OnDeleteProductEvent extends DeleteProductEvent {
  final String productId;

  const OnDeleteProductEvent(this.productId);
}
