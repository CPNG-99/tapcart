import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tapcart/domain/entities/product/createDTO.dart';
import 'package:tapcart/domain/usecases/product/create_product.dart';

part 'create_product_event.dart';
part 'create_product_state.dart';

class CreateProductBloc extends Bloc<CreateProductEvent, CreateProductState>{
  final CreateProduct _createProduct;

  CreateProductBloc(this._createProduct) : super(CreateProductEmpty()){
    on<OnCreateProductEvent>((event, emit) async {
      final payload = event.payload;

      emit(CreateProductLoading());
      final result = await _createProduct.execute(payload);

      result.fold((failure) {
        emit(CreateProductError(failure.message));
      }, (data) {
        emit(SuccessCreate());
      });
    });
  }
}