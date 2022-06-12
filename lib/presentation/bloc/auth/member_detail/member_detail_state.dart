part of 'member_detail_bloc.dart';

abstract class MemberDetailState extends Equatable {
  const MemberDetailState();

  @override
  List<Object> get props => [];
}

class MemberDetailEmpty extends MemberDetailState {}

class MemberDetailLoading extends MemberDetailState {}

class MemberDetailError extends MemberDetailState {
  final String message;

  const MemberDetailError(this.message);

  @override
  List<Object> get props => [message];
}

class HasMemberDetailData extends MemberDetailState {
  final Store result;

  const HasMemberDetailData(this.result);

  @override
  List<Object> get props => [result];
}
