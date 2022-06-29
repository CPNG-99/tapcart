import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tapcart/domain/entities/cart/cart.dart';
import 'package:tapcart/domain/usecases/cart/submit_cart.dart';

part 'purchase_state.dart';
part 'purchase_event.dart';

class PurchaseBloc extends Bloc<PurchaseEvent, PurchaseState> {
  final CartPurchase _purchase;

  PurchaseBloc(this._purchase) : super(PurchaseEmpty()) {
    on<OnPurchase>((event, emit) async {
      final payload = event.payload;

      emit(PurchaseLoading());
      final result = await _purchase.execute(payload);

      result.fold((failure) {
        emit(PurchaseError(failure.message));
      }, (data) {
        emit(HasPurchaseData(data));
      });
    });
  }
}
