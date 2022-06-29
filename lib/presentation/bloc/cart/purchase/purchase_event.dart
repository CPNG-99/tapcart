part of 'purchase_bloc.dart';

abstract class PurchaseEvent extends Equatable {
  const PurchaseEvent();

  @override
  List<Object> get props => [];
}

class OnPurchase extends PurchaseEvent {
  final Cart payload;

  const OnPurchase(this.payload);
}
