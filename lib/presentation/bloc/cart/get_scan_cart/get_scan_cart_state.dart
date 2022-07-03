part of 'get_scan_cart_bloc.dart';


abstract class GetScanCartState extends Equatable {
  const GetScanCartState();

  @override
  List<Object> get props => [];
}

class GetScanCartStateEmpty extends GetScanCartState {}

class GetScanCartStateLoading extends GetScanCartState {}

class GetScanCartStateError extends GetScanCartState {
  final String message;

  const GetScanCartStateError(this.message);

  @override
  List<Object> get props => [message];
}

class HasScanCart extends GetScanCartState {
  final GetCart result;

  const HasScanCart(this.result);

  @override
  List<Object> get props => [result];
}
