import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tapcart/domain/usecases/product/delete_product.dart';

part 'delete_product_event.dart';
part 'delete_product_state.dart';

class DeleteProductBloc extends Bloc<DeleteProductEvent, DeleteProductState> {
  final DeleteProduct _deleteProduct;

  DeleteProductBloc(this._deleteProduct) : super(DeleteProductEmpty()) {
    on<OnDeleteProductEvent>((event, emit) async {
      final payload = event.productId;

      emit(DeleteProductLoading());
      final result = await _deleteProduct.execute(payload);

      result.fold((failure) {
        emit(DeleteProductError(failure.message));
      }, (data) {
        emit(SuccessDelete());
      });
    });
  }
}
