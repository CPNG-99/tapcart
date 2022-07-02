part of 'create_product_bloc.dart';

abstract class CreateProductEvent extends Equatable {
  const CreateProductEvent();

  @override
  List<Object> get props => [];
}

class OnCreateProductEvent extends CreateProductEvent {
  final CreateDTO payload;

  const OnCreateProductEvent(this.payload);
}