part of 'product_list_bloc.dart';

abstract class ProductListEvent extends Equatable {
  const ProductListEvent();

  @override
  List<Object> get props => [];
}

class OnGetProductList extends ProductListEvent {
  final String storeId;

  const OnGetProductList(this.storeId);
}
