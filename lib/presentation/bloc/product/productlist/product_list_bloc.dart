import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tapcart/domain/entities/product/product.dart';
import 'package:tapcart/domain/usecases/product/get_product_list.dart';

part 'product_list_state.dart';
part 'product_list_event.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final GetProductList _getProductList;

  ProductListBloc(this._getProductList) : super(ProductListEmpty()) {
    on<OnGetProductList>((event, emit) async {
      final storeId = event.storeId;

      emit(ProductListLoading());
      final result = await _getProductList.execute(storeId);

      result.fold((failure) {
        emit(ProductListError(failure.message));
      }, (data) {
        if (data.isEmpty) {
          emit(ProductListEmpty());
        } else {
          emit(HasProductList(data));
        }
      });
    });
  }
}
