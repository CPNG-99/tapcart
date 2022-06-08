part of 'store_detail_bloc.dart';

abstract class StoreDetailState extends Equatable {
  const StoreDetailState();

  @override
  List<Object> get props => [];
}

class StoreDetailEmpty extends StoreDetailState {}

class StoreDetailLoading extends StoreDetailState {}

class StoreDetailError extends StoreDetailState {
  final String message;

  const StoreDetailError(this.message);

  @override
  List<Object> get props => [message];
}

class HasStoreDetail extends StoreDetailState {
  final Store result;

  const HasStoreDetail(this.result);

  @override
  List<Object> get props => [result];
}
