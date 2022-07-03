import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tapcart/domain/entities/product/createDTO.dart';
import 'package:tapcart/domain/usecases/product/update_product.dart';

part 'update_product_event.dart';
part 'update_product_state.dart';

class UpdateProductBloc extends Bloc<UpdateProductEvent, UpdateProductState> {
  final UpdateProduct _updateProduct;

  UpdateProductBloc(this._updateProduct) : super(UpdateProductEmpty()) {
    on<OnUpdateProductEvent>((event, emit) async {
      final payload = event.payload;
      final productId = event.productId;

      emit(UpdateProductLoading());
      final result = await _updateProduct.execute(payload, productId);

      result.fold((failure) {
        emit(UpdateProductError(failure.message));
      }, (data) {
        emit(SuccessUpdate());
      });
    });
  }
}
