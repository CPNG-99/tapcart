import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tapcart/domain/entities/cart/get_cart.dart';
import 'package:tapcart/domain/usecases/cart/get_scan_cart.dart';

part 'get_scan_cart_event.dart';
part 'get_scan_cart_state.dart';

class GetScanCartBloc extends Bloc<GetScanCartEvent, GetScanCartState>{
  final GetScanCart _getScanCart;

  GetScanCartBloc(this._getScanCart) : super(GetScanCartStateEmpty()){
    on<OnGetScanCartEvent>((event, emit) async {
      final purchaseId = event.purchaseId;

      emit(GetScanCartStateLoading());
      final result  = await _getScanCart.execute(purchaseId);
      result.fold((failure) {
        emit(GetScanCartStateError(failure.message));
      }, (data) {
        if (data.getCartItems.isEmpty) {
          emit(GetScanCartStateEmpty());
        } else {
          emit(HasScanCart(data));
        }
      });
    });
  }
}