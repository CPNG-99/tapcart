part of 'store_detail_bloc.dart';

abstract class StoreDetailEvent extends Equatable {
  const StoreDetailEvent();

  @override
  List<Object> get props => [];
}

class OnGetStoreDetail extends StoreDetailEvent {
  final String id;

  const OnGetStoreDetail(this.id);
}
