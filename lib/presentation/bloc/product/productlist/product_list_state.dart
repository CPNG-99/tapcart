part of 'product_list_bloc.dart';

abstract class ProductListState extends Equatable {
  const ProductListState();

  @override
  List<Object> get props => [];
}

class ProductListEmpty extends ProductListState {}

class ProductListLoading extends ProductListState {}

class ProductListError extends ProductListState {
  final String message;

  const ProductListError(this.message);

  @override
  List<Object> get props => [message];
}

class HasProductList extends ProductListState {
  final List<Product> result;

  const HasProductList(this.result);

  @override
  List<Object> get props => [result];
}
