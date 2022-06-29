part of 'purchase_bloc.dart';

abstract class PurchaseState extends Equatable {
  const PurchaseState();

  @override
  List<Object> get props => [];
}

class PurchaseEmpty extends PurchaseState {}

class PurchaseLoading extends PurchaseState {}

class PurchaseError extends PurchaseState {
  final String message;

  const PurchaseError(this.message);

  @override
  List<Object> get props => [message];
}

class HasPurchaseData extends PurchaseState {
  final PostCartResponse data;

  const HasPurchaseData(this.data);

  @override
  List<Object> get props => [data];
}
