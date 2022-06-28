import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tapcart/domain/entities/store/store.dart';
import 'package:tapcart/domain/usecases/store/get_store_detail.dart';

part 'store_detail_state.dart';
part 'store_detail_event.dart';

class StoreDetailBloc extends Bloc<StoreDetailEvent, StoreDetailState> {
  final GetStoreDetail _getStoreDetail;

  StoreDetailBloc(this._getStoreDetail) : super(StoreDetailEmpty()) {
    on<OnGetStoreDetail>((event, emit) async {
      final id = event.id;

      emit(StoreDetailLoading());
      final result = await _getStoreDetail.execute(id);

      result.fold((failure) {
        emit(StoreDetailError(failure.message));
      }, (data) {
        emit(HasStoreDetail(data));
      });
    });
  }
}
