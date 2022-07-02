part of 'create_product_bloc.dart';

abstract class CreateProductState extends Equatable {
  const CreateProductState();

  @override
  List<Object> get props => [];
}

class CreateProductEmpty extends CreateProductState {}

class CreateProductLoading extends CreateProductState {}

class CreateProductError extends CreateProductState {
  final String message;

  const CreateProductError(this.message);

  @override
  List<Object> get props => [message];
}

class SuccessCreate extends CreateProductState {
}