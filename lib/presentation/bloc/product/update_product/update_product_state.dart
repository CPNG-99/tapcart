part of 'update_product_bloc.dart';

abstract class UpdateProductState extends Equatable {
  const UpdateProductState();

  @override
  List<Object> get props => [];
}

class UpdateProductEmpty extends UpdateProductState {}

class UpdateProductLoading extends UpdateProductState {}

class UpdateProductError extends UpdateProductState {
  final String message;

  const UpdateProductError(this.message);

  @override
  List<Object> get props => [message];
}

class SuccessUpdate extends UpdateProductState {}
