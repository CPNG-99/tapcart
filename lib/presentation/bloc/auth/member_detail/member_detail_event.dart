part of 'member_detail_bloc.dart';

abstract class MemberDetailEvent extends Equatable {
  const MemberDetailEvent();

  @override
  List<Object> get props => [];
}

class OnGetMemberDetail extends MemberDetailEvent {
  const OnGetMemberDetail();
}
