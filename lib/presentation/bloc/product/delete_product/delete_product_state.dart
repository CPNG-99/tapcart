part of 'delete_product_bloc.dart';

abstract class DeleteProductState extends Equatable {
  const DeleteProductState();

  @override
  List<Object> get props => [];
}

class DeleteProductEmpty extends DeleteProductState {}

class DeleteProductLoading extends DeleteProductState {}

class DeleteProductError extends DeleteProductState {
  final String message;

  const DeleteProductError(this.message);

  @override
  List<Object> get props => [message];
}

class SuccessDelete extends DeleteProductState {}
