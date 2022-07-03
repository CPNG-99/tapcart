part of 'get_scan_cart_bloc.dart';

abstract class GetScanCartEvent extends Equatable {
  const GetScanCartEvent();

  @override
  List<Object> get props => [];
}

class OnGetScanCartEvent extends GetScanCartEvent {
  final String purchaseId;

  const OnGetScanCartEvent(this.purchaseId);
}
