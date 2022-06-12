import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tapcart/domain/entities/store/store.dart';
import 'package:tapcart/domain/usecases/auth/get_member_detail.dart';

part 'member_detail_event.dart';
part 'member_detail_state.dart';

class MemberDetailBloc extends Bloc<MemberDetailEvent, MemberDetailState> {
  final GetMemberDetail _getMemberDetail;

  MemberDetailBloc(this._getMemberDetail) : super(MemberDetailEmpty()) {
    on<OnGetMemberDetail>((event, emit) async {
      emit(MemberDetailLoading());
      final result = await _getMemberDetail.execute();

      result.fold((failure) {
        emit(MemberDetailError(failure.message));
      }, (data) {
        emit(HasMemberDetailData(data));
      });
    });
  }
}
